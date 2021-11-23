//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TBookmark = pointer;
  TfrmPrincipal = class(TForm)
    Menu: TMainMenu;
    Arquivo: TMenuItem;
    CadClientes: TMenuItem;
    CadFornecedores: TMenuItem;
    CadProdutos: TMenuItem;
    CadFuncionarios: TMenuItem;
    Vendas: TMenuItem;
    Financas: TMenuItem;
    N1: TMenuItem;
    CadPropriedades: TMenuItem;
    N2: TMenuItem;
    CadProfissoes: TMenuItem;
    CadConvenios: TMenuItem;
    CadBancos: TMenuItem;
    CadCartoesCredito: TMenuItem;
    N3: TMenuItem;
    Sair: TMenuItem;
    Funcionarios: TMenuItem;
    Ajuda: TMenuItem;
    CadCtasPagar: TMenuItem;
    Sobre: TMenuItem;
    Conteudo: TMenuItem;
    EfetuarVendas: TMenuItem;
    RelVendas: TMenuItem;
    FecharCaixa: TMenuItem;
    N5: TMenuItem;
    ConsContas: TMenuItem;
    ConsMovFinanceira: TMenuItem;
    Compras: TMenuItem;
    CadPedidos: TMenuItem;
    CadRecebimento: TMenuItem;
    ConsPedidosPendentes: TMenuItem;
    EstatisticaVendas: TMenuItem;
    CadHorarios: TMenuItem;
    AlterarSenha: TMenuItem;
    ConsHorario: TMenuItem;
    MovCaixa: TMenuItem;
    ConsCtasPagar: TMenuItem;
    ConsCtasReceber: TMenuItem;
    EstatisticaProdutos: TMenuItem;
    EstatisticaHorario: TMenuItem;
    EstatisticaPeriodo: TMenuItem;
    imgLogotipo: TImage;
    Configuracoes: TMenuItem;
    MostrarLogotipo: TMenuItem;
    StatusBar1: TStatusBar;
    CalcComissao: TMenuItem;
    RelProdutosFalta: TMenuItem;
    ConsPedidos: TMenuItem;
    ConsProdutos: TMenuItem;
    CadRelatorios: TMenuItem;
    CadMalaDireta: TMenuItem;
    N4: TMenuItem;
    RelProdutos: TMenuItem;
    RelFornecedores: TMenuItem;
    RelClientes: TMenuItem;
    BxCtasPagar: TMenuItem;
    N6: TMenuItem;
    CadOutrasEntradas: TMenuItem;
    CadOutrasSaidas: TMenuItem;
    DepsitoCartoesCredito: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    RelFornCodigo: TMenuItem;
    RelFornNome: TMenuItem;
    BxCtasReceber: TMenuItem;
    MotivosOutrasEntradas: TMenuItem;
    MotivosOutrasSaidas: TMenuItem;
    LiberarAcesso: TMenuItem;
    btnAcessar: TBitBtn;
    CliEtiquetas: TMenuItem;
    RelProdNome: TMenuItem;
    RelProdCategoria: TMenuItem;
    RelCliNome: TMenuItem;
    RelCliProfissao: TMenuItem;
    RelCliNiver: TMenuItem;
    AlterarPrecos: TMenuItem;
    ConsFaturamentos: TMenuItem;
    procedure CadFuncionariosClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure CadFornecedoresClick(Sender: TObject);
    procedure CadClientesClick(Sender: TObject);
    procedure CadProfissoesClick(Sender: TObject);
    procedure CadProdutosClick(Sender: TObject);
    procedure CadPropriedadesClick(Sender: TObject);
    procedure CadConveniosClick(Sender: TObject);
    procedure CadBancosClick(Sender: TObject);
    procedure CadCartoesCreditoClick(Sender: TObject);
    procedure CadPedidosClick(Sender: TObject);
    procedure CadRecebimentoClick(Sender: TObject);
    procedure EfetuarVendasClick(Sender: TObject);
    procedure MovCaixaClick(Sender: TObject);
    procedure FecharCaixaClick(Sender: TObject);
    procedure RelVendasClick(Sender: TObject);
    procedure CadHorariosClick(Sender: TObject);
    procedure AlterarSenhaClick(Sender: TObject);
    procedure CordeFundo1Click(Sender: TObject);
    procedure CadCtasPagarClick(Sender: TObject);
    procedure ConsCtasPagarClick(Sender: TObject);
    procedure ConsCtasReceberClick(Sender: TObject);
    procedure ConsMovFinanceiraClick(Sender: TObject);
    procedure CalcComissaoClick(Sender: TObject);
    procedure ConsHorarioClick(Sender: TObject);
    procedure ConsPedidosClick(Sender: TObject);
    procedure ConsProdutosClick(Sender: TObject);
    procedure MostrarLogotipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RelFornNomeClick(Sender: TObject);
    procedure RelFornCodigoClick(Sender: TObject);
    procedure BxCtasPagarClick(Sender: TObject);
    procedure DepsitoCartoesCreditoClick(Sender: TObject);
    procedure BxCtasReceberClick(Sender: TObject);
    procedure CadOutrasEntradasClick(Sender: TObject);
    procedure CadOutrasSaidasClick(Sender: TObject);
    procedure MotivosOutrasEntradasClick(Sender: TObject);
    procedure MotivosOutrasSaidasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAcessarClick(Sender: TObject);
    procedure LiberarAcessoClick(Sender: TObject);
    procedure RelProdNomeClick(Sender: TObject);
    procedure RelProdCategoriaClick(Sender: TObject);
    procedure RelCliNomeClick(Sender: TObject);
    procedure RelCliProfissaoClick(Sender: TObject);
    procedure RelCliNiverClick(Sender: TObject);
    procedure RelProdutosFaltaClick(Sender: TObject);
    procedure CliEtiquetasClick(Sender: TObject);
    procedure ConsFaturamentosClick(Sender: TObject);
    procedure AlterarPrecosClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  reg: TBookmark;
  Operador: integer;
  Rel: Boolean = False;

