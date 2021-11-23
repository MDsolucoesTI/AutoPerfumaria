//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtSenha: TEdit;
    lblApelido: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

uses untMovCaixa, untDMInloco, untPrincipal;

{$R *.DFM}

procedure TfrmSenha.FormShow(Sender: TObject);
begin
DMInloco.tblFuncionarios.Open;
edtCodigo.Text:='';
edtSenha.Text:='';
lblApelido.Caption:='';
btnOk.Enabled:=False;
edtSenha.ReadOnly:=True;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DMInloco.tblFuncionarios.Close;
Action:=caFree;
end;

procedure TfrmSenha.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmSenha.edtCodigoExit(Sender: TObject);
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
      lblApelido.Caption:=DMInloco.tblFuncionariosApelido.AsString;
      end;
end;

procedure TfrmSenha.btnOkClick(Sender: TObject);
begin
if DMInloco.tblFuncionariosSenha.AsString=edtSenha.Text then
   begin
   operador:=DMInloco.tblFuncionariosCod_Funcionario.Value;
   frmPrincipal.Arquivo.Visible:=True;
   frmPrincipal.Compras.Visible:=True;
   frmPrincipal.Vendas.Visible:=True;
   frmPrincipal.Funcionarios.Visible:=True;
   frmPrincipal.Configuracoes.Visible:=True;
   frmPrincipal.Ajuda.Visible:=True;
   if DMInloco.tblFuncionariosCod_Acesso.Value='T' then
      begin
      frmPrincipal.Financas.Visible:=True;
      frmPrincipal.CadFornecedores.Visible:=True;
      frmPrincipal.CadFuncionarios.Visible:=True;
      frmPrincipal.N1.Visible:=True;
      frmPrincipal.CadProdutos.Visible:=True;
      frmPrincipal.CadPropriedades.Visible:=True;
      frmPrincipal.AlterarPrecos.Visible:=True;
      frmPrincipal.MotivosOutrasEntradas.Visible:=True;
      frmPrincipal.MotivosOutrasSaidas.Visible:=True;
      frmPrincipal.N2.Visible:=True;
      frmPrincipal.CadConvenios.Visible:=True;
      frmPrincipal.CadBancos.Visible:=True;
      frmPrincipal.CadCartoesCredito.Visible:=True;
      frmPrincipal.N3.Visible:=True;
      frmPrincipal.CadRelatorios.Visible:=True;
//      frmPrincipal.CadMalaDireta.Visible:=True;
      frmPrincipal.cliEtiquetas.Visible:=True;
      frmPrincipal.CadPedidos.Visible:=True;
      frmPrincipal.CadRecebimento.Visible:=True;
      frmPrincipal.RelProdutosFalta.Visible:=True;
      frmPrincipal.CadOutrasSaidas.Visible:=True;
      frmPrincipal.MovCaixa.Visible:=True;
      frmPrincipal.N5.Visible:=True;
      frmPrincipal.FecharCaixa.Visible:=True;
      frmPrincipal.RelVendas.Visible:=True;
      frmPrincipal.ConsFaturamentos.Visible:=True;
//      frmPrincipal.EstatisticaVendas.Visible:=True;
      frmPrincipal.N8.Visible:=True;
      frmPrincipal.CalcComissao.Visible:=True;
      frmPrincipal.ConsHorario.Visible:=True;
      end
   else
      begin
      frmPrincipal.CadFornecedores.Visible:=False;
      frmPrincipal.CadFuncionarios.Visible:=False;
      frmPrincipal.N1.Visible:=False;
      frmPrincipal.CadProdutos.Visible:=False;
      frmPrincipal.CadPropriedades.Visible:=False;
      frmPrincipal.AlterarPrecos.Visible:=False;
      frmPrincipal.MotivosOutrasEntradas.Visible:=False;
      frmPrincipal.MotivosOutrasSaidas.Visible:=False;
      frmPrincipal.N2.Visible:=False;
      frmPrincipal.CadConvenios.Visible:=False;
      frmPrincipal.CadBancos.Visible:=False;
      frmPrincipal.CadCartoesCredito.Visible:=False;
      frmPrincipal.N3.Visible:=False;
      frmPrincipal.CadRelatorios.Visible:=False;
      frmPrincipal.cliEtiquetas.Visible:=False;
//      frmPrincipal.CadMalaDireta.Visible:=False;
      frmPrincipal.CadPedidos.Visible:=False;
      frmPrincipal.CadRecebimento.Visible:=False;
      frmPrincipal.RelProdutosFalta.Visible:=False;
      frmPrincipal.CadOutrasSaidas.Visible:=False;
      frmPrincipal.MovCaixa.Visible:=False;
      frmPrincipal.N5.Visible:=False;
      frmPrincipal.FecharCaixa.Visible:=False;
      frmPrincipal.RelVendas.Visible:=False;
      frmPrincipal.ConsFaturamentos.Visible:=False;
//      frmPrincipal.EstatisticaVendas.Visible:=False;
      frmPrincipal.N8.Visible:=False;
      frmPrincipal.CalcComissao.Visible:=False;
      frmPrincipal.ConsHorario.Visible:=False;
      end;
   DMInloco.tblFuncionarios.Close;
   frmPrincipal.btnAcessar.Visible:=False;
   Close;
   end
else
   begin
   beep;
   MessageDlg('Senha inv�lida!',mtError,[mbOK],0);
   edtSenha.SetFocus;
   end;
end;

procedure TfrmSenha.btnCancelarClick(Sender: TObject);
begin
Close;
end;

end.
