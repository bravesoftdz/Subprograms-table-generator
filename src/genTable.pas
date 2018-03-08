unit genTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,ComObj,
  Vcl.ExtCtrls;

type
  TTableGenForm = class(TForm)
    memoInpCode: TMemo;
    StringGrid1: TStringGrid;
    btnToExcel: TButton;
    btnGenTable: TButton;
    pnlBottom: TPanel;
    SaveDialog1: TSaveDialog;
    procedure btnToExcelClick(Sender: TObject);
    procedure btnGenTableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
      function GetExcelFileName: String;
  public
    { Public declarations }
  end;

var
  TableGenForm: TTableGenForm;
  isOK: boolean;
implementation

{$R *.dfm}



const
  EXCEL_FILE_EXT = '.xlsx';

function TTableGenForm.GetExcelFileName: String;
begin
  if SaveDialog1.Execute then
    Result := SaveDialog1.FileName;

  if LowerCase(ExtractFileExt(Result)) <> EXCEL_FILE_EXT then
    Result := Result + EXCEL_FILE_EXT;
end;


procedure TTableGenForm.btnToExcelClick(Sender: TObject);
var
 ExcelApp, Sheet: variant;
 Col, Row: Word;
begin
  // ��������� ��� � Excel ����!
  ExcelApp := CreateOleObject('Excel.Application');
  try
    ExcelApp.Visible := false;

    ExcelApp.Workbooks.Add;
    Sheet := ExcelApp.ActiveWorkbook.Worksheets[1];

    for Col := 0 to StringGrid1.ColCount - 1 do
      for Row := 0 to StringGrid1.RowCount - 1 do
        Sheet.Cells[Row + 1, Col + 1] := StringGrid1.Cells[Col, Row];

    ExcelApp.ActiveWorkbook.SaveAs(GetExcelFileName);

    ShowMessage('���������');
  finally
    ExcelApp.Application.Quit;
    ExcelApp := unassigned;
  end;
end;

procedure TTableGenForm.btnGenTableClick(Sender: TObject);
var i,j,k:integer;
    curr:string;
    b1, b2:integer;
begin
  //showmessage( inttostr( Length(memoInpCode.Text)) );
  j:=1;
  StringGrid1.Cells[0,0] := '��� ������������';
  StringGrid1.Cells[1,0] := '��������';
  StringGrid1.Cells[2,0] := '��������� ������������';
  for I := 0 to memoInpCode.Lines.Count-1 do
  begin
    if pos('implementation', memoInpCode.Lines[i]) > 0 then
    begin
      isOk := true;
    end;
    b1 := pos('PROCEDURE',AnsiUpperCase(memoInpCode.Lines[i]));
    b2 := pos('FUNCTION', memoInpCode.Lines[i]);
    if isOk and
    ( b1 > 0)
    or
    (b2 > 0) then
    begin
      curr:=  memoInpCode.Lines[i];
      curr := trim(curr);
      if (pos('(', curr) <> 0) and (pos(')', curr) = 0) then
      begin
        k:=1;
        while (pos(')', curr) = 0) do
        begin
          curr := curr + memoInpCode.Lines[i+k];
          inc(k);
        end;

      end;

      StringGrid1.Cells[2,j] := curr;
      // ������� ����� procedure, function ��� �������� ������������
      if b1 > 0 then
      begin
        delete(curr,1,b1+9);
      end
      else
      begin
        delete(curr,1,b1+9);
      end;
      curr := trim(curr);
      // ���� ��� ������� ��������� ����������� �����, ������� ���
      if (UpperCase(curr[1]) = 'T') and (pos('.', curr) <> 0) then
      begin
        delete(curr,1, pos('.', curr));
      end;
      // �������
      if pos('(', curr) <> 0 then
        curr := copy(curr,0, pos('(', curr)-1);
      StringGrid1.Cells[0,j] := curr;

      if pos('CLICK', AnsiUpperCase(curr)) > 0 then
        StringGrid1.Cells[1,j] := '��������� �����';
      if pos('CREATE', AnsiUpperCase(curr)) > 0 then
        StringGrid1.Cells[1,j] := '������� ��� �������� �����';
      if pos('MOUSE', AnsiUpperCase(curr)) > 0 then
        StringGrid1.Cells[1,j] := '��������� ������� ����';


      inc(j);
      stringGrid1.RowCount := j;
    end;

  end;

end;

procedure TTableGenForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  memoInpCode.Width := TableGenForm.Width div 2;
  StringGrid1.Left := memoInpCode.Width;
  StringGrid1.Width := TableGenForm.Width div 2;
  StringGrid1.DefaultColWidth := StringGrid1.Width div 3;
  memoinpcode.Height := TableGenForm.Height - pnlBottom.Height - 20;
  StringGrid1.Height := memoInpCode.Height;
  btnGenTable.Width := memoInpCode.Width;
  btnToExcel.Left := StringGrid1.Left;
  btnToExcel.Width := StringGrid1.Width;

end;

procedure TTableGenForm.FormCreate(Sender: TObject);
begin
  isOk := false;
end;

end.