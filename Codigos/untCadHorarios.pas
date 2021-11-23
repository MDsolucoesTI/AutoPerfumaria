//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadHorarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, ComCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmCadHorarios = class(TForm)
    lblFuncionario: TLabel;
    lblData: TLabel;
    grbHorarios: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtPeriodo1: TDBEdit;
    edtPeriodo2: TDBEdit;
    edtPeriodo3: TDBEdit;
    edtPeriodo4: TDBEdit;
    txtFuncionario: TDBText;
    lblObservacao: TLabel;
    edtObservacoes: TDBEdit;
    Bevel1: TBevel;
    Panel1: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    txtData: TDBText;
    edtData: TMaskEdit;
    cmbFuncionario: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure cmbFuncionarioClick(Sender: TObject);
    procedure edtPeriodo1Exit(Sender: TObject);
    procedure edtPeriodo2Exit(Sender: TObject);
    procedure edtPeriodo3Exit(Sender: TObject);
    procedure edtPeriodo4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadHorarios: TfrmCadHorarios;
  Acesso:String;
  Cancelado:Boolean;

implementation

uses untDMInloco, untPrincipal;

{$R *.DFM}

procedure Escrita;
begin
frmCadHorarios.btnProximo.Enabled:=False;
frmCadHorarios.btnUltimo.Enabled:=False;
frmCadHorarios.btnPrimeiro.Enabled:=False;
frmCadHorarios.btnAnterior.Enabled:=False;
frmCadHorarios.btnAlterar.Enabled:=False;
frmCadHorarios.btnNovo.Enabled:=False;
frmCadHorarios.btnSair.Enabled:=False;
frmCadHorarios.btnOk.Enabled:=True;
frmCadHorarios.btnCancelar.Enabled:=True;
frmCadHorarios.cmbFuncionario.Visible:=False;
if DMInloco.tblFuncHorariosPeriodo1.IsNull then
   frmCadHorarios.edtPeriodo1.SetFocus
else if DMInloco.tblFuncHorariosPeriodo2.IsNull then
   frmCadHorarios.edtPeriodo2.SetFocus
else if DMInloco.tblFuncHorariosPeriodo3.IsNull then
   frmCadHorarios.edtPeriodo3.SetFocus
else if DMInloco.tblFuncHorariosPeriodo4.IsNull then
   frmCadHorarios.edtPeriodo4.SetFocus
else
   frmCadHorarios.edtPeriodo1.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadHorarios.btnProximo.Enabled:=True;
frmCadHorarios.btnUltimo.Enabled:=True;
frmCadHorarios.btnPrimeiro.Enabled:=True;
frmCadHorarios.btnAnterior.Enabled:=True;
frmCadHorarios.btnAlterar.Enabled:=True;
frmCadHorarios.btnNovo.Enabled:=True;
frmCadHorarios.btnSair.Enabled:=True;
frmCadHorarios.btnOk.Enabled:=False;
frmCadHorarios.btnCancelar.Enabled:=False;
frmCadHorarios.edtData.Visible:=False;
frmCadHorarios.cmbFuncionario.Visible:=True;
end;

procedure TfrmCadHorarios.FormShow(Sender: TObject);
begin
Cancelado:=False;
DMInloco.tblFuncionarios.Open;
DMInloco.tblFuncionarios.FindKey([Operador]);
Acesso:=DMInloco.tblFuncionariosCod_Acesso.Value;
DMInloco.tblFuncHorarios.Open;
DMInloco.tblFuncHorarios.Last;
if DMInloco.tblFuncHorariosData.Value<date then
   begin
   DMInloco.tblFuncHorarios.Append;
   DMInloco.tblFuncHorariosCod_Funcionario.Value:=Operador;
   DMInloco.tblFuncHorariosData.Value:=date;
   DMInloco.tblFuncHorarios.Post;
   end;
Escrita;
DMInloco.tblFuncHorarios.Edit;
end;

procedure TfrmCadHorarios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblFuncionarios.Close;
DMInloco.tblFuncHorarios.Close;
Action:=caFree;
end;