implementation

uses untCadFuncionarios, untCadFornecedores, untCadClientes,
  untCadProfissoes, untCadProdutos, untCadDescrGeral, untCadMarcas,
  untCadCategorias, untPropriedades, untCadConvenios, untCadBancos,
  untCadCartoesCredito, untCadPedidos, untVendas, untSenha, untRelVendas,
  untCadCtasPagar, untCadHorarios, untAlterarSenha,
  untCorFundo, untPedidosPendentes, untFecharCaixa, untConsultarCtasPagar,
  untConsultarCtasReceber, untConsultarCtasTotal, untConsultarCaixa,
  untCalcularComisoes, untProdutosPendentes, untCadRecebimento, untDMInloco, untRelFornecedores,
  untCadPagtos, untDepositoCartoes, untCadRecebtos, untCadEntradas,
  untCadSaidas, untCadMotivosEntrada, untCadMotivosSaida, untMovCaixa,
  untRptFornecedores, untRptProdutos1, untRptProdutos2, untRptClientes1,
  untRptClientes2, untRptClientes3, untRptProdutosEmFalta,
  untSelecaoClientes, untConsultarHorarios, untConsultarFaturamentos,
  untAlterarPrecos, untSobre;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
frmPrincipal.Left:=0;
frmPrincipal.Top:=0;
frmPrincipal.Height:=Screen.Height;
frmPrincipal.Width:=Screen.Width;
frmPrincipal.imgLogotipo.Left:=round
   ((frmPrincipal.Width-frmPrincipal.imgLogotipo.Width)/2);
frmPrincipal.imgLogotipo.Top:=round
   ((frmPrincipal.Height-frmPrincipal.imgLogotipo.Height)/3);
frmPrincipal.Arquivo.Visible:=False;
frmPrincipal.Compras.Visible:=False;
frmPrincipal.Vendas.Visible:=False;
frmPrincipal.Financas.Visible:=False;
frmPrincipal.Funcionarios.Visible:=False;
frmPrincipal.Configuracoes.Visible:=False;
frmPrincipal.Ajuda.Visible:=False;
frmPrincipal.btnAcessar.Visible:=True;
end;

procedure TfrmPrincipal.CadFuncionariosClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadFuncionarios, frmCadFuncionarios);
frmCadFuncionarios.ShowModal;
end;

procedure TfrmPrincipal.CadFornecedoresClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadFornecedores, frmCadFornecedores);
frmCadFornecedores.ShowModal;
end;

