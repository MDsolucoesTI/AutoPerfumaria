//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls, DBCtrls, Mask, Grids,
  DBGrids;

type
  TfrmCadFuncionarios = class(TForm)
    lblFunc: TLabel;
    lblSenha: TLabel;
    lblCodFunc: TLabel;
    Panel1: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    txtCodFunc: TDBText;
    btnTabela: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    lblApelido: TLabel;
    edtApelido: TDBEdit;
    edtFunc: TDBEdit;
    edtSenha: TDBEdit;
    rdgClassFuncionarios: TRadioGroup;
    Bevel1: TBevel;
    rdgCodigoAcesso: TDBRadioGroup;
    btnVoltar: TSpeedButton;
    dbgFuncionarios: TDBGrid;
    Label1: TLabel;
    edtComissao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtHENormal: TDBEdit;
    edtHEExcedente: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure rdgClassFuncionariosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtHEExcedenteKeyPress(Sender: TObject; var Key: Char);
    procedure edtHENormalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;
  Igual, Inclusao: Boolean;
  Apelido: String;

implementation

uses untDMInloco, untLocFuncionarios;

{$R *.DFM}

procedure Escrita;
begin
frmCadFuncionarios.btnPrimeiro.Enabled:=False;
frmCadFuncionarios.btnAnterior.Enabled:=False;
frmCadFuncionarios.btnProximo.Enabled:=False;
frmCadFuncionarios.btnUltimo.Enabled:=False;
frmCadFuncionarios.btnTabela.Enabled:=False;
frmCadFuncionarios.btnVoltar.Enabled:=False;
frmCadFuncionarios.btnLocalizar.Enabled:=False;
frmCadFuncionarios.btnEditar.Enabled:=False;
frmCadFuncionarios.btnExcluir.Enabled:=False;
frmCadFuncionarios.btnIncluir.Enabled:=False;
frmCadFuncionarios.btnSair.Enabled:=False;
frmCadFuncionarios.btnConfirmar.Enabled:=True;
frmCadFuncionarios.btnCancelar.Enabled:=True;
frmCadFuncionarios.rdgClassFuncionarios.Enabled:=False;
frmCadFuncionarios.edtFunc.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadFuncionarios.btnPrimeiro.Enabled:=True;
frmCadFuncionarios.btnAnterior.Enabled:=True;
frmCadFuncionarios.btnProximo.Enabled:=True;
frmCadFuncionarios.btnUltimo.Enabled:=True;
frmCadFuncionarios.btnTabela.Enabled:=True;
frmCadFuncionarios.btnVoltar.Enabled:=True;
frmCadFuncionarios.btnLocalizar.Enabled:=True;
frmCadFuncionarios.btnEditar.Enabled:=True;
frmCadFuncionarios.btnExcluir.Enabled:=True;
frmCadFuncionarios.btnIncluir.Enabled:=True;
frmCadFuncionarios.btnSair.Enabled:=True;
frmCadFuncionarios.btnConfirmar.Enabled:=False;
frmCadFuncionarios.btnCancelar.Enabled:=False;
frmCadFuncionarios.rdgClassFuncionarios.Enabled:=True;
frmCadFuncionarios.rdgClassFuncionarios.SetFocus;
end;

procedure TfrmCadFuncionarios.FormShow(Sender: TObject);
begin
DMInloco.tblFuncionarios.IndexName:='';
DMInloco.tblFuncionarios.Open;
DMInloco.tblFuncionarios.First;
SomenteLeitura;
rdgClassFuncionarios.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadFuncionarios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblFuncionarios.IndexName:='';
DMInloco.tblFuncionarios.Close;
Action:=caFree;
end;

procedure TfrmCadFuncionarios.rdgClassFuncionariosClick(Sender: TObject);
begin
   Case rdgClassFuncionarios.ItemIndex of
      0: DMInloco.tblFuncionarios.IndexName := '';
      1: DMInloco.tblFuncionarios.IndexName := 'Nome_Funcionario';
      2: DMInloco.tblFuncionarios.IndexName := 'Apelido_Funcionario';
   end;
   SomenteLeitura;
end;

procedure TfrmCadFuncionarios.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblFuncionarios.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadFuncionarios.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblFuncionarios.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblFuncionarios.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadFuncionarios.btnProximoClick(Sender: TObject);
begin
DMInloco.tblFuncionarios.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblFuncionarios.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadFuncionarios.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblFuncionarios.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadFuncionarios.btnEditarClick(Sender: TObject);
begin
Inclusao:=False;
Apelido:=Dminloco.tblFuncionariosApelido.AsString;
dbgFuncionarios.Visible:=False;
Escrita;
edtSenha.ReadOnly:=True;
DMInloco.tblFuncionarios.Edit;
end;

procedure TfrmCadFuncionarios.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Funcion�rio?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblFuncionarios.Delete;
end;