procedure TfrmCadHorarios.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadHorarios.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblFuncHorarios.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadHorarios.btnProximoClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblFuncHorarios.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadHorarios.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadHorarios.btnOkClick(Sender: TObject);
var
   Erro:Boolean;
begin
Erro:=False;
DMInloco.tblFuncHorarios.Post;
if (DMInloco.tblFuncHorariosPeriodo1.IsNull) and
   (DMInloco.tblFuncHorariosPeriodo2.IsNull) and
   (DMInloco.tblFuncHorariosPeriodo3.IsNull) and
   (DMInloco.tblFuncHorariosPeriodo4.IsNull) and
   (DMInloco.tblFuncHorariosObservacoes.IsNull) then
   DMInloco.tblFuncHorarios.Delete
else
   begin
   if (DMInloco.tblFuncHorariosPeriodo1.IsNull) then
    begin
    if not DMInloco.tblFuncHorariosPeriodo2.IsNull then
       begin
       beep;
       MessageDlg('Hor�rio de entrada deve ser preenchido!',mtError,[mbOK],0);
       erro:=True;
       edtPeriodo1.SetFocus;
       end
    else if (DMInloco.tblFuncHorariosPeriodo3.IsNull) and
        (not DMInloco.tblFuncHorariosPeriodo4.IsNull) then
       begin
       beep;
       MessageDlg('Hor�rio de entrada deve ser preenchido!',mtError,[mbOK],0);
       erro:=True;
       edtPeriodo1.SetFocus;
       end
    end
   else
    begin
    if (DMInloco.tblFuncHorariosPeriodo2.IsNull) and
       (not DMInloco.tblFuncHorariosPeriodo3.IsNull) then
       begin
       beep;
       MessageDlg('Hor�rio de almo�o deve ser preenchido!',mtError,[mbOK],0);
       erro:=True;
       edtPeriodo2.SetFocus;
       end
    else if (DMInloco.tblFuncHorariosPeriodo3.IsNull) and
        (not DMInloco.tblFuncHorariosPeriodo2.IsNull) and
        (not DMInloco.tblFuncHorariosPeriodo4.IsNull)then
       begin
       beep;
       MessageDlg('Hor�rio de retorno deve ser preenchido!',mtError,[mbOK],0);
       erro:=True;
       edtPeriodo3.SetFocus;
       end
    end;
   end;
if Erro then
   DMInloco.tblFuncHorarios.Edit
else
   if Acesso='T' then
      begin
      SomenteLeitura;
      cmbFuncionario.SetFocus;
      end
   else
      Close;
end;

procedure TfrmCadHorarios.btnCancelarClick(Sender: TObject);
begin
Cancelado:=True;
DMInloco.tblFuncHorarios.Cancel;
if (DMInloco.tblFuncHorariosPeriodo1.IsNull) and
   (DMInloco.tblFuncHorariosPeriodo2.IsNull) and
   (DMInloco.tblFuncHorariosPeriodo3.IsNull) and
   (DMInloco.tblFuncHorariosPeriodo4.IsNull) then
   DMInloco.tblFuncHorarios.Delete;
if Acesso='T' then
   begin
   SomenteLeitura;
   cmbFuncionario.SetFocus;
   end
else
   Close;
end;

procedure TfrmCadHorarios.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadHorarios.btnAlterarClick(Sender: TObject);
begin
Escrita;
DMInloco.tblFuncHorarios.Edit;
end;

procedure TfrmCadHorarios.btnNovoClick(Sender: TObject);
begin
Escrita;
Cancelado:=False;
DMInloco.tblFuncHorarios.Append;
DMInloco.tblFuncHorariosCod_Funcionario.Value:=
DMinloco.tblFuncionariosCod_Funcionario.Value;
DMInloco.tblFuncHorarios.Post;
edtData.Visible:=True;
edtData.SetFocus;
end;

procedure TfrmCadHorarios.edtDataExit(Sender: TObject);
var
   reg:TBookMark;
