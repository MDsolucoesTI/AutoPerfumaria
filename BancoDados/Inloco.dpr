program Inloco;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untCadFuncionarios in 'untCadFuncionarios.pas' {frmCadFuncionarios},
  untCadFornecedores in 'untCadFornecedores.pas' {frmCadFornecedores},
  untCadClientes in 'untCadClientes.pas' {frmCadClientes},
  untCadProfissoes in 'untCadProfissoes.pas' {frmCadProfissoes},
  untCadProdutos in 'untCadProdutos.pas' {frmCadProdutos},
  untPropriedades in 'untPropriedades.pas' {frmPropriedades},
  untCadConvenios in 'untCadConvenios.pas' {frmCadConvenios},
  untCadBancos in 'untCadBancos.pas' {frmCadBancos},
  untCadCartoesCredito in 'untCadCartoesCredito.pas' {frmCadCartoesCredito},
  untCadPedidos in 'untCadPedidos.pas' {frmCadPedidos},
  untVendas in 'untVendas.pas' {frmVendas},
  untMovCaixa in 'untMovCaixa.pas' {frmMovCaixa},
  untSenha in 'untSenha.pas' {frmSenha},
  untFecharCaixa in 'untFecharCaixa.pas' {frmFecharCaixa},
  untRelVendas in 'untRelVendas.pas' {frmRelVendas},
  untCadCtasPagar in 'untCadCtasPagar.pas' {frmCadCtasPagar},
  untCadHorarios in 'untCadHorarios.pas' {frmCadHorarios},
  untAlterarSenha in 'untAlterarSenha.pas' {frmAlterarSenha},
  untPedidosPendentes in 'untPedidosPendentes.pas' {frmPedidosPendentes},
  untConsultarCtasPagar in 'untConsultarCtasPagar.pas' {frmConsultarCtasPagar},
  untConsultarCtasReceber in 'untConsultarCtasReceber.pas' {frmConsultarCtasReceber},
  untConsultarCtasTotal in 'untConsultarCtasTotal.pas' {frmConsultarCtasTotal},
  untConsultarCaixa in 'untConsultarCaixa.pas' {frmConsultarCaixa},
  untCalcularComisoes in 'untCalcularComisoes.pas' {frmCalcularComissoes},
  untConsultarHorarios in 'untConsultarHorarios.pas' {frmConsultarHorarios},
  untProdutosPendentes in 'untProdutosPendentes.pas' {frmProdutosPendentes},
  untDMInloco in 'untDMInloco.pas' {DMInloco: TDataModule},
  untCadRecebimento in 'untCadRecebimento.pas' {frmCadRecebimento},
  untLocBancos in 'untLocBancos.pas' {frmLocBancos},
  untLocConvenios in 'untLocConvenios.pas' {frmLocConvenios},
  untLocCartoesCredito in 'untLocCartoesCredito.pas' {frmLocCartoesCredito},
  untLocFuncionarios in 'untLocFuncionarios.pas' {frmLocFuncionarios},
  untLocFornecedores in 'untLocFornecedores.pas' {frmLocFornecedores},
  untLocClientes in 'untLocClientes.pas' {frmLocClientes},
  untLocProfissoes in 'untLocProfissoes.pas' {frmLocProfissoes},
  untLocProdutos in 'untLocProdutos.pas' {frmLocProdutos},
  untLocGrupos in 'untLocGrupos.pas' {frmLocGrupos},
  untLocCategorias in 'untLocCategorias.pas' {frmLocCategorias},
  untLocPedidos in 'untLocPedidos.pas' {frmLocPedidos},
  untLocFotos in 'untLocFotos.pas' {frmLocFotos},
  untRptFornecedores in 'untRptFornecedores.pas' {rptFornecedores},
  untLocCtasPagar in 'untLocCtasPagar.pas' {frmLocCtasPagar},
  untCadPagtos in 'untCadPagtos.pas' {frmCadPagtos},
  untDepositoCartoes in 'untDepositoCartoes.pas' {frmDepositoCartoes},
  untCadRecebtos in 'untCadRecebtos.pas' {frmCadRecebtos},
  untConsultarVendas in 'untConsultarVendas.pas' {frmConsultarVendas},
  untCadEntradas in 'untCadEntradas.pas' {frmCadEntradas},
  untCadSaidas in 'untCadSaidas.pas' {frmCadSaidas},
  untCadMotivosEntrada in 'untCadMotivosEntrada.pas' {frmCadMotivosEntrada},
  untCadMotivosSaida in 'untCadMotivosSaida.pas' {frmCadMotivosSaida},
  untRptProdutos1 in 'untRptProdutos1.pas' {rptProdutos1},
  untRptProdutos2 in 'untRptProdutos2.pas' {rptProdutos2},
  untRptClientes1 in 'untRptClientes1.pas' {rptClientes1},
  untRptClientes2 in 'untRptClientes2.pas' {rptClientes2},
  untRptClientes3 in 'untRptClientes3.pas' {rptClientes3},
  untRptPedidos1 in 'untRptPedidos1.pas' {rptPedidos1},
  untRptProdutosEmFalta in 'untRptProdutosEmFalta.pas' {rptProdutosEmFalta},
  untRptDetCtasPagar in 'untRptDetCtasPagar.pas' {rptDetCtasPagar},
  untRptCtasReceber in 'untRptCtasReceber.pas' {rptCtasReceber},
  untRptMovFinanceira in 'untRptMovFinanceira.pas' {rptMovFinanceira},
  untRptCliEtiquetas in 'untRptCliEtiquetas.pas' {rptCliEtiquetas: TQuickRep},
  untSelecaoClientes in 'untSelecaoClientes.pas' {frmSelecaoClientes},
  untRptHorarios in 'untRptHorarios.pas' {rptHorarios},
  untRptComissoes in 'untRptComissoes.pas' {rptComissoes},
  untRptFecharCaixa in 'untRptFecharCaixa.pas' {rptFecharCaixa},
  untRptVendas in 'untRptVendas.pas' {rptVendas},
  untConsultarFaturamentos in 'untConsultarFaturamentos.pas' {frmConsultarFaturamentos},
  untRptFaturamentos in 'untRptFaturamentos.pas' {rptFaturamentos},
  untAlterarPrecos in 'untAlterarPrecos.pas' {frmAlterarPrecos},
  untRptRecebimentos in 'untRptRecebimentos.pas' {rptRecebimentos},
  untRptPedidosPendentes in 'untRptPedidosPendentes.pas' {rptPedidosPendentes},
  untRptProdutosPendentes in 'untRptProdutosPendentes.pas' {rptProdutosPendentes},
  untSobre in 'untSobre.pas' {frmSobre};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMInloco, DMInloco);
  Application.CreateForm(TrptCliEtiquetas, rptCliEtiquetas);
  Application.Run;
end.