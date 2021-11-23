//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untAlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmAlterarSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtSenha: TEdit;
    lblApelido: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNovaSenha1: TEdit;
    edtNovaSenha2: TEdit;
    Bevel1: TBevel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

uses untDMInloco;

{$R *.DFM}

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
DMInloco.tblFuncionarios.Open;
edtCodigo.Text:='';
edtSenha.Text:='';
edtNovaSenha1.Text:='';
edtNovaSenha2.Text:='';
lblApelido.Caption:='';
btnOk.Enabled:=False;
edtSenha.ReadOnly:=True;
edtNovaSenha1.ReadOnly:=True;
edtNovaSenha2.ReadOnly:=True;
end;

Procedure TfrmAlterarSenha.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblFuncionarios.Close;
Action:=caFree;
end;

procedure TfrmAlterarSenha.edtCodigoExit(Sender: TObject);
begin
if length(edtCodigo.Text)<>0 then
   if not DMInloco.tblFuncionarios.FindKey([StrToInt(edtCodigo.Text)]) then
      begin
      beep;
      MessageDlg('C�digo inexistente!',mtError,[mbOK],0);
      edtCodigo.SetFocus;
      end
   else
      begin
      btnOk.Enabled:=True;
      edtSenha.ReadOnly:=False;
      edtNovaSenha1.ReadOnly:=False;
      edtNovaSenha2.ReadOnly:=False;
      lblApelido.Caption:=DMInloco.tblFuncionariosApelido.AsString;
      end;
end;

procedure TfrmAlterarSenha.btnOkClick(Sender: TObject);
begin
if edtSenha.Text<>DMInloco.tblFuncionariosSenha.Value then
   begin
   beep;
   MessageDlg('Senha inv�lida!',mtError,[mbOK],0);
   edtSenha.Text:='';
   edtSenha.SetFocus;
   end
else if length(edtNovaSenha1.Text)<>6 then
   begin
   beep;
   MessageDlg('Senha deve conter 6 d�gitos!',mtError,[mbOK],0);
   edtNovaSenha1.Text:='';
   edtNovaSenha2.Text:='';
   edtNovaSenha1.SetFocus;
   end
else if edtNovaSenha2.Text<>edtNovaSenha1.Text then
   begin
   beep;
   MessageDlg('Nova senha n�o confere.'+#13+'Favor digitar novamente.',mtError,
   [mbOK],0);
   edtNovaSenha1.Text:='';
   edtNovaSenha2.Text:='';
   edtNovaSenha1.SetFocus;
   end
else
   begin
   DMInloco.tblFuncionarios.Edit;
   DMInloco.tblFuncionariosSenha.Value:=edtNovaSenha1.Text;
   DMInloco.tblFuncionarios.Post;
   Close;
   end;
end;

procedure TfrmAlterarSenha.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmAlterarSenha.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