begin
if not Cancelado then
   begin
   if edtData.Text='  /  /    ' then
      begin
      beep;
      MessageDlg('Data deve ser preenchida!',mtError,[mbOK],0);
      edtData.SetFocus;
      end
   else if StrToDate(edtData.Text)>date then
      begin
      beep;
      MessageDlg('Data ainda n�o ocorrida!',mtError,[mbOK],0);
      edtData.SetFocus;
      end
   else
      begin
      reg:=DMInloco.tblFuncHorarios.GetBookmark;
      if DMInloco.tblFuncHorarios.FindKey
      ([DMInloco.tblFuncionariosCod_Funcionario.Value,StrToDate(edtData.Text)]) then
         begin
         beep;
         MessageDlg('Data j� cadastrada!',mtError,[mbOK],0);
         DMInloco.tblFuncHorarios.GotoBookmark(reg);
         DMinloco.tblFuncHorarios.Delete;
         SomenteLeitura;
         end
      else
         begin
         DMInloco.tblFuncHorarios.GotoBookmark(reg);
         DMInloco.tblFuncHorarios.Edit;
         DMInloco.tblFuncHorariosData.Value:=StrToDate(edtData.Text);
         edtPeriodo1.SetFocus;
         end;
      edtData.Clear;
      edtData.Visible:=False;
      DMInloco.tblFuncHorarios.FreeBookmark(reg);
      end;
   end
else
   Cancelado:=False;
end;

procedure TfrmCadHorarios.cmbFuncionarioClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Last;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadHorarios.edtPeriodo1Exit(Sender: TObject);
begin
if edtPeriodo1.Text<>'  :  ' then
   begin
   if ((not DMInloco.tblFuncHorariosPeriodo2.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo1.Value>
       DMInloco.tblFuncHorariosPeriodo2.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo3.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo1.Value>
       DMInloco.tblFuncHorariosPeriodo3.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo4.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo1.Value>
       DMInloco.tblFuncHorariosPeriodo4.Value)) then
       begin
       beep;
       MessageDlg('Hor�rio inv�lido!',mtError,[mbOK],0);
       edtPeriodo1.SetFocus;
       end;
   end;
end;

procedure TfrmCadHorarios.edtPeriodo2Exit(Sender: TObject);
begin
if edtPeriodo2.Text<>'  :  ' then
   begin
   if ((not DMInloco.tblFuncHorariosPeriodo1.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo2.Value<
       DMInloco.tblFuncHorariosPeriodo1.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo3.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo2.Value>
       DMInloco.tblFuncHorariosPeriodo3.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo4.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo2.Value>
       DMInloco.tblFuncHorariosPeriodo4.Value)) then
       begin
       beep;
       MessageDlg('Hor�rio inv�lido!',mtError,[mbOK],0);
       edtPeriodo2.SetFocus;
       end;
   end;
end;

procedure TfrmCadHorarios.edtPeriodo3Exit(Sender: TObject);
begin
if edtPeriodo3.Text<>'  :  ' then
   begin
   if ((not DMInloco.tblFuncHorariosPeriodo1.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo3.Value<
       DMInloco.tblFuncHorariosPeriodo1.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo2.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo3.Value<
       DMInloco.tblFuncHorariosPeriodo2.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo4.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo3.Value>
       DMInloco.tblFuncHorariosPeriodo4.Value)) then
       begin
       beep;
       MessageDlg('Hor�rio inv�lido!',mtError,[mbOK],0);
       edtPeriodo3.SetFocus;
       end;
   end;
end;

procedure TfrmCadHorarios.edtPeriodo4Exit(Sender: TObject);
begin
if edtPeriodo4.Text<>'  :  ' then
   begin
   if ((not DMInloco.tblFuncHorariosPeriodo1.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo4.Value<
       DMInloco.tblFuncHorariosPeriodo1.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo2.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo4.Value<
       DMInloco.tblFuncHorariosPeriodo2.Value)) or
       ((not DMInloco.tblFuncHorariosPeriodo3.IsNull) and
      (DMInloco.tblFuncHorariosPeriodo4.Value<
       DMInloco.tblFuncHorariosPeriodo3.Value)) then
       begin
       beep;
       MessageDlg('Hor�rio inv�lido!',mtError,[mbOK],0);
       edtPeriodo4.SetFocus;
       end;
   end;
end;

end.
