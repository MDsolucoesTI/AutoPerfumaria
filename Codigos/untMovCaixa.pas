//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untMovCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmMovCaixa = class(TForm)
    lblOperador: TLabel;
    lblData: TLabel;
    lblHorario: TLabel;
    lblValor: TLabel;
    lblMotivo: TLabel;
    txtOperador: TDBText;
    txtData: TDBText;
    txtHorario: TDBText;
    rdgEspecie: TDBRadioGroup;
    txtValor: TDBText;
    edtMotivo: TDBEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    dbgDet_Mov: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure rdgEspecieEnter(Sender: TObject);
    procedure rdgEspecieExit(Sender: TObject);
    procedure edtMotivoEnter(Sender: TObject);
    procedure edtMotivoExit(Sender: TObject);
    procedure dbgDet_MovEnter(Sender: TObject);
    procedure dbgDet_MovExit(Sender: TObject);
    procedure dbgDet_MovKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovCaixa: TfrmMovCaixa;

implementation

uses untDMInloco, untPrincipal;

{$R *.DFM}

procedure TfrmMovCaixa.FormShow(Sender: TObject);
var
   Codigo: integer;
   Data,DataB: TDate;
begin
DMInloco.tblMovCaixa.Open;
DMInloco.tblDetMovCaixa.Open;
DMInloco.tblFuncionarios.Open;
DMInloco.tblMovCaixa.Last;
Codigo:=DMInloco.tblMovCaixaCod_Mov.Value;
Data:=DMInloco.tblMovCaixaData_Mov.Value;
DataB:=Date;
DMInloco.tblMovCaixa.Append;
DMInloco.tblMovCaixaData_Mov.Value:=DataB;
if data=DataB then
   DMInloco.tblMovCaixaCod_Mov.Value:=codigo+1
else
   DMInloco.tblMovCaixaCod_Mov.Value:=1;
DMInloco.tblMovCaixaHorario.Value:=time;
DMInloco.tblMovCaixaCod_Operador.Value:=operador;
DMInloco.tblMovCaixaValor_Total.Value:=0;
DMInloco.tblMovCaixa.Post;
for Codigo:=1 to 6 do
   begin
   DMInloco.tblDetMovCaixa.Append;
   DMInloco.tblDetMovCaixaCod_Forma_Pagto.Value:=Codigo;
   DMInloco.tblDetMovCaixaValor.Value:=0;
   DMInloco.tblDetMovCaixa.Post;
   end;
DMInloco.tblDetMovCaixa.First;
DMInloco.dscDetMovCaixa.AutoEdit:=True;
rdgEspecie.SetFocus;
end;

procedure TfrmMovCaixa.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.dscDetMovCaixa.AutoEdit:=False;
DMInloco.tblMovCaixa.Close;
DMInloco.tblDetMovCaixa.Close;
DMInloco.tblFuncionarios.Close;
Action:=caFree;
end;

procedure TfrmMovCaixa.btnCancelarClick(Sender: TObject);
var
   Confirma:integer;
begin
beep;
Confirma:=Application.MessageBox('Movimenta��o ser� cancelada. '+#13+
'Confirma?','Cancelamento de Registro',
mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   begin
   DMinloco.tblDetMovCaixa.First;
   while not DMinloco.tblDetMovCaixa.EOF do
      begin
      DMInloco.tblDetMovCaixa.Delete;
      end;
   DMInloco.tblMovCaixa.Delete;
   Close;
   end;
end;

procedure TfrmMovCaixa.btnOkClick(Sender: TObject);
var
   Confirma:integer;
begin
if DMInloco.tblMovCaixaEspecie_Mov.IsNull then
   begin
   beep;
   MessageDlg('Tipo da movimenta��o deve ser especificado!',mtError,[mbOK],0);
   rdgEspecie.SetFocus;
   end
else
   begin
   DMinloco.tblDetMovCaixa.First;
   while not DMinloco.tblDetMovCaixa.EOF do
      begin
      if DMInloco.tblDetMovCaixaValor.Value=0 then
         DMInloco.tblDetMovCaixa.Delete
      else
         DMInloco.tblDetMovCaixa.Next;
      end;
   if DMinloco.tblDetMovCaixa.IsEmpty then
      begin
      beep;
      Confirma:=Application.MessageBox('Valor Movimentado igual a R$ 0,00'+#13+
      'Essa Movimenta��o ser� desconsiderada. Confirma?','Cancelamento de Registro',
      mb_YesNo+mb_IconQuestion+mb_DefButton2);
      if Confirma=IDYES then
         begin
         DMInloco.tblMovCaixa.Delete;
         Close;
         end;
      end
   else
      Close;
   end;
end;

procedure TfrmMovCaixa.rdgEspecieEnter(Sender: TObject);
begin
DMInloco.tblMovCaixa.Edit;
end;

procedure TfrmMovCaixa.rdgEspecieExit(Sender: TObject);
begin
DMInloco.tblMovCaixa.Post;
end;

procedure TfrmMovCaixa.edtMotivoEnter(Sender: TObject);
begin
DMInloco.tblMovCaixa.Edit;
end;

procedure TfrmMovCaixa.edtMotivoExit(Sender: TObject);
begin
DMInloco.tblMovCaixa.Post;
end;

procedure TfrmMovCaixa.dbgDet_MovEnter(Sender: TObject);
begin
DMInloco.tblMovCaixa.Edit;
DMInloco.tblMovCaixaValor_Total.Value:=0;
DMInloco.tblMovCaixa.Post;
end;

procedure TfrmMovCaixa.dbgDet_MovExit(Sender: TObject);
begin
DMInloco.tblDetMovCaixa.First;
while not DMInloco.tblDetMovCaixa.EOF do
   begin
   DMInloco.tblMovCaixa.Edit;
   DMInloco.tblMovCaixaValor_Total.Value:=
   DMInloco.tblMovCaixaValor_Total.Value+
   DMInloco.tblDetMovCaixaValor.Value;
   DMInloco.tblMovCaixa.Post;
   DMInloco.tblDetMovCaixa.Next;
   end;
end;

procedure TfrmMovCaixa.dbgDet_MovKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