procedure TfrmPrincipal.CadClientesClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadClientes, frmCadClientes);
frmCadClientes.ShowModal;
end;

procedure TfrmPrincipal.CadProfissoesClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadProfissoes, frmCadProfissoes);
frmCadProfissoes.ShowModal;
end;

procedure TfrmPrincipal.CadProdutosClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
frmCadProdutos.ShowModal;
end;

procedure TfrmPrincipal.CadPropriedadesClick(Sender: TObject);
begin
Application.CreateForm(TfrmPropriedades, frmPropriedades);
frmPropriedades.ShowModal;
end;

procedure TfrmPrincipal.MotivosOutrasEntradasClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadMotivosEntrada, frmCadMotivosEntrada);
frmCadMotivosEntrada.ShowModal;
end;

procedure TfrmPrincipal.MotivosOutrasSaidasClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadMotivosSaida, frmCadMotivosSaida);
frmCadMotivosSaida.ShowModal;
end;

procedure TfrmPrincipal.CadConveniosClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadConvenios, frmCadConvenios);
frmCadConvenios.ShowModal;
end;

procedure TfrmPrincipal.CadBancosClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadBancos, frmCadBancos);
frmCadBancos.ShowModal;
end;

procedure TfrmPrincipal.CadCartoesCreditoClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadCartoesCredito, frmCadCartoesCredito);
frmCadCartoesCredito.ShowModal;
end;

procedure TfrmPrincipal.CliEtiquetasClick(Sender: TObject);
begin
Application.CreateForm(TfrmSelecaoClientes, frmSelecaoClientes);
frmSelecaoClientes.ShowModal;
end;

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPrincipal.CadPedidosClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadPedidos, frmCadPedidos);
frmCadPedidos.ShowModal;
end;

procedure TfrmPrincipal.CadRecebimentoClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadRecebimento, frmCadRecebimento);
frmCadRecebimento.ShowModal;
end;

procedure TfrmPrincipal.CadOutrasEntradasClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadEntradas, frmCadEntradas);
frmCadEntradas.ShowModal;
end;

procedure TfrmPrincipal.ConsPedidosClick(Sender: TObject);
begin
Application.CreateForm(TfrmPedidosPendentes, frmPedidosPendentes);
frmPedidosPendentes.ShowModal;
end;

procedure TfrmPrincipal.ConsProdutosClick(Sender: TObject);
begin
Application.CreateForm(TfrmProdutosPendentes, frmProdutosPendentes);
frmProdutosPendentes.ShowModal;
end;

procedure TfrmPrincipal.CadCtasPagarClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadCtasPagar, frmCadCtasPagar);
frmCadCtasPagar.ShowModal;
end;

procedure TfrmPrincipal.BxCtasPagarClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadPagtos, frmCadPagtos);
frmCadPagtos.ShowModal;
end;

procedure TfrmPrincipal.DepsitoCartoesCreditoClick(Sender: TObject);
begin
Application.CreateForm(TfrmDepositoCartoes, frmDepositoCartoes);
frmDepositoCartoes.ShowModal;
end;

procedure TfrmPrincipal.BxCtasReceberClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadRecebtos, frmCadRecebtos);
frmCadRecebtos.ShowModal;
end;

procedure TfrmPrincipal.ConsCtasPagarClick(Sender: TObject);
begin
Application.CreateForm(TfrmConsultarCtasPagar, frmConsultarCtasPagar);
frmConsultarCtasPagar.ShowModal;
end;

procedure TfrmPrincipal.ConsCtasReceberClick(Sender: TObject);
begin
Application.CreateForm(TfrmConsultarCtasReceber, frmConsultarCtasReceber);
frmConsultarCtasReceber.ShowModal;
end;

procedure TfrmPrincipal.ConsMovFinanceiraClick(Sender: TObject);
begin
Application.CreateForm(TfrmConsultarCaixa, frmConsultarCaixa);
frmConsultarCaixa.ShowModal;
end;

procedure TfrmPrincipal.EfetuarVendasClick(Sender: TObject);
begin
Application.CreateForm(TfrmVendas, frmVendas);
frmVendas.ShowModal;
end;