procedure TfrmCadFuncionarios.btnIncluirClick(Sender: TObject);
var
i,codigo:integer;
begin
dbgFuncionarios.Visible:=False;
Escrita;
Inclusao:=True;
DMInloco.tblFuncionarios.IndexName := '';
DMInloco.tblFuncionarios.Last;
codigo:=DMInloco.tblFuncionariosCod_Funcionario.AsInteger;
DMInloco.tblFuncionarios.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblFuncionariosCod_Funcionario.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblFuncionarios.Next;
   end;
DMInloco.tblFuncionarios.Append;
DMInloco.tblFuncionariosCod_Funcionario.AsInteger:=codigo+1;
DMInloco.tblFuncionariosComissao.Value:=0;
end;

procedure TfrmCadFuncionarios.btnConfirmarClick(Sender: TObject);
var
Apelido2:String;
CodAtual:Integer;
begin
if length(edtFunc.Text)=0 then
   begin
   beep;
   MessageDlg('Nome do Funcion�rio n�o pode estar vazio!',mtError,[mbOK],0);
   edtFunc.SetFocus;
   end
else if length(edtApelido.Text)=0 then
   begin
   beep;
   MessageDlg('Apelido do Funcion�rio n�o pode estar vazio!',mtError,[mbOK],0);
   edtApelido.SetFocus;
   end
else if length(edtSenha.Text)<>6 then
   begin
   beep;
   MessageDlg('Senha deve conter 6 d�gitos!',mtError,[mbOK],0);
   edtSenha.SetFocus;
   end
else if rdgCodigoAcesso.ItemIndex=-1 then
   begin
   beep;
   MessageDlg('Funcion�rio deve ter um C�digo de Acesso!',mtError,[mbOK],0);
   rdgCodigoAcesso.SetFocus;
   end
else
   begin
   DMInloco.tblFuncionarios.Post;
   DMInloco.tblFuncionarios.Edit;
   if DMInloco.tblFuncionariosComissao.IsNull then
      DMInloco.tblFuncionariosComissao.Value:=0;
   if DMInloco.tblFuncionariosValor_HENormal.IsNull then
      DMInloco.tblFuncionariosValor_HENormal.Value:=0;
   if DMInloco.tblFuncionariosValor_HEExcedente.IsNull then
      DMInloco.tblFuncionariosValor_HEExcedente.Value:=0;
   DMInloco.tblFuncionarios.Post;
   Apelido2:=DMInloco.tblFuncionariosApelido.AsString;
   CodAtual:=DMInloco.tblFuncionariosCod_Funcionario.Value;
   Igual:=False;
   if (DMInloco.tblFuncionarios.Locate('Apelido',Apelido2,[])) and
      (DMInloco.tblFuncionariosCod_Funcionario.Value<>CodAtual) then
      begin
      DMInloco.tblFuncionarios.FindKey([CodAtual]);
      Igual:=True;
      beep;
      MessageDlg('Apelido j� Existente!',mtError,[mbOK],0);
      DMInloco.tblFuncionarios.Edit;
      edtApelido.SetFocus;
      end
   else
      begin
      Case rdgClassFuncionarios.ItemIndex of
         1: DMInloco.tblFuncionarios.IndexName := 'Nome_Funcionario';
         2: DMInloco.tblFuncionarios.IndexName := 'Apelido_Funcionario';
      end;
      SomenteLeitura;
      edtSenha.ReadOnly:=False;
      if btnTabela.Down then
         dbgFuncionarios.Visible:=True;
      end;
   end;
end;

procedure TfrmCadFuncionarios.btnCancelarClick(Sender: TObject);
begin
if Igual then
   begin
   if Inclusao then
      DMInloco.tblFuncionarios.delete
   else
      begin
      DMInloco.tblFuncionariosApelido.AsString:=Apelido;
      DMInloco.tblFuncionarios.Post;
      end;
   Igual:=False;
   end
else
   begin
   DMInloco.tblFuncionarios.Cancel;
   end;
Case rdgClassFuncionarios.ItemIndex of
   1: DMInloco.tblFuncionarios.IndexName := 'Nome_Funcionario';
   2: DMInloco.tblFuncionarios.IndexName := 'Apelido_Funcionario';
end;
SomenteLeitura;
edtSenha.ReadOnly:=False;
if btnTabela.Down then
   dbgFuncionarios.Visible:=True;
end;

procedure TfrmCadFuncionarios.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadFuncionarios.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocFuncionarios, frmLocFuncionarios);
frmLocFuncionarios.ShowModal;
end;

procedure TfrmCadFuncionarios.btnTabelaClick(Sender: TObject);
begin
dbgFuncionarios.Visible:=True;
end;

procedure TfrmCadFuncionarios.btnVoltarClick(Sender: TObject);
begin
dbgFuncionarios.Visible:=False;
end;

procedure TfrmCadFuncionarios.edtComissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadFuncionarios.edtHEExcedenteKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadFuncionarios.edtHENormalKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
