//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, DBTables, DBCtrls, Mask, ComCtrls, Buttons,
  DBCGrids, Spin;

type
  TfrmVendas = class(TForm)
    lblCodigo: TLabel;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblValor: TLabel;
    lblOperador: TLabel;
    lblVendedor: TLabel;
    dbgDetVenda: TDBGrid;
    lblSubTotal: TLabel;
    lblTotal: TLabel;
    lblPromocao: TLabel;
    lblAjuste: TLabel;
    lblValorPago: TLabel;
    lblTroco: TLabel;
    btnIniciar: TButton;
    btnCancelar: TButton;
    btnFinalizar: TButton;
    pnlFormaPagto: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    rdgFormaPagto: TRadioGroup;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnPagto: TButton;
    btnLocCliente: TSpeedButton;
    btnNovoCliente: TSpeedButton;
    lblCliente: TLabel;
    txtCliente: TDBText;
    edtAjuste: TDBEdit;
    txtProduto: TDBText;
    txtOperador: TDBText;
    txtValorUnit: TDBText;
    txtPromocao: TDBText;
    txtValor: TDBText;
    txtSubTotal: TDBText;
    txtTotal: TDBText;
    cmbVendedor: TDBLookupComboBox;
    edtValorPago: TEdit;
    txtTroco: TLabel;
    edtCodigo: TEdit;
    imgGrupo: TDBImage;
    grbFormaPagto: TGroupBox;
    chkDinheiro: TCheckBox;
    chkCheque: TCheckBox;
    chkCartao: TCheckBox;
    chkConvenio: TCheckBox;
    chkPromissoria: TCheckBox;
    chkVale: TCheckBox;
    speCheque: TSpinEdit;
    btnOk: TBitBtn;
    pnlBtnFormaPagto: TPanel;
    grbDinheiro: TGroupBox;
    lblValor1: TLabel;
    edtValorDinheiro: TDBEdit;
    grbCheque: TGroupBox;
    Label17: TLabel;
    cmbBanco: TDBLookupComboBox;
    Label18: TLabel;
    edtNumAgencia: TDBEdit;
    Label20: TLabel;
    edtValorCheque: TDBEdit;
    edtVencimentoCheque: TDBEdit;
    Label32: TLabel;
    edtNumCheque: TDBEdit;
    Label19: TLabel;
    speCartao: TSpinEdit;
    spePromissoria: TSpinEdit;
    speVale: TSpinEdit;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnUltimo: TSpeedButton;
    edtValorUnitario: TDBEdit;
    edtQuantidade: TEdit;
    grbCartao: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtNumCartao: TDBEdit;
    edtNumAutorizacao: TDBEdit;
    edtValorCartao: TDBEdit;
    cmbCartao: TDBLookupComboBox;
    grbConvenio: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    cmbConvenio: TDBLookupComboBox;
    edtValorConvenio: TDBEdit;
    grbPromissoria: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    edtNumPromissoria: TDBEdit;
    edtValorPromissoria: TDBEdit;
    edtVencimentoPromissoria: TDBEdit;
    grbVale: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    edtValorVale: TDBEdit;
    edtVencimentoVale: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure cmbVendedorEnter(Sender: TObject);
    procedure cmbVendedorExit(Sender: TObject);
    procedure btnPagtoClick(Sender: TObject);
    procedure edtValorPagoExit(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure rdgFormaPagtoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClienteClick(Sender: TObject);
    procedure btnLocClienteClick(Sender: TObject);
    procedure edtValorDinheiroEnter(Sender: TObject);
    procedure edtValorDinheiroExit(Sender: TObject);
    procedure edtValorChequeEnter(Sender: TObject);
    procedure edtValorChequeExit(Sender: TObject);
    procedure edtValorCartaoEnter(Sender: TObject);
    procedure edtValorCartaoExit(Sender: TObject);
    procedure edtValorConvenioEnter(Sender: TObject);
    procedure edtValorConvenioExit(Sender: TObject);
    procedure edtValorPromissoriaEnter(Sender: TObject);
    procedure edtValorPromissoriaExit(Sender: TObject);
    procedure edtValorValeEnter(Sender: TObject);
    procedure edtValorValeExit(Sender: TObject);
    procedure chkChequeClick(Sender: TObject);
    procedure chkCartaoClick(Sender: TObject);
    procedure chkPromissoriaClick(Sender: TObject);
    procedure chkValeClick(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtAjusteEnter(Sender: TObject);
    procedure edtAjusteExit(Sender: TObject);
    procedure edtNumCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumAutorizacaoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbConvenioExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorConvenioKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorPromissoriaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorValeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorChequeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtAjusteKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorPagoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumAutorizacaoExit(Sender: TObject);
    procedure cmbCartaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;
  Venda: Boolean;
  ValorPago:Real;

implementation

uses untDMInloco, untCadClientes, untLocClientes, untPrincipal;

{$R *.DFM}

procedure MostraTela;
begin
frmVendas.grbDinheiro.Visible:=False;
frmVendas.grbCheque.Visible:=False;
frmVendas.grbCartao.Visible:=False;
frmVendas.grbConvenio.Visible:=False;
frmVendas.grbPromissoria.Visible:=False;
frmVendas.grbVale.Visible:=False;
case DMInloco.tblCtaReceberCod_Forma_Pagto.Value of
   1:frmVendas.grbDinheiro.Visible:=True;
   2:frmVendas.grbCheque.Visible:=True;
   3:frmVendas.grbCartao.Visible:=True;
   4:frmVendas.grbConvenio.Visible:=True;
   5:frmVendas.grbPromissoria.Visible:=True;
   6:frmVendas.grbVale.Visible:=True;
   end;
DMInloco.tblCtaReceber.Edit;
end;

procedure MostraValor;
begin
frmVendas.edtValorPago.Text:=FloatToStrF(ValorPago,ffFixed,5,2);
frmVendas.txttroco.Caption:=
FloatToStrF(ValorPago-DMInloco.tblVendasValor_Final.Value,ffFixed,5,2);
end;

procedure Escrita;
begin
frmVendas.btnIniciar.Enabled:=False;
frmVendas.btnCancelar.Enabled:=True;
frmVendas.edtQuantidade.Text:='1';
frmVendas.edtQuantidade.ReadOnly:=False;
frmVendas.edtCodigo.ReadOnly:=False;
DMInloco.tblVendas.Open;
DMInloco.tblDetVendas.Open;
DMInloco.tblProdutos.Open;
DMInloco.tblProdGrupo.Open;
DMInloco.tblProdGrupo.IndexName:='';
DMInloco.tblClientes.Open;
DMInloco.tblFuncionarios.IndexName:='Apelido_Funcionario';
DMInloco.tblFuncionarios.Open;
DMInloco.tblBancos.IndexName:='Descr_Banco';
DMInloco.tblCartoesCredito.IndexName:='Descr_Cartao';
DMInloco.tblConvenios.IndexName:='Descr_Convenio';
DMInloco.tblBancos.Open;
DMInloco.tblCartoesCredito.Open;
DMInloco.tblConvenios.Open;
end;

procedure SomenteLeitura;
begin
frmVendas.btnIniciar.Enabled:=True;
frmVendas.btnPagto.Enabled:=False;
frmVendas.btnFinalizar.Enabled:=False;
frmVendas.btnCancelar.Enabled:=False;
frmVendas.edtAjuste.ReadOnly:=True;
frmVendas.edtValorPago.ReadOnly:=True;
frmVendas.edtAjuste.Text:='';
frmVendas.edtValorPago.Text:='';
frmVendas.edtQuantidade.Text:='';
frmVendas.edtValorUnitario.Visible:=False;
frmVendas.txtTroco.Caption:='';
frmVendas.txtProduto.DataField:='';
frmVendas.txtPromocao.DataField:='';
frmVendas.txtValorUnit.DataField:='';
frmVendas.rdgFormaPagto.ItemIndex:=0;
frmVendas.rdgFormaPagto.Enabled:=False;
frmVendas.chkDinheiro.Checked:=False;
frmVendas.chkCheque.Checked:=False;
frmVendas.chkCartao.Checked:=False;
frmVendas.chkConvenio.Checked:=False;
frmVendas.chkPromissoria.Checked:=False;
frmVendas.chkVale.Checked:=False;
frmVendas.pnlFormaPagto.Visible:=False;
DMInloco.tblVendas.Close;
DMInloco.tblDetVendas.Close;
DMInloco.tblProdutos.Close;
DMInloco.tblProdGrupo.Close;
DMInloco.tblClientes.Close;
DMInloco.tblFuncionarios.IndexName:='';
DMInloco.tblBancos.IndexName:='';
DMInloco.tblCartoesCredito.IndexName:='';
DMInloco.tblConvenios.IndexName:='';
DMInloco.tblFuncionarios.Close;
DMInloco.tblBancos.Close;
DMInloco.tblCartoesCredito.Close;
DMInloco.tblConvenios.Close;
frmVendas.imgGrupo.Picture.LoadFromFile('H:\autocomer\Paris.bmp');
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
Venda:=True;
SomenteLeitura;
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Venda:=False;
Action:=caFree;
end;

procedure TfrmVendas.btnIniciarClick(Sender: TObject);
var
   codigo:integer;
   data:TDateTime;
begin
Escrita;
imgGrupo.Picture.LoadFromFile('H:\autocomer\Paris.bmp');
DMInloco.tblVendas.Last;
codigo:=DMInloco.tblVendasCod_Venda.Value;
data:=DMInloco.tblVendasData_Venda.Value;
DMInloco.tblVendas.Append;
DMInloco.tblVendasData_Venda.Value:=date;
if data=date then
   DMInloco.tblVendasCod_Venda.Value:=codigo+1
else
   DMInloco.tblVendasCod_Venda.Value:=1;
DMInloco.tblVendasCod_Operador.Value:=Operador;
DMInloco.tblVendasValor_Total.Value:=0;
DMInloco.tblVendasHorario_Venda.Value:=time;
DMInloco.tblVendas.Post;
if data<>date then
   begin
   DMInloco.tblFaturamentos.Open;
   DMInloco.tblFaturamentos.Append;
   DMInloco.tblFaturamentosData.Value:=date;
   DMInloco.tblFaturamentosTotal_Vendas.Value:=0;
   DMInloco.tblFaturamentosValor_Bruto.Value:=0;
   DMInloco.tblFaturamentos.Post;
   DMInloco.tblFaturamentos.Close;
   end;
cmbVendedor.SetFocus;
end;

procedure TfrmVendas.edtCodigoExit(Sender: TObject);
var
   reg:TBookMark;
   controle:integer;
begin
	if length(edtCodigo.Text)>0 then
		begin
		reg:=DMInloco.tblProdutos.GetBookMark;
   	if DMInloco.tblProdutos.Locate('Cod_Produto',edtCodigo.Text,[]) then
    	begin
      btnPagto.Enabled:=True;
      edtValorUnitario.Visible:=False;
      txtProduto.DataField:='Produto';
      txtPromocao.DataField:='Preco_Promocao';
      txtValorUnit.DataField:='Preco_Venda';
      DMInloco.tblProdGrupo.FindKey([DMInloco.tblProdutosCod_Grupo.Value]);
      if DMInloco.tblProdGrupoFoto_Produto.IsNull then
         imgGrupo.Picture.LoadFromFile('H:\autocomer\Paris.bmp')
      else
         imgGrupo.DataField:='Foto_Produto';
{      if DMInloco.tblDetVendas.FindKey([DMInloco.tblVendasData_Venda.Value,DMInloco.tblVendasCod_Venda.Value,edtCodigo.Text,1]) then
      	begin
        if ((DMInloco.tblProdutosPreco_Promocao.IsNull) or (DMInloco.tblProdutosPreco_Promocao.Value=0)) and
           ((DMInloco.tblProdutosPreco_Venda.IsNull) or (DMInloco.tblProdutosPreco_Venda.Value=0)) then
          begin
         	Controle:=2;
         	While DMInloco.tblDetVendas.FindKey([DMInloco.tblVendasData_Venda.Value,DMInloco.tblVendasCod_Venda.Value,edtCodigo.Text,controle]) do
           	Controle:=Controle+1;
         	DMInloco.tblDetVendas.Append;
         	DMInloco.tblDetVendasData_Venda.Value:=DMInloco.tblVendasData_Venda.Value;
          DMInloco.tblDetVendasCod_Venda.Value:=DMInloco.tblVendasCod_Venda.Value;
          DMInloco.tblDetVendasCod_Produto.Value:=edtCodigo.Text;
          DMInloco.tblDetVendasControle.Value:=controle;
          DMInloco.tblDetVendasQuant_Vendida.Value:=StrToInt(edtQuantidade.Text);
          edtValorUnitario.Visible:=True;
          beep;
          beep;
          edtValorUnitario.SetFocus;
          Exit;
          end
        else
          begin
          DMInloco.tblVendas.Edit;
          DMInloco.tblVendasValor_Total.Value:=DMInloco.tblVendasValor_Total.Value-DMInloco.tblDetVendasValor_Total.Value;
          DMInloco.tblVendas.Post;
          DMInloco.tblDetVendas.Edit;
          DMInloco.tblDetVendasQuant_Vendida.Value:=DMInloco.tblDetVendasQuant_Vendida.Value+StrToInt(edtQuantidade.Text);
          end;
        end
      else
      	begin}
        btnPagto.Enabled:=True;
        DMInloco.tblDetVendas.Append;
        DMInloco.tblDetVendasData_Venda.Value:=DMInloco.tblVendasData_Venda.Value;
        DMInloco.tblDetVendasCod_Venda.Value:=DMInloco.tblVendasCod_Venda.Value;
        DMInloco.tblDetVendasCod_Produto.Value:=edtCodigo.Text;
        DMInloco.tblDetVendasControle.Value:=1;
        DMInloco.tblDetVendasQuant_Vendida.Value:=StrToInt(edtQuantidade.Text);
        if (not DMInloco.tblProdutosPreco_Promocao.IsNull) and (DMInloco.tblProdutosPreco_Promocao.Value>0) then
        	DMInloco.tblDetVendasValor_Unitario.Value:=DMInloco.tblProdutosPreco_Promocao.Value
        else
        	if (not DMInloco.tblProdutosPreco_Venda.IsNull) and (DMInloco.tblProdutosPreco_Venda.Value>0) then
          	DMInloco.tblDetVendasValor_Unitario.Value:=DMInloco.tblProdutosPreco_Venda.Value
        	else
            begin
            edtValorUnitario.Visible:=True;
            edtValorUnitario.SetFocus;
            Exit;
            end;
        DMInloco.tblDetVendas.Post;
        {end;}
      DMInloco.tblVendas.Edit;
      DMInloco.tblVendasValor_Total.Value:=DMInloco.tblVendasValor_Total.Value+DMInloco.tblDetVendasValor_Total.Value;
      DMInloco.tblVendas.Post;
      DMInloco.tblProdutos.Edit;
      DMInloco.tblProdutosQuant_Atual.Value:=DMInloco.tblProdutosQuant_Atual.Value-StrToInt(edtQuantidade.Text);
      DMInloco.tblProdutos.Post;
      end
    else
      begin
      beep;
      MessageDlg('Produto n�o cadastrado!',mtError,[mbOK],0);
      DMInloco.tblProdutos.GotoBookmark(reg);
      DMInloco.tblProdutos.FreeBookmark(reg);
      end;
    edtCodigo.Text:='';
    edtQuantidade.Text:='1';
    edtCodigo.SetFocus;
    end;
end;

procedure TfrmVendas.cmbVendedorEnter(Sender: TObject);
begin
DMInloco.tblVendas.Edit;
end;

procedure TfrmVendas.cmbVendedorExit(Sender: TObject);
begin
DMInloco.tblVendas.Post;
end;

procedure TfrmVendas.btnPagtoClick(Sender: TObject);
begin
if DMInloco.tblDetVendas.IsEmpty then
   begin
   beep;
   MessageDlg('Produto(s) vendido(s) n�o especificado(s).'+#13+
   'N�o h� pagamento a ser efetuado!',mtError,[mbOK],0);
   edtCodigo.SetFocus;
   end
else
   begin
   rdgFormaPagto.Enabled:=True;
   btnPagto.Enabled:=False;
   btnFinalizar.Enabled:=True;
   edtAjuste.ReadOnly:=False;
   edtCodigo.ReadOnly:=True;
   edtQuantidade.ReadOnly:=True;
   edtValorPago.ReadOnly:=False;
   edtValorPago.SetFocus;
   DMInloco.tblCtaReceber.Open;
   end;
end;

procedure TfrmVendas.edtValorPagoExit(Sender: TObject);
begin
if length(edtValorPago.Text)>0 then
txttroco.Caption:=
FloatToStr(StrToFloat(edtValorPago.Text)-DMInloco.tblVendasValor_Final.Value)
end;

procedure TfrmVendas.btnFinalizarClick(Sender: TObject);
var
   Codigo:integer;
begin
if rdgFormaPagto.ItemIndex=0 then
   begin
   DMInloco.tblCtaReceber.Append;
   DMInloco.tblCtaReceberData_Venda.Value:=date;
   DMInloco.tblCtaReceberCod_Venda.Value:=DMInloco.tblVendasCod_Venda.Value;
   DMInloco.tblCtaReceberCod_Cta_Receber.Value:=1;
   DMInloco.tblCtaReceberCod_Forma_Pagto.Value:=1;
   DMInloco.tblCtaReceberValor.Value:=DMInloco.tblVendasValor_Final.Value;
   DMInloco.tblCtaReceberValor_Receber.Value:=DMInloco.tblVendasValor_Final.Value;
   DMInloco.tblCtaReceberData_Vencimento.Value:=date;
   DMInloco.tblCtaReceberData_Recebimento.Value:=date;
   DMInloco.tblCtaReceberValor_Recebido.Value:=DMInloco.tblVendasValor_Final.Value;
   DMInloco.tblCtaReceber.Post;
   end;
DMInloco.tblCtaReceber.First;
if (rdgFormaPagto.ItemIndex=0) or
   (DMInloco.tblCtaReceberCod_Forma_Pagto.Value=1) then
   begin
   DMInloco.tblMovFinanceira.Open;
   DMInloco.tblMovFinanceira.Last;
   Codigo:=DMInloco.tblMovFinanceiraCod_Operacao.Value;
   DMInloco.tblMovFinanceira.Append;
   DMInloco.tblMovFinanceiraCod_Operacao.Value:=Codigo+1;
   DMInloco.tblMovFinanceiraData_Operacao.Value:=date;
   DMInloco.tblMovFinanceiraEspecie.Value:='C';
   DMInloco.tblMovFinanceiraData_Referencia.Value:=date;
   DMInloco.tblMovFinanceiraReferencia.Value:=DMInloco.tblVendasCod_Venda.Value;
   DMInloco.tblMovFinanceiraHistorico.Value:='Venda recebida em dinheiro';
   DMInloco.tblMovFinanceiraValor.Value:=DMInloco.tblVendasValor_Final.Value;
   DMInloco.tblMovFinanceira.Post;
   DMInloco.tblMovFinanceira.Close;
   end;
DMInloco.tblFaturamentos.Open;
DMInloco.tblFaturamentos.Last;
DMInloco.tblFaturamentos.Edit;
DMInloco.tblFaturamentosValor_Bruto.Value:=
DMInloco.tblFaturamentosValor_Bruto.Value+
DMInloco.tblVendasValor_Total.Value;
DMInloco.tblFaturamentosValor_Desconto.Value:=
DMInloco.tblFaturamentosValor_Desconto.Value+
DMInloco.tblVendasDesconto.Value;
DMInloco.tblFaturamentosTotal_Vendas.Value:=
DMInloco.tblFaturamentosTotal_Vendas.Value+1;
DMInloco.tblFaturamentos.Post;
DMInloco.tblFaturamentos.Close;
DMInloco.tblFuncComissoes.Open;
if DMInloco.tblFuncComissoes.FindKey
   ([DMInloco.tblVendasCod_Vendedor.Value,DMInloco.tblVendasData_Venda.Value])
   then
   DMInloco.tblFuncComissoes.Edit
else
   begin
   DMInloco.tblFuncComissoes.Append;
   DMInloco.tblFuncComissoesCod_Funcionario.Value:=
   DMInloco.tblVendasCod_Vendedor.Value;
   DMInloco.tblFuncComissoesData_Venda.Value:=
   DMInloco.tblVendasData_Venda.Value;
   DMInloco.tblFuncComissoesQuant_Vendas.Value:=0;
   DMInloco.tblFuncComissoesValor_Vendas.Value:=0;
   end;
DMInloco.tblFuncComissoesQuant_Vendas.Value:=
DMInloco.tblFuncComissoesQuant_Vendas.Value+1;
DMInloco.tblFuncComissoesValor_Vendas.Value:=
DMInloco.tblFuncComissoesValor_Vendas.Value+
DMInloco.tblVendasValor_Final.Value;
DMInloco.tblFuncComissoes.Post;
DMInloco.tblFuncComissoes.Close;
DMInloco.tblCtaReceber.Close;
SomenteLeitura;
btnIniciar.SetFocus;
end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
var
   Confirma:integer;
begin
if (btnPagto.Enabled) or (DMInloco.tblDetVendas.IsEmpty) then
   begin
   Confirma:=Application.MessageBox('Essa Venda ser� Cancelada.'+#13+
   'Confirma?','Cancelamento de Registro',
   mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      DMINloco.tblDetVendas.First;
      While not DMInloco.tblDetVendas.EOF do
         DMInloco.tblDetVendas.Delete;
      if DMInloco.tblVendasCod_Venda.Value=1 then
         begin
         DMInloco.tblFaturamentos.Open;
         DMInloco.tblFaturamentos.Last;
         DMInloco.tblFaturamentos.Delete;
         DMInloco.tblFaturamentos.Close;
         end;
      DMInloco.tblVendas.Delete;
      SomenteLeitura;
      btnIniciar.SetFocus;
      end
   else
      edtCodigo.SetFocus;
   end
else
   begin
   Confirma:=Application.MessageBox('Forma de Pagamento ser� Cancelada.'+#13+
   'Confirma?','Cancelamento de Registro',
   mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      DMInloco.tblCtaReceber.First;
      While not DMInloco.tblCtaReceber.EOF do
         DMInloco.tblCtaReceber.Delete;
      DMInloco.tblCtaReceber.Close;
      btnPagto.Enabled:=True;
      btnFinalizar.Enabled:=False;
      txtTroco.Caption:='';
      edtValorPago.Text:='';
      edtAjuste.Text:='';
      edtValorPago.ReadOnly:=True;
      edtAjuste.ReadOnly:=True;
      edtCodigo.ReadOnly:=False;
      edtQuantidade.ReadOnly:=False;
      rdgFormaPagto.ItemIndex:=0;
      rdgFormaPagto.Enabled:=False;
      chkDinheiro.Checked:=False;
      chkCheque.Checked:=False;
      chkCartao.Checked:=False;
      chkConvenio.Checked:=False;
      chkPromissoria.Checked:=False;
      chkVale.Checked:=False;
      pnlFormaPagto.Visible:=False;
      pnlBtnFormaPagto.Visible:=False;
      edtQuantidade.Text:='1';
      edtCodigo.SetFocus;
      end;
   end;
end;

procedure TfrmVendas.rdgFormaPagtoClick(Sender: TObject);
begin
if rdgFormaPagto.ItemIndex=1 then
   begin
   ValorPago:=0;
   rdgFormaPagto.Enabled:=False;
   txtTroco.Caption:='';
   edtValorPago.Text:='';
   edtValorPago.ReadOnly:=True;
   pnlFormaPagto.Visible:=True;
   btnLocCliente.Enabled:=False;
   btnNovoCliente.Enabled:=False;
   grbFormaPagto.Enabled:=True;
   pnlBtnFormaPagto.Visible:=False;
   grbDinheiro.Visible:=False;
   grbCheque.Visible:=False;
   grbCartao.Visible:=False;
   grbConvenio.Visible:=False;
   grbPromissoria.Visible:=False;
   grbVale.Visible:=False;
   speCheque.Value:=1;
   speCartao.Value:=1;
   spePromissoria.Value:=1;
   speVale.Value:=1;
   end;
end;

procedure TfrmVendas.btnOkClick(Sender: TObject);
var
   i,x:integer;
   pagto: integer;
begin
	pagto:=0;
	i:=0;
	if chkDinheiro.Checked then
    Begin
    i:=1;
		pagto:=1;
    End;
	if chkCheque.Checked then
  	begin
	  i:=speCheque.Value;
    pagto:=2;
   	end;
	if chkCartao.Checked then
  	begin
   	i:=speCartao.Value;
    pagto:=3;
   	end;
	if chkConvenio.Checked then
  	Begin
    i:=1;
   	pagto:=4;
    End;
	if chkPromissoria.Checked then
  	begin
   	i:=spePromissoria.Value;
    pagto:=5;
   	end;
	if chkVale.Checked then
   	begin
   	i:=speVale.Value;
    pagto:=6;
   	end;
	if i=0 then
   	begin
   	beep;
   	MessageDlg('Selecione a(s) forma(s) de pagamento!',mtError,[mbOK],0);
   	rdgFormaPagto.SetFocus;
   	end
	else
   	begin
   	rdgFormaPagto.Enabled:=False;
   	DMInloco.tblCtaReceber.Open;
   	for x:=1 to i do
    	begin
      DMInloco.tblCtaReceber.Append;
      DMInloco.tblCtaReceberData_Venda.Value:=date;
      DMInloco.tblCtaReceberCod_Venda.Value:=DMInloco.tblVendasCod_Venda.Value;
      DMInloco.tblCtaReceberCod_Cta_Receber.Value:=x;
      DMInloco.tblCtaReceberCod_Forma_Pagto.Value:=pagto;
      if pagto=1 then
      	begin
        DMInloco.tblCtaReceberData_Recebimento.Value:=date;
        DMInloco.tblCtaReceberData_Vencimento.Value:=date;
        end;
      DMInloco.tblCtaReceber.Post;
      end;
   	DMInloco.tblCtaReceber.First;
   	MostraTela;
   	MostraValor;
   	btnLocCliente.Enabled:=True;
   	btnNovoCliente.Enabled:=True;
   	pnlBtnFormaPagto.Visible:=True;
   	btnPrimeiro.Enabled:=False;
   	btnAnterior.Enabled:=False;
   	if i=1 then
    	begin
      btnProximo.Enabled:=False;
      btnUltimo.Enabled:=False;
      end
   	else
    	begin
      btnProximo.Enabled:=True;
      btnUltimo.Enabled:=True;
      end;
   	end;
end;

procedure TfrmVendas.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
MostraTela;
MostraValor;
end;

procedure TfrmVendas.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblCtaReceber.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
MostraTela;
MostraValor;
end;

procedure TfrmVendas.btnProximoClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblCtaReceber.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
MostraTela;
MostraValor;
end;

procedure TfrmVendas.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
MostraTela;
MostraValor;
end;

procedure TfrmVendas.btnNovoClienteClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadClientes, frmCadClientes);
frmCadClientes.ShowModal;
end;

procedure TfrmVendas.btnLocClienteClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocClientes, frmLocClientes);
frmLocClientes.ShowModal;
end;

procedure TfrmVendas.edtValorDinheiroEnter(Sender: TObject);
begin
ValorPago:=ValorPago-DMInloco.tblCtaReceberValor.Value;
end;

procedure TfrmVendas.edtValorDinheiroExit(Sender: TObject);
begin
DMInloco.tblCtaReceberValor_Receber.Value:=DMInloco.tblCtaReceberValor.Value;
DMInloco.tblCtaReceberValor_Recebido.Value:=DMInloco.tblCtaReceberValor.Value;
ValorPago:=ValorPago+DMInloco.tblCtaReceberValor.Value;
MostraValor;
pnlBtnFormaPagto.SetFocus;
end;

procedure TfrmVendas.edtValorChequeEnter(Sender: TObject);
begin
ValorPago:=ValorPago-DMInloco.tblCtaReceberValor.Value;
end;

procedure TfrmVendas.edtValorChequeExit(Sender: TObject);
begin
DMInloco.tblCtaReceberValor_Receber.Value:=DMInloco.tblCtaReceberValor.Value;
ValorPago:=ValorPago+DMInloco.tblCtaReceberValor.Value;
MostraValor;
pnlBtnFormaPagto.SetFocus;
end;

procedure TfrmVendas.edtValorCartaoEnter(Sender: TObject);
begin
ValorPago:=ValorPago-DMInloco.tblCtaReceberValor.Value;
end;

procedure TfrmVendas.edtValorCartaoExit(Sender: TObject);
begin
if DMInloco.tblCartoesCreditoValor_Desconto.Value > 0 then
   DMInloco.tblCtaReceberValor_Receber.Value:=
   DMInloco.tblCtaReceberValor.Value-
   (DMInloco.tblCtaReceberValor.Value*
   DMInloco.tblCartoesCreditoValor_Desconto.Value/100)
else
   DMInloco.tblCtaReceberValor_Receber.Value:=
   DMInloco.tblCtaReceberValor.Value;
ValorPago:=ValorPago+DMInloco.tblCtaReceberValor.Value;
MostraValor;
pnlBtnFormaPagto.SetFocus;
end;

procedure TfrmVendas.edtValorConvenioEnter(Sender: TObject);
begin
ValorPago:=ValorPago-DMInloco.tblCtaReceberValor.Value;
end;

procedure TfrmVendas.edtValorConvenioExit(Sender: TObject);
begin
DMInloco.tblCtaReceberValor_Receber.Value:=DMInloco.tblCtaReceberValor.Value;
ValorPago:=ValorPago+DMInloco.tblCtaReceberValor.Value;
MostraValor;
pnlBtnFormaPagto.SetFocus;
end;

procedure TfrmVendas.edtValorPromissoriaEnter(Sender: TObject);
begin
ValorPago:=ValorPago-DMInloco.tblCtaReceberValor.Value;
end;

procedure TfrmVendas.edtValorPromissoriaExit(Sender: TObject);
begin
DMInloco.tblCtaReceberValor_Receber.Value:=DMInloco.tblCtaReceberValor.Value;
ValorPago:=ValorPago+DMInloco.tblCtaReceberValor.Value;
MostraValor;
pnlBtnFormaPagto.SetFocus;
end;

procedure TfrmVendas.edtValorValeEnter(Sender: TObject);
begin
ValorPago:=ValorPago-DMInloco.tblCtaReceberValor.Value;
end;

procedure TfrmVendas.edtValorValeExit(Sender: TObject);
begin
DMInloco.tblCtaReceberValor_Receber.Value:=DMInloco.tblCtaReceberValor.Value;
ValorPago:=ValorPago+DMInloco.tblCtaReceberValor.Value;
MostraValor;
pnlBtnFormaPagto.SetFocus;
end;

procedure TfrmVendas.chkChequeClick(Sender: TObject);
begin
if chkCheque.Checked then
   begin
   speCheque.Enabled:=True;
   speCheque.SetFocus;
   end
else
   speCheque.Enabled:=False;
end;

procedure TfrmVendas.chkCartaoClick(Sender: TObject);
begin
if chkCartao.Checked then
   begin
   speCartao.Enabled:=True;
   speCartao.SetFocus;
   end
else
   speCartao.Enabled:=False;
end;

procedure TfrmVendas.chkPromissoriaClick(Sender: TObject);
begin
if chkPromissoria.Checked then
   begin
   spePromissoria.Enabled:=True;
   spePromissoria.SetFocus;
   end
else
   spePromissoria.Enabled:=False;
end;

procedure TfrmVendas.chkValeClick(Sender: TObject);
begin
if chkVale.Checked then
   begin
   speVale.Enabled:=True;
   speVale.SetFocus;
   end
else
   speVale.Enabled:=False;
end;

procedure TfrmVendas.edtValorUnitarioExit(Sender: TObject);
begin
if length(edtValorUnitario.Text)=0 then
   begin
   beep;
   MessageDlg('Pre�o unit�rio do produto deve ser digitado!',mtError,[mbOK],0);
   edtValorUnitario.SetFocus;
   end
else
   begin
   DMInloco.tblDetVendas.Post;
   DMInloco.tblVendas.Edit;
   DMInloco.tblVendasValor_Total.Value:=
   DMInloco.tblVendasValor_Total.Value+
   DMInloco.tblDetVendasValor_Total.Value;
   DMInloco.tblVendas.Post;
   DMInloco.tblProdutos.Edit;
   DMInloco.tblProdutosQuant_Atual.Value:=
   DMInloco.tblProdutosQuant_Atual.Value-
   StrToInt(edtQuantidade.Text);
   DMInloco.tblProdutos.Post;
   edtCodigo.Text:='';
   edtQuantidade.Text:='1';
   edtCodigo.SetFocus;
   end;
end;

procedure TfrmVendas.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtAjusteEnter(Sender: TObject);
begin
DMInloco.tblVendas.Edit;
end;

procedure TfrmVendas.edtAjusteExit(Sender: TObject);
begin
DMInloco.tblVendas.Post;
end;

procedure TfrmVendas.edtNumCartaoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtNumAutorizacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.cmbConvenioExit(Sender: TObject);
var
   mes,ano:String;
begin
if length(cmbConvenio.Text)=0 then
   begin
   beep;
   cmbConvenio.SetFocus;
   end
else
   begin
   mes:=copy(DateToStr(date),4,2);
   ano:=copy(DateToStr(date),7,4);
   if StrToInt(mes)<12 then
      begin
      mes:=IntToStr(StrToInt(mes)+1);
      if Length(mes)=1 then mes:='0'+mes;
      end
   else
      begin
      mes:='01';
      ano:=IntToStr(StrToInt(ano)+1);
      end;
   DMInloco.tblCtaReceberData_Vencimento.Value:=StrToDate(
   IntToStr(DMInloco.tblConveniosDia_Vencimento.Value)+'/'+mes+'/'+ano);
   end;
end;

procedure TfrmVendas.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TfrmVendas.edtValorConvenioKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorPromissoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorValeKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorDinheiroKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorCartaoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtAjusteKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtValorPagoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmVendas.edtNumAutorizacaoExit(Sender: TObject);
begin
if (length(edtNumAutorizacao.Text)=0) and
   (DMInloco.tblCtaReceberValor.Value>=
   DMInloco.tblCartoesCreditoValor_Autorizacao.Value) then
   begin
   beep;
   MessageDlg('Valor da compra obriga n� de autoriza��o!',mtError,[mbOK],0);
   edtNumAutorizacao.SetFocus;
   end;
end;

procedure TfrmVendas.cmbCartaoExit(Sender: TObject);
begin
if length(cmbCartao.Text)=0 then
   begin
   beep;
   cmbCartao.SetFocus;
   end;
end;

end.