procedure TfrmPrincipal.CadOutrasSaidasClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadSaidas, frmCadSaidas);
frmCadSaidas.ShowModal;
end;

procedure TfrmPrincipal.MovCaixaClick(Sender: TObject);
begin
Application.CreateForm(TfrmMovCaixa, frmMovCaixa);
frmMovCaixa.ShowModal;
end;

procedure TfrmPrincipal.FecharCaixaClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.Open;
DMinloco.tblFaturamentos.Last;
if (DMInloco.tblFaturamentosData.Value=Date)
or (DMInloco.tblFaturamentosCod_Operador.IsNull) then
   begin
   Application.CreateForm(TfrmFecharCaixa, frmFecharCaixa);
   frmFecharCaixa.ShowModal;
   end
else
   begin
   DMInloco.tblFaturamentos.Close;
   beep;
   MessageDlg('N�o existem dados para fechamento do caixa',mtError,[mbOK],0);
   end;
end;

procedure TfrmPrincipal.RelVendasClick(Sender: TObject);
begin
Application.CreateForm(TfrmRelVendas, frmRelVendas);
frmRelVendas.ShowModal;
end;

procedure TfrmPrincipal.CadHorariosClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadHorarios, frmCadHorarios);
frmCadHorarios.ShowModal;
end;

procedure TfrmPrincipal.AlterarSenhaClick(Sender: TObject);
begin
Application.CreateForm(TfrmAlterarSenha, frmAlterarSenha);
frmAlterarSenha.ShowModal;
end;

procedure TfrmPrincipal.CalcComissaoClick(Sender: TObject);
begin
Application.CreateForm(TfrmCalcularComissoes, frmCalcularComissoes);
frmCalcularComissoes.ShowModal;
end;

procedure TfrmPrincipal.ConsHorarioClick(Sender: TObject);
begin
Application.CreateForm(TfrmConsultarHorarios, frmConsultarHorarios);
frmConsultarHorarios.ShowModal;
end;

procedure TfrmPrincipal.CordeFundo1Click(Sender: TObject);
begin
Application.CreateForm(TfrmCorFundo, frmCorFundo);
frmCorFundo.ShowModal;
end;

procedure TfrmPrincipal.MostrarLogotipoClick(Sender: TObject);
begin
if MostrarLogotipo.Checked then
   begin
   MostrarLogotipo.Checked:=False;
   imgLogotipo.Visible:=False;
   end
else
   begin
   MostrarLogotipo.Checked:=True;
   imgLogotipo.Visible:=True;
   end;
end;

procedure TfrmPrincipal.RelFornNomeClick(Sender: TObject);
begin
Application.CreateForm(TrptFornecedores, rptFornecedores);
DMInloco.tblFornecedores.Open;
DMInloco.tblFornecedores.IndexName:='Descr_Fornecedor';
rptFornecedores.relFornecedores.Preview;
DMInloco.tblFornecedores.Close;
end;

procedure TfrmPrincipal.RelFornCodigoClick(Sender: TObject);
begin
Application.CreateForm(TrptFornecedores, rptFornecedores);
DMInloco.tblFornecedores.Open;
DMInloco.tblFornecedores.IndexName:='';
rptFornecedores.relFornecedores.Preview;
DMInloco.tblFornecedores.Close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmPrincipal.btnAcessarClick(Sender: TObject);
begin
Application.CreateForm(TfrmSenha, frmSenha);
frmSenha.ShowModal;
end;

procedure TfrmPrincipal.LiberarAcessoClick(Sender: TObject);
begin
btnAcessar.Visible:=True;
frmPrincipal.Arquivo.Visible:=False;
frmPrincipal.Compras.Visible:=False;
frmPrincipal.Vendas.Visible:=False;
frmPrincipal.Financas.Visible:=False;
frmPrincipal.Funcionarios.Visible:=False;
frmPrincipal.Configuracoes.Visible:=False;
frmPrincipal.Ajuda.Visible:=False;
btnAcessar.SetFocus;
end;

procedure TfrmPrincipal.RelProdNomeClick(Sender: TObject);
begin
Application.CreateForm(TrptProdutos1, rptProdutos1);
DMInloco.tblProdutos.Open;
DMInloco.tblProdutos.IndexName:='Descr_Prod';
rptProdutos1.relProdutos.Preview;
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblProdutos.Close;
end;

