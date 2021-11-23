//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadCtasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls, Mask, Spin;

type
  TfrmCadCtasPagar = class(TForm)
    lblCodigo: TLabel;
    lblFornecedor: TLabel;
    lblDescricao: TLabel;
    gpbPagamento: TGroupBox;
    gpbNf: TGroupBox;
    lblNf: TLabel;
    btnAdicionarNf: TSpeedButton;
    btnRemoverNf: TSpeedButton;
    btnRemoverTudo: TSpeedButton;
    edtDescricao: TDBEdit;
    cmbFornecedor: TDBLookupComboBox;
    txtCodigo: TDBText;
    grdNf: TDBGrid;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    dbgDetPagto: TDBGrid;
    lblValorTotal1: TLabel;
    lblValorPago: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    btnVoltar: TSpeedButton;
    pnlParcelas: TPanel;
    lblParcela: TLabel;
    txtParcela: TDBText;
    lblVencimento: TLabel;
    edtVencimento: TDBEdit;
    edtValor: TDBEdit;
    lblValor: TLabel;
    pnlTotal: TPanel;
    lblValorTotal: TLabel;
    edtValorTotal: TDBText;
    lblValorPedido: TLabel;
    txtValorPedido: TDBText;
    Label1: TLabel;
    edtNumParcelas: TSpinEdit;
    btnPrimeiro1: TSpeedButton;
    btnAnterior1: TSpeedButton;
    btnProximo1: TSpeedButton;
    btnUltimo1: TSpeedButton;
    edtNf: TEdit;
    btnExcluir1: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtNfChange(Sender: TObject);
    procedure btnAdicionarNfClick(Sender: TObject);
    procedure grdNfCellClick(Column: TColumn);
    procedure btnRemoverNfClick(Sender: TObject);
    procedure btnRemoverTudoClick(Sender: TObject);
    procedure cmbFornecedorExit(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure cmbFornecedorEnter(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtVencimentoExit(Sender: TObject);
    procedure btnPrimeiro1Click(Sender: TObject);
    procedure btnAnterior1Click(Sender: TObject);
    procedure btnProximo1Click(Sender: TObject);
    procedure btnUltimo1Click(Sender: TObject);
    procedure edtNumParcelasExit(Sender: TObject);
    procedure edtNfKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluir1Click(Sender: TObject);
    procedure pnlParcelasEnter(Sender: TObject);
  private
    valor:real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCtasPagar: TfrmCadCtasPagar;

implementation

uses untDMInloco, untCadRecebimento, untLocCtasPagar, untConsultarCaixa;

{$R *.DFM}

procedure Escrita;
begin
frmCadCtasPagar.btnPrimeiro.Enabled:=False;
frmCadCtasPagar.btnAnterior.Enabled:=False;
frmCadCtasPagar.btnProximo.Enabled:=False;
frmCadCtasPagar.btnUltimo.Enabled:=False;
frmCadCtasPagar.btnLocalizar.Enabled:=False;
frmCadCtasPagar.btnEditar.Enabled:=False;
frmCadCtasPagar.btnExcluir.Enabled:=False;
frmCadCtasPagar.btnIncluir.Enabled:=False;
frmCadCtasPagar.btnSair.Enabled:=False;
frmCadCtasPagar.btnConfirmar.Enabled:=True;
frmCadCtasPagar.btnCancelar.Enabled:=True;
frmCadCtasPagar.edtNf.ReadOnly:=False;
frmCadCtasPagar.cmbFornecedor.SetFocus;
frmCadCtasPagar.dbgDetPagto.Visible:=False;
end;

procedure SomenteLeitura;
begin
frmCadCtasPagar.btnPrimeiro.Enabled:=True;
frmCadCtasPagar.btnAnterior.Enabled:=True;
frmCadCtasPagar.btnProximo.Enabled:=True;
frmCadCtasPagar.btnUltimo.Enabled:=True;
frmCadCtasPagar.btnConfirmar.Enabled:=False;
frmCadCtasPagar.btnCancelar.Enabled:=False;
frmCadCtasPagar.btnLocalizar.Enabled:=True;
frmCadCtasPagar.btnEditar.Enabled:=True;
frmCadCtasPagar.btnExcluir.Enabled:=True;
frmCadCtasPagar.btnIncluir.Enabled:=True;
frmCadCtasPagar.btnSair.Enabled:=True;
frmCadCtasPagar.btnPrimeiro1.Enabled:=False;
frmCadCtasPagar.btnAnterior1.Enabled:=False;
frmCadCtasPagar.btnProximo1.Enabled:=False;
frmCadCtasPagar.btnUltimo1.Enabled:=False;
frmCadCtasPagar.btnExcluir1.Visible:=False;
frmCadCtasPagar.btnAdicionarNf.Enabled:=False;
frmCadCtasPagar.btnRemoverNf.Enabled:=False;
frmCadCtasPagar.btnRemoverTudo.Enabled:=False;
frmCadCtasPagar.dbgDetPagto.Visible:=True;
frmCadCtasPagar.pnlParcelas.Visible:=False;
frmCadCtasPagar.pnlTotal.Visible:=False;
frmCadCtasPagar.edtNumParcelas.Enabled:=True;
frmCadCtasPagar.edtNf.ReadOnly:=True;
end;

procedure TfrmCadCtasPagar.FormShow(Sender: TObject);
var
codigo:integer;
begin
DMInloco.tblCtaPagar.IndexName:='';
DMInloco.tblFornecedores.IndexName:='Descr_Fornecedor';
DMInloco.tblCtaPagar.Open;
DMInloco.tblDetCtaPagar.Open;
DMInloco.tblNfCtaPagar.Open;
DMInloco.tblFornecedores.Open;
if ConsMovFinanceira then
   begin
   DMInloco.tblCtaPagar.Locate
   ('Cod_Cta_Pagar',DMInloco.tblMovFinanceiraReferencia.Value,[]);
   btnPrimeiro.Visible:=False;
   btnAnterior.Visible:=False;
   btnProximo.Visible:=False;
   btnUltimo.Visible:=False;
   btnLocalizar.Visible:=False;
   btnEditar.Visible:=False;
   btnExcluir.Visible:=False;
   btnIncluir.Visible:=False;
   btnSair.Visible:=False;
   btnConfirmar.Visible:=False;
   btnCancelar.Visible:=False;
   btnVoltar.Visible:=True;
   end
else
   begin
   DMInloco.tblCtaPagar.Last;
   //Se abrir devido ao recebimento de pedido
   if Recebimento then
      begin
      Escrita;
      lblValorPedido.Visible:=True;
      txtValorPedido.Visible:=True;
      pnlParcelas.Visible:=False;
      codigo:=DMInloco.tblCtaPagarCod_Cta_Pagar.Value;
      DMInloco.tblCtaPagar.Append;
      DMInloco.tblCtaPagarCod_Cta_Pagar.Value:=codigo+1;
      DMInloco.tblCtaPagarCod_Fornecedor.Value:=
       DMInloco.tblPedidosCod_Fornecedor.Value;
      DMInloco.tblCtaPagarDescricao.Value:='Referente ao pedido n� '+
       InttoStr(DMInloco.tblPedidosCod_Pedido.Value);
      DMInloco.tblCtaPagarValor_Total.Value:=0;
      DMInloco.tblCtaPagarValor_Pago.Value:=0;
      DMInloco.tblCtaPagarQuitado.Value:=False;
      edtNumParcelas.SetFocus;
      end
   else
      begin
      SomenteLeitura;
      btnProximo.Enabled:=False;
      btnUltimo.Enabled:=False;
      end;
   end;
end;

procedure TfrmCadCtasPagar.FormClose(Sender: TObject;var Action: TCloseAction);
begin
lblValorPedido.Visible:=False;
txtValorPedido.Visible:=False;
DMInloco.tblCtaPagar.Close;
DMInloco.tblDetCtaPagar.Close;
DMInloco.tblNfCtaPagar.Close;
if not Recebimento then
   DMInloco.tblFornecedores.Close;
if ConsMovFinanceira then
   begin
   btnPrimeiro.Visible:=True;
   btnAnterior.Visible:=True;
   btnProximo.Visible:=True;
   btnUltimo.Visible:=True;
   btnLocalizar.Visible:=True;
   btnEditar.Visible:=True;
   btnExcluir.Visible:=True;
   btnIncluir.Visible:=True;
   btnSair.Visible:=True;
   btnConfirmar.Visible:=True;
   btnCancelar.Visible:=True;
   btnVoltar.Visible:=False;
   end;
Action:=caFree;
end;

procedure TfrmCadCtasPagar.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblCtaPagar.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadCtasPagar.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblCtaPagar.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblCtaPagar.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadCtasPagar.btnProximoClick(Sender: TObject);
begin
DMInloco.tblCtaPagar.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblCtaPagar.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadCtasPagar.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblCtaPagar.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadCtasPagar.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocCtasPagar, frmLocCtasPagar);
frmLocCtasPagar.ShowModal;
end;

procedure TfrmCadCtasPagar.btnEditarClick(Sender: TObject);
begin
if DMInloco.tblCtaPagarQuitado.Value=True then
   begin
   beep;
   MessageDlg('Conta quitada, n�o pode ser alterada!',mtError,[mbOK],0);
   end
else
   begin
   Escrita;
   btnCancelar.Enabled:=False;
   pnlParcelas.Visible:=True;
   btnExcluir1.Visible:=True;
   btnExcluir1.Enabled:=False;
   btnPrimeiro1.Enabled:=False;
   btnAnterior1.Enabled:=False;
   btnProximo1.Enabled:=True;
   btnUltimo1.Enabled:=True;
   DMInloco.tblDetCtaPagar.First;
   DMInloco.tblCtaPagar.Edit;
   cmbFornecedor.SetFocus;
   end;
end;

procedure TfrmCadCtasPagar.btnExcluirClick(Sender: TObject);
var
   Confirma:Integer;
   Pago:Boolean;
begin
Pago:=False;
DMInloco.tblDetCtaPagar.First;
While not DMInloco.tblDetCtaPagar.EOF do
   begin
   if not DMInloco.tblDetCtaPagarData_Pagto.IsNull then
      begin
      Pago:=True;
      Break;
      end;
   DMInloco.tblDetCtaPagar.Next;
   end;
if Pago=True then
   begin
   beep;
   MessageDlg('Conta j� tem parcela(s) paga(s), n�o pode ser excluida!',mtError,[mbOK],0);
   end
else
   begin
   Confirma:=Application.MessageBox('Deseja excluir essa Conta a Pagar?',
   'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      DMInloco.tblDetCtaPagar.First;
      While not DMInloco.tblDetCtaPagar.EOF do
         DMInloco.tblDetCtaPagar.Delete;
      DMInloco.tblNfCtaPagar.First;
      While not DMInloco.tblNfCtaPagar.EOF do
         DMInloco.tblNfCtaPagar.Delete;
      DMInloco.tblCtaPagar.Delete;
      end;
   end;
end;

procedure TfrmCadCtasPagar.btnIncluirClick(Sender: TObject);
var
codigo:integer;
begin
pnlTotal.Visible:=True;
Escrita;
DMInloco.tblCtaPagar.Last;
codigo:=DMInloco.tblCtaPagarCod_Cta_Pagar.Value;
DMInloco.tblCtaPagar.Append;
DMInloco.tblCtaPagarCod_Cta_Pagar.Value:=codigo+1;
DMInloco.tblCtaPagarValor_Total.Value:=0;
DMInloco.tblCtaPagarValor_Pago.Value:=0;
DMInloco.tblCtaPagarQuitado.Value:=False;
cmbFornecedor.SetFocus;
end;

procedure TfrmCadCtasPagar.btnConfirmarClick(Sender: TObject);
var
   confirma:integer;
begin
if Recebimento then
   begin
   if DMInloco.tblCtaPagarValor_Total.Value<>
   DMInloco.tblPedidosValor_Total.Value then
      begin
      Confirma:=Application.MessageBox
      ('Valor da Fatura difere do Valor do Pedido, continua?',
      'Aten��o!',mb_YesNo+mb_IconQuestion+mb_DefButton2);
      if Confirma=IDYES then
         begin
         DMInloco.tblDetCtaPagar.Post;
         Close;
         end;
      end
   else
      begin
      DMInloco.tblDetCtaPagar.Post;
      Close;
      end;
   end
else
   begin
   DMInloco.tblDetCtaPagar.Post;
   SomenteLeitura;
   end;
end;

procedure TfrmCadCtasPagar.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.First;
While not DMInloco.tblDetCtaPagar.EOF do
   DMInloco.tblDetCtaPagar.Delete;
DMInloco.tblNfCtaPagar.First;
While not DMInloco.tblNfCtaPagar.EOF do
   DMInloco.tblNfCtaPagar.Delete;
if Recebimento then
   begin
   DMInloco.tblCtaPagar.Edit;
   DMInloco.tblCtaPagarValor_Total.Value:=0;
   DMInloco.tblCtaPagar.Post;
   edtNumParcelas.Value:=1;
   edtNumParcelas.SetFocus;
   end
else
   begin
   DMInloco.tblCtaPagar.Delete;
   DMInloco.tblCtaPagar.Last;
   SomenteLeitura;
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadCtasPagar.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadCtasPagar.btnVoltarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadCtasPagar.cmbFornecedorExit(Sender: TObject);
begin
if length(cmbFornecedor.Text)=0 then
   begin
   beep;
   MessageDlg('Fornecedor n�o pode estar vazio!',mtError,[mbOK],0);
   cmbFornecedor.SetFocus;
   end
else
   DMInloco.tblCtaPagar.Post;
end;

procedure TfrmCadCtasPagar.edtDescricaoExit(Sender: TObject);
begin
if length(edtDescricao.Text)=0 then
   begin
   beep;
   MessageDlg('Descri��o n�o pode estar vazia!',mtError,[mbOK],0);
   edtDescricao.SetFocus;
   end
else
   DMInloco.tblCtaPagar.Post;
end;

procedure TfrmCadCtasPagar.edtValorEnter(Sender: TObject);
begin
Valor:=DMInloco.tblDetCtaPagarValor.Value;
end;

procedure TfrmCadCtasPagar.edtValorExit(Sender: TObject);
begin
if (DMInloco.tblDetCtaPagarValor.Value=0) or
   (DMInloco.tblDetCtaPagarValor.IsNull) then
   begin
   beep;
   MessageDlg('Valor da Parcela n�o pode ser R$ 0,00 !',mtError,[mbOK],0);
   edtValor.SetFocus;
   end
else
   begin
   DMInloco.tblDetCtaPagar.Post;
   DMInloco.tblCtaPagar.Edit;
   DMInloco.tblCtaPagarValor_Total.Value:=
   DMInloco.tblCtaPagarValor_Total.Value+
   DMInloco.tblDetCtaPagarValor.Value-valor;
   DMInloco.tblCtaPagar.Post;
   DMInloco.tblDetCtaPagar.Edit;
   edtVencimento.SetFocus;
   end;
end;

procedure TfrmCadCtasPagar.edtNfChange(Sender: TObject);
begin
if length(edtNf.Text) = 0 then
   btnAdicionarNf.Enabled:=False
else
   btnAdicionarNf.Enabled:=True;
end;

procedure TfrmCadCtasPagar.grdNfCellClick(Column: TColumn);
begin
btnRemoverNf.Enabled:=True;
end;

procedure TfrmCadCtasPagar.btnAdicionarNfClick(Sender: TObject);
var
   i:integer;
begin
if length(edtNf.Text)>0 then
   begin
   I:=Length(edtNf.Text);
   i:=8-i;
   edtNf.Text:=copy('00000000',1,i)+edtNf.Text;
   DMInloco.tblNfCtaPagar.First;
   if DMInloco.tblNfCtaPagar.Locate('Num_Nf',edtNf.Text,[]) then
      begin
      beep;
      MessageDlg('Nota Fiscal j� cadastrada!',mtError,[mbOK],0);
      end
   else
      begin
      DMInloco.tblNfCtaPagar.Append;
      DMInloco.tblNfCtaPagarCod_Cta_Pagar.Value:=
        DMInloco.tblCtaPagarCod_Cta_Pagar.Value;
      DMInloco.tblNfCtaPagarNum_Nf.Value:=StrToInt(edtNf.Text);
      DMInloco.tblNfCtaPagar.Post;
      btnRemoverTudo.Enabled:=True;
      end;
   btnAdicionarNf.Enabled:=False;
   edtNf.Text:='';
   end;
edtNf.SetFocus;
end;

procedure TfrmCadCtasPagar.btnRemoverNfClick(Sender: TObject);
begin
DMInloco.tblNfCtaPagar.Delete;
if DMInloco.tblNfCtaPagar.RecordCount=0 then
   btnRemoverTudo.Enabled:=False;
btnAdicionarNf.Enabled:=False;
btnRemoverNf.Enabled:=False;
edtNF.Text:='';
edtNf.SetFocus;
end;

procedure TfrmCadCtasPagar.btnRemoverTudoClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir todas as NFs dessa Conta?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   begin
   DMInloco.tblNfCtaPagar.First;
   While not DMInloco.tblNfCtaPagar.EOF do
      DMInloco.tblNfCtaPagar.Delete;
   end;
btnAdicionarNf.Enabled:=False;
btnRemoverTudo.Enabled:=False;
edtNf.Text:='';
edtNf.SetFocus;
end;

procedure TfrmCadCtasPagar.edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadCtasPagar.cmbFornecedorEnter(Sender: TObject);
begin
DMInloco.tblCtaPagar.Edit;
end;

procedure TfrmCadCtasPagar.edtDescricaoEnter(Sender: TObject);
begin
DMInloco.tblCtaPagar.Edit;
end;



procedure TfrmCadCtasPagar.edtVencimentoExit(Sender: TObject);
begin
if DMInloco.tblDetCtaPagarVencimento.IsNull then
   begin
   beep;
   MessageDlg('Data de Vencimento deve ser definida!',mtError,[mbOK],0);
   edtVencimento.SetFocus;
   end
end;

procedure TfrmCadCtasPagar.btnPrimeiro1Click(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.Post;
DMInloco.tblDetCtaPagar.First;
btnPrimeiro1.Enabled:=False;
btnAnterior1.Enabled:=False;
btnProximo1.Enabled:=True;
btnUltimo1.Enabled:=True;
if DMInloco.tblDetCtaPagarNum_Parcela.Value>1 then
   btnExcluir1.Enabled:=True
else
   btnExcluir1.Enabled:=False;
DMInloco.tblDetCtaPagar.Edit;
edtVencimento.SetFocus;
end;

procedure TfrmCadCtasPagar.btnAnterior1Click(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.Post;
DMInloco.tblDetCtaPagar.Prior;
btnProximo1.Enabled:=True;
btnUltimo1.Enabled:=True;
if DMInloco.tblDetCtaPagar.BOF then
   begin
   btnPrimeiro1.Enabled:=False;
   btnAnterior1.Enabled:=False;
   end;
if DMInloco.tblDetCtaPagarNum_Parcela.Value>1 then
   btnExcluir1.Enabled:=True
else
   btnExcluir1.Enabled:=False;
DMInloco.tblDetCtaPagar.Edit;
edtVencimento.SetFocus;
end;

procedure TfrmCadCtasPagar.btnProximo1Click(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.Post;
DMInloco.tblDetCtaPagar.Next;
btnPrimeiro1.Enabled:=True;
btnAnterior1.Enabled:=True;
if DMInloco.tblDetCtaPagar.EOF then
   begin
   btnProximo1.Enabled:=False;
   btnUltimo1.Enabled:=False;
   end;
if DMInloco.tblDetCtaPagarNum_Parcela.Value>1 then
   btnExcluir1.Enabled:=True
else
   btnExcluir1.Enabled:=False;
DMInloco.tblDetCtaPagar.Edit;
edtVencimento.SetFocus;
end;

procedure TfrmCadCtasPagar.btnUltimo1Click(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.Post;
DMInloco.tblDetCtaPagar.Last;
btnPrimeiro1.Enabled:=True;
btnAnterior1.Enabled:=True;
btnProximo1.Enabled:=False;
btnUltimo1.Enabled:=False;
if DMInloco.tblDetCtaPagarNum_Parcela.Value>1 then
   btnExcluir1.Enabled:=True
else
   btnExcluir1.Enabled:=False;
DMInloco.tblDetCtaPagar.Edit;
edtVencimento.SetFocus;
end;

procedure TfrmCadCtasPagar.edtNumParcelasExit(Sender: TObject);
var
   i:integer;
begin
edtNumParcelas.Enabled:=False;
for i:=1 to edtNumParcelas.Value do
   begin
   DMInloco.tblDetCtaPagar.Append;
   DMInloco.tblDetCtaPagarCod_Cta_Pagar.Value:=
    DMInloco.tblCtaPagarCod_Cta_Pagar.Value;
   DMInloco.tblDetCtaPagarNum_Parcela.Value:=i;
   DMInloco.tblDetCtaPagar.Post;
   end;
if edtNumParcelas.Value=1 then
   begin
   if Recebimento then
      begin
      DMInloco.tblCtaPagar.Edit;
      DMInloco.tblCtaPagarValor_Total.Value:=
       DMInloco.tblPedidosValor_Total.Value;
      DMInloco.tblCtaPagar.Post;
      DMInloco.tblDetCtaPagar.Edit;
      DMInloco.tblDetCtaPagarVencimento.Value:=date;
      DMInloco.tblDetCtaPagarValor.Value:=DMinloco.tblPedidosValor_Total.Value;
      DMInloco.tblDetCtaPagar.Post;
      end;
   end
else
   begin
   btnUltimo1.Enabled:=True;
   btnProximo1.Enabled:=True;
   end;
DMInloco.tblDetCtaPagar.First;
pnlParcelas.Visible:=True;
DMInloco.tblDetCtaPagar.Edit;
edtVencimento.SetFocus;
end;

procedure TfrmCadCtasPagar.edtNfKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadCtasPagar.btnExcluir1Click(Sender: TObject);
var
   parcela:integer;
begin
parcela:=DMInloco.tblDetCtaPagarNum_Parcela.Value;
DMInloco.tblDetCtaPagarNum_Parcela.Value:=0;
DMInloco.tblCtaPagar.Edit;
DMInloco.tblCtaPagarValor_Total.Value:=
DMInloco.tblCtaPagarValor_Total.Value-
DMInloco.tblDetCtaPagarValor.Value;
DMInloco.tblCtaPagar.Post;
DMInloco.tblDetCtaPagar.First;
While not DMInloco.tblDetCtaPagar.EOF do
   begin
   if DMInloco.tblDetCtaPagarNum_Parcela.Value>parcela then
      begin
      DMInloco.tblDetCtaPagar.Edit;
      DMInloco.tblDetCtaPagarNum_Parcela.Value:=
      DMInloco.tblDetCtaPagarNum_Parcela.Value-1;
      DMInloco.tblDetCtaPagar.Post;
      end;
   DMInloco.tblDetCtaPagar.Next;
   end;
DMInloco.tblDetCtaPagar.First;
DMInloco.tblDetCtaPagar.Delete;
DMInloco.tblDetCtaPagar.Edit;
end;

procedure TfrmCadCtasPagar.pnlParcelasEnter(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.Edit;
end;

end.