procedure TfrmPrincipal.RelProdCategoriaClick(Sender: TObject);
begin
Application.CreateForm(TrptProdutos2, rptProdutos2);
DMInloco.tblProdCategoria.Open;
DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
DMInloco.tblProdutos.MasterSource:=DMInloco.dscProdCategoria;
DMInloco.tblProdutos.MasterFields:='Cod_Categoria';
DMInloco.tblProdutos.IndexName:='Categoria_Prod';
DMInloco.tblProdutos.Open;
rptProdutos2.relProdutos.Preview;
DMInloco.tblProdCategoria.IndexName:='';
DMInloco.tblProdCategoria.Close;
DMInloco.tblProdutos.MasterSource:=Nil;
DMInloco.tblProdutos.MasterFields:='';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblProdutos.Close;
end;

procedure TfrmPrincipal.RelCliNomeClick(Sender: TObject);
begin
Application.CreateForm(TrptClientes1, rptClientes1);
DMInloco.tblClientes.Open;
DMInloco.tblClientes.IndexName:='Descr_Cliente';
rptClientes1.relClientes.Preview;
DMInloco.tblClientes.Close;
end;

procedure TfrmPrincipal.RelCliProfissaoClick(Sender: TObject);
begin
Application.CreateForm(TrptClientes2, rptClientes2);
DMInloco.tblCliProfissoes.Open;
DMInloco.tblCliProfissoes.IndexName:='Descr_Profissao';
DMInloco.tblClientes.MasterSource:=DMInloco.dscCliProfissoes;
DMInloco.tblClientes.MasterFields:='Cod_Profissao';
DMInloco.tblClientes.IndexName:='Profissao_Cliente';
DMInloco.tblClientes.Open;
rptClientes2.relClientes.Preview;
DMInloco.tblCliProfissoes.IndexName:='';
DMInloco.tblCliProfissoes.Close;
DMInloco.tblClientes.MasterSource:=Nil;
DMInloco.tblClientes.MasterFields:='';
DMInloco.tblClientes.IndexName:='';
DMInloco.tblClientes.Close;
end;

procedure TfrmPrincipal.RelCliNiverClick(Sender: TObject);
begin
niver:=True;
Application.CreateForm(TrptClientes3, rptClientes3);
DMInloco.tblClientes.Filtered:=True;
DMInloco.tblClientes.Open;
DMInloco.tblClientes.IndexName:='Descr_Cliente';
rptClientes3.relClientes.Preview;
DMInloco.tblClientes.Filtered:=False;
DMInloco.tblClientes.Close;
niver:=False;
end;

procedure TfrmPrincipal.RelProdutosFaltaClick(Sender: TObject);
begin
Application.CreateForm(TrptProdutosEmFalta, rptProdutosEmFalta);
DMInloco.tblProdCategoria.Open;
DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
DMInloco.tblProdutos.MasterSource:=DMInloco.dscProdCategoria;
DMInloco.tblProdutos.MasterFields:='Cod_Categoria';
DMInloco.tblProdutos.IndexName:='Categoria_Prod';
DMInloco.tblProdutos.Open;
rptProdutosEmFalta.relProdutos.Preview;
DMInloco.tblProdCategoria.IndexName:='';
DMInloco.tblProdCategoria.Close;
DMInloco.tblProdutos.MasterSource:=Nil;
DMInloco.tblProdutos.MasterFields:='';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblProdutos.Filtered:=False;
DMInloco.tblProdutos.Close;
end;

procedure TfrmPrincipal.ConsFaturamentosClick(Sender: TObject);
begin
Application.CreateForm(TfrmConsultarFaturamentos, frmConsultarFaturamentos);
frmConsultarFaturamentos.ShowModal;
end;

procedure TfrmPrincipal.AlterarPrecosClick(Sender: TObject);
begin
Application.CreateForm(TfrmAlterarPrecos, frmAlterarPrecos);
frmAlterarPrecos.ShowModal;
end;

procedure TfrmPrincipal.SobreClick(Sender: TObject);
begin
Application.CreateForm(TfrmSobre, frmSobre);
frmSobre.ShowModal;
end;

end.
