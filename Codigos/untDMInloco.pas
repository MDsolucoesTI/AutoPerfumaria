//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untDMInloco;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;
  
type
  TDMInloco = class(TDataModule)
    tblBancos: TTable;
    tblCartoesCredito: TTable;
    tblClientes: TTable;
    tblCliProfissoes: TTable;
    tblConvenios: TTable;
    tblCtaPagar: TTable;
    tblCtaReceber: TTable;
    tblDetCtaPagar: TTable;
    tblDetMovCaixa: TTable;
    tblDetPedidos: TTable;
    tblDetPedidos2: TTable;
    tblDetVendas: TTable;
    tblFormaPagto: TTable;
    tblFornecedores: TTable;
    tblFuncHorarios: TTable;
    tblFuncionarios: TTable;
    tblMovFinanceira: TTable;
    tblMovCaixa: TTable;
    tblNfCtaPagar: TTable;
    tblPedidos: TTable;
    tblProdCategoria: TTable;
    tblProdGrupo: TTable;
    tblProdutos: TTable;
    tblVendas: TTable;
    dscBancos: TDataSource;
    dscCartoesCredito: TDataSource;
    dscClientes: TDataSource;
    dscCliProfissoes: TDataSource;
    dscConvenios: TDataSource;
    dscCtaPagar: TDataSource;
    dscCtaReceber: TDataSource;
    dscDetCtaPagar: TDataSource;
    dscDetMovCaixa: TDataSource;
    dscDetPedidos: TDataSource;
    dscDetPedidos2: TDataSource;
    dscDetVendas: TDataSource;
    dscFornecedores: TDataSource;
    dscFormaPagto: TDataSource;
    dscNfCtaPagar: TDataSource;
    dscMovCaixa: TDataSource;
    dscFuncionarios: TDataSource;
    dscFuncHorarios: TDataSource;
    dscMovFinanceira: TDataSource;
    dscPedidos: TDataSource;
    dscProdCategoria: TDataSource;
    dscProdGrupo: TDataSource;
    dscProdutos: TDataSource;
    dscUltimasCompras: TDataSource;
    dscVendas: TDataSource;
    queUltimasCompras: TQuery;
    tblProdutosCod_Produto: TStringField;
    tblProdutosGrupo: TStringField;
    tblProdutosCategoria: TStringField;
    tblProdutosProduto: TStringField;
    tblProdutosCod_Grupo: TIntegerField;
    tblProdutosCod_Categoria: TIntegerField;
    tblProdutosPreco_Venda: TFloatField;
    tblProdutosPreco_Promocao: TFloatField;
    tblProdutosQuant_Atual: TIntegerField;
    tblProdutosQuant_Min: TIntegerField;
    tblProdutosQuant_Max: TIntegerField;
    tblProdGrupoCod_Grupo: TIntegerField;
    tblProdGrupoGrupo: TStringField;
    tblProdGrupoFoto_Produto: TBlobField;
    tblProdCategoriaCod_Categoria: TIntegerField;
    tblProdCategoriaCategoria: TStringField;
    tblProdCategoriaMargem_Lucro: TFloatField;
    tblProdCategoriaDiferenca_Permitida: TFloatField;
    tblFornecedoresCod_Fornecedor: TIntegerField;
    tblFornecedoresNome_Fantasia: TStringField;
    tblFornecedoresRazao_Social: TStringField;
    tblFornecedoresEndereco: TStringField;
    tblFornecedoresBairro: TStringField;
    tblFornecedoresCidade: TStringField;
    tblFornecedoresUF: TStringField;
    tblFornecedoresCep: TStringField;
    tblFornecedoresTel_Forn: TStringField;
    tblFornecedoresFax_Forn: TStringField;
    tblFornecedoresNome_Vendedor: TStringField;
    tblFornecedoresTel_Vendedor: TStringField;
    tblFornecedoresCond_Pagto: TStringField;
    tblFornecedoresPrazo_Entrega: TIntegerField;
    tblPedidosCod_Pedido: TIntegerField;
    tblPedidosData_Pedido: TDateField;
    tblPedidosCod_Fornecedor: TIntegerField;
    tblPedidosData_Recebimento: TDateField;
    tblPedidosForma_Pagto: TStringField;
    tblPedidosFornecedor: TStringField;
    tblPedidosNum_Itens: TIntegerField;
    tblDetPedidosCod_Produto: TStringField;
    tblDetPedidosCod_Pedido: TIntegerField;
    tblDetPedidosProduto: TStringField;
    tblDetPedidosIPI: TFloatField;
    tblDetPedidosValor_Total: TFloatField;
    tblDetPedidosQuant_Pedida: TIntegerField;
    tblDetPedidosQuant_Recebida: TIntegerField;
    tblDetPedidosValor_Unitario: TFloatField;
    tblFormaPagtoCod_Forma_Pagto: TIntegerField;
    tblFormaPagtoForma_Pagto: TStringField;
    tblCtaPagarCod_Cta_Pagar: TIntegerField;
    tblCtaPagarCod_Fornecedor: TIntegerField;
    tblCtaPagarDescricao: TStringField;
    tblDetCtaPagarCod_Cta_Pagar: TIntegerField;
    tblDetCtaPagarNum_Parcela: TIntegerField;
    tblDetCtaPagarVencimento: TDateField;
    tblDetCtaPagarValor: TFloatField;
    tblDetCtaPagarData_Pagto: TDateField;
    tblDetCtaPagarValor_Pago: TFloatField;
    tblNfCtaPagarCod_Cta_Pagar: TIntegerField;
    tblNfCtaPagarNum_Nf: TIntegerField;
    tblVendasValor_Total: TFloatField;
    tblVendasDesconto: TFloatField;
    tblVendasCod_Operador: TIntegerField;
    tblVendasCod_Vendedor: TIntegerField;
    tblDetVendasCod_Venda: TIntegerField;
    tblDetVendasQuant_Vendida: TIntegerField;
    tblDetVendasValor_Unitario: TFloatField;
    tblDetVendasCod_Produto: TStringField;
    tblCtaReceberCod_Cta_Receber: TIntegerField;
    tblCtaReceberData_Vencimento: TDateField;
    tblCtaReceberCod_Venda: TIntegerField;
    tblCtaReceberCod_Cliente: TIntegerField;
    tblCtaReceberCod_Forma_Pagto: TIntegerField;
    tblCtaReceberValor: TFloatField;
    tblCtaReceberData_Recebimento: TDateField;
    tblCtaReceberValor_Recebido: TFloatField;
    tblCtaReceberNum_Promissoria: TIntegerField;
    tblCtaReceberCod_Convenio: TIntegerField;
    tblCtaReceberNum_Banco: TIntegerField;
    tblCtaReceberNum_Agencia: TIntegerField;
    tblCtaReceberNum_Cheque: TIntegerField;
    tblCtaReceberCod_Cartao: TIntegerField;
    tblCtaReceberNum_Autorizacao: TIntegerField;
    tblConveniosCod_Convenio: TIntegerField;
    tblConveniosConvenio: TStringField;
    tblConveniosDia_Vencimento: TIntegerField;
    tblBancosNum_Banco: TIntegerField;
    tblBancosBanco: TStringField;
    tblCartoesCreditoCod_Cartao: TIntegerField;
    tblCartoesCreditoCartao: TStringField;
    tblCartoesCreditoTempo_Recebimento: TIntegerField;
    tblCartoesCreditoValor_Autorizacao: TFloatField;
    tblMovCaixaCod_Mov: TIntegerField;
    tblMovCaixaHorario: TTimeField;
    tblMovCaixaCod_Operador: TIntegerField;
    tblMovCaixaEspecie_Mov: TStringField;
    tblMovCaixaOperador: TStringField;
    tblMovCaixaData_Mov: TDateField;
    tblMovCaixaValor_Total: TFloatField;
    tblMovCaixaObservacoes: TStringField;
    tblDetMovCaixaCod_Mov: TIntegerField;
    tblDetMovCaixaCod_Forma_Pagto: TIntegerField;
    tblDetMovCaixaValor: TFloatField;
    tblClientesCod_Cliente: TIntegerField;
    tblClientesCliente: TStringField;
    tblClientesData_Aniversario: TStringField;
    tblClientesSexo: TStringField;
    tblClientesEndereco: TStringField;
    tblClientesBairro: TStringField;
    tblClientesCidade: TStringField;
    tblClientesUf: TStringField;
    tblClientesCep: TStringField;
    tblClientesTel_Res: TStringField;
    tblClientesTel_Com: TStringField;
    tblClientesCod_Profissao: TIntegerField;
    tblCliProfissoesCod_Profissao: TIntegerField;
    tblCliProfissoesProfissao: TStringField;
    tblFuncionariosCod_Funcionario: TIntegerField;
    tblFuncionariosNome: TStringField;
    tblFuncionariosApelido: TStringField;
    tblFuncionariosSenha: TStringField;
    tblFuncionariosCod_Acesso: TStringField;
    tblFuncHorariosCod_Funcionario: TIntegerField;
    tblFuncHorariosData: TDateField;
    tblFuncHorariosObservacoes: TStringField;
    tblMovFinanceiraCod_Operacao: TIntegerField;
    tblMovFinanceiraEspecie: TStringField;
    tblMovFinanceiraValor: TFloatField;
    tblPedidosValor_Total: TFloatField;
    tblDetPedidos2Cod_Pedido: TIntegerField;
    tblDetPedidos2Cod_Produto: TStringField;
    tblDetPedidos2Quant_Pedida: TIntegerField;
    tblDetPedidos2Quant_Recebida: TIntegerField;
    queUltimasComprasNome_Fantasia: TStringField;
    queUltimasComprasData_Pedido: TDateField;
    queUltimasComprasData_Recebimento: TDateField;
    queUltimasComprasCod_Produto: TStringField;
    queUltimasComprasQuant_Pedida: TIntegerField;
    queUltimasComprasQuant_Recebida: TIntegerField;
    queUltimasComprasValor_Unitario: TFloatField;
    queProdutosPendentes: TQuery;
    dscProdutosPendentes: TDataSource;
    queProdutosPendentesData_Pedido: TDateField;
    queProdutosPendentesData_Recebimento: TDateField;
    queProdutosPendentesValor_Unitario: TFloatField;
    queProdutosPendentesProduto: TStringField;
    queProdutosPendentesPreco_Venda: TFloatField;
    queProdutosPendentesNome_Fantasia: TStringField;
    queProdutosPendentesPrazo_Entrega: TIntegerField;
    queProdutosPendentesNovo_Valor: TFloatField;
    queProdutosPendentesMargem_Lucro: TFloatField;
    queProdutosPendentesDiferenca_Permitida: TFloatField;
    queProdutosPendentesQuant_Pedida: TIntegerField;
    tblCtaPagarFornecedor: TStringField;
    tblCtaPagarQuitado: TBooleanField;
    tblCtaReceberCliente: TStringField;
    tblCtaReceberCartao: TStringField;
    tblCtaReceberBanco: TStringField;
    tblCtaReceberFormaPagto: TStringField;
    tblCtaReceberConvenio: TStringField;
    tblCtaReceberData_Deposito_Cartao: TDateField;
    tblMovFinanceiraData_Operacao: TDateField;
    tblVendasOperador: TStringField;
    tblVendasVendedor: TStringField;
    tblDetVendasProduto: TStringField;
    tblDetVendasValor_Total: TFloatField;
    tblVendasValor_Final: TFloatField;
    tblMotivosEntrada: TTable;
    tblOutrasEntradas: TTable;
    tblMotivosSaida: TTable;
    tblOutrasSaidas: TTable;
    dscMotivosEntrada: TDataSource;
    dscOutrasEntradas: TDataSource;
    dscMotivosSaida: TDataSource;
    dscOutrasSaidas: TDataSource;
    tblMotivosEntradaCod_Motivo: TIntegerField;
    tblMotivosEntradaMotivo: TStringField;
    tblOutrasEntradasCod_Entrada: TIntegerField;
    tblOutrasEntradasCod_Produto: TStringField;
    tblOutrasEntradasCod_Motivo: TIntegerField;
    tblOutrasEntradasQuantidade: TIntegerField;
    tblOutrasEntradasData_Entrada: TDateField;
    tblMotivosSaidaCod_Motivo: TIntegerField;
    tblMotivosSaidaMotivo: TStringField;
    tblOutrasSaidasCod_Saida: TIntegerField;
    tblOutrasSaidasCod_Produto: TStringField;
    tblOutrasSaidasCod_Motivo: TIntegerField;
    tblOutrasSaidasQuantidade: TIntegerField;
    tblOutrasSaidasData_Saida: TDateField;
    tblMovFinanceiraHistorico: TStringField;
    tblCtaPagarValor_Total: TFloatField;
    tblCtaPagarValor_Pago: TFloatField;
    tblMovFinanceiraReferencia: TIntegerField;
    queCtasPagar: TQuery;
    dscCtasPagar: TDataSource;
    queCtasPagarNome_Fantasia: TStringField;
    queCtasPagarCod_Cta_Pagar: TIntegerField;
    queCtasPagarDescricao: TStringField;
    queCtasPagarNum_Parcela: TIntegerField;
    queCtasPagarVencimento: TDateField;
    queCtasPagarValor: TFloatField;
    tblProdutosPedido: TIntegerField;
    tblProdutosData_Ultima_Compra: TDateField;
    tblProdutosQuant_Ultima_Compra: TIntegerField;
    tblProdutosForn_Ultima_Compra: TIntegerField;
    tblProdutosPreco_Ultima_Compra: TFloatField;
    tblProdutosFornecedor: TStringField;
    tblCartoesCreditoValor_Desconto: TFloatField;
    tblDetVendasData_Venda: TDateField;
    tblVendasData_Venda: TDateField;
    tblVendasCod_Venda: TIntegerField;
    tblCtaReceberData_Venda: TDateField;
    tblMovFinanceiraData_Referencia: TDateField;
    tblDetMovCaixaData_Mov: TDateField;
    tblFaturamentos: TTable;
    dscFaturamentos: TDataSource;
    tblFaturamentosData: TDateField;
    tblFaturamentosValor_Bruto: TFloatField;
    tblFaturamentosDiferenca_Caixa: TFloatField;
    tblFaturamentosTotal_Vendas: TIntegerField;
    tblFaturamentosHorario: TTimeField;
    tblFaturamentosCod_Operador: TIntegerField;
    tblFaturamentosOperador: TStringField;
    tblDetMovCaixaForma_Pagto: TStringField;
    tblFaturamentosValor_Liquido: TFloatField;
    tblOutrasSaidasMotivo: TStringField;
    tblOutrasEntradasMotivo: TStringField;
    tblOutrasSaidasValor_Unitario: TFloatField;
    tblOutrasEntradasValor_Unitario: TFloatField;
    tblOutrasEntradasValor_Total: TFloatField;
    tblOutrasSaidasValor_Total: TFloatField;
    tblDetVendas2: TTable;
    dscDetVendas2: TDataSource;
    tblVendasHorario_Venda: TTimeField;
    tblFuncHorariosPeriodo1: TTimeField;
    tblFuncHorariosPeriodo2: TTimeField;
    tblFuncHorariosPeriodo3: TTimeField;
    tblFuncHorariosPeriodo4: TTimeField;
    tblFuncHorariosHoras_Normais: TTimeField;
    tblFuncHorariosHoras_Extras1: TTimeField;
    tblFuncHorariosHoras_Extras2: TTimeField;
    tblFuncHorariosHoras_Trab: TTimeField;
    tblFuncComissoes: TTable;
    dscFuncComissoes: TDataSource;
    tblFuncComissoesData_Venda: TDateField;
    tblFuncComissoesCod_Funcionario: TIntegerField;
    tblFuncComissoesQuant_Vendas: TIntegerField;
    tblFuncComissoesValor_Vendas: TFloatField;
    tblFuncComissoesValor_Comissao: TFloatField;
    tblFuncionariosComissao: TFloatField;
    tblFuncionariosValor_HENormal: TFloatField;
    tblFuncionariosValor_HEExcedente: TFloatField;
    tblOutrasEntradasProduto: TStringField;
    tblOutrasSaidasProduto: TStringField;
    tblClientesProfissao: TStringField;
    tblPedidosFornecedor2: TStringField;
    tblFaturamentosValor_Desconto: TFloatField;
    tblDetVendasControle: TIntegerField;
    tblPedidosData_Previsao: TDateField;
    tblDetPedidosControle: TIntegerField;
    queProdutosPendentesData_Previsao: TDateField;
    tblClientesRg: TStringField;
    tblClientesCpf: TStringField;
    tblCtaReceberValor_Receber: TFloatField;
    tblCtaReceberNum_Cartao: TStringField;
    procedure tblDetPedidosCalcFields(DataSet: TDataSet);
    procedure tblDetPedidosQuant_RecebidaChange(Sender: TField);
    procedure tblDetVendasCalcFields(DataSet: TDataSet);
    procedure tblVendasCalcFields(DataSet: TDataSet);
    procedure tblDetVendasBeforeDelete(DataSet: TDataSet);
    procedure tblFaturamentosCalcFields(DataSet: TDataSet);
    procedure tblOutrasEntradasCalcFields(DataSet: TDataSet);
    procedure tblOutrasSaidasCalcFields(DataSet: TDataSet);
    procedure tblFuncHorariosCalcFields(DataSet: TDataSet);
    procedure tblFuncComissoesCalcFields(DataSet: TDataSet);
    procedure tblClientesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure queProdutosPendentesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMInloco: TDMInloco;
  niver:Boolean=False;

implementation

uses untCadRecebimento, untPrincipal;

{$R *.DFM}

function CalculaHE(const Hora:integer):String;
var
   HoraInt,Minutos:integer;
begin
HoraInt:=Trunc(Hora/60);
Minutos:=Hora-(HoraInt*60);
if Length(IntToStr(HoraInt))=1 then
   Result:='0'+IntToStr(HoraInt)
else
   Result:=IntToStr(HoraInt);
Result:=Result+':';
if Length(IntToStr(Minutos))=1 then
   Result:=Result+'0'+IntToStr(Minutos)
else
   Result:=Result+IntToStr(Minutos);
Result:=Result+':00'
end;

procedure TDMInloco.tblDetPedidosCalcFields(DataSet: TDataSet);
var
 Quant:integer;
 ipi:real;
begin
if tblDetPedidosQuant_Recebida.IsNull then
   Quant:=tblDetPedidosQuant_Pedida.Value
else
   Quant:=tblDetPedidosQuant_Recebida.Value;
if tblDetPedidosIpi.Value<>0 then
   ipi:=tblDetPedidosIpi.Value/100*tblDetPedidosValor_Unitario.Value
else
   ipi:=0;
tblDetPedidosValor_Total.Value:=Quant*(tblDetPedidosValor_Unitario.Value+ipi);
end;

procedure TDMInloco.tblDetPedidosQuant_RecebidaChange(Sender: TField);
var
 Quant:integer;
 ipi:real;
begin
if tblDetPedidosQuant_Recebida.IsNull then
   Quant:=0
else
   Quant:=tblDetPedidosQuant_Recebida.Value;
if tblDetPedidosIpi.Value<>0 then
   ipi:=tblDetPedidosIpi.Value/100*tblDetPedidosValor_Unitario.Value
else
   ipi:=0;
tblDetPedidosValor_Total.Value:=Quant*(tblDetPedidosValor_Unitario.Value+ipi);
end;

procedure TDMInloco.tblDetVendasCalcFields(DataSet: TDataSet);
begin
DMInloco.tblDetVendasValor_Total.Value:=
DMInloco.tblDetVendasQuant_Vendida.Value*
DMInloco.tblDetVendasValor_Unitario.Value;
end;

procedure TDMInloco.tblVendasCalcFields(DataSet: TDataSet);
begin
DMInloco.tblVendasValor_Final.Value:=
DMInloco.tblVendasValor_Total.Value-
DMInloco.tblVendasDesconto.Value;
end;

procedure TDMInloco.tblDetVendasBeforeDelete(DataSet: TDataSet);
begin
DMInloco.tblProdutos.FindKey([DMInloco.tblDetVendasCod_Produto.Value]);
DMInloco.tblProdutos.Edit;
DMInloco.tblProdutosQuant_Atual.Value:=
DMInloco.tblProdutosQuant_Atual.Value+
DMInloco.tblDetVendasQuant_Vendida.Value;
DMInloco.tblProdutos.Post;
DMInloco.tblVendas.Edit;
DMInloco.tblVendasValor_Total.Value:=
DMInloco.tblVendasValor_Total.Value-
DMInloco.tblDetVendasValor_Total.Value;
DMInloco.tblVendas.Post;
end;

procedure TDMInloco.tblFaturamentosCalcFields(DataSet: TDataSet);
begin
DMInloco.tblFaturamentosValor_Liquido.Value:=
DMInloco.tblFaturamentosValor_Bruto.Value+
DMInloco.tblFaturamentosDiferenca_Caixa.Value-
DMInloco.tblFaturamentosValor_Desconto.Value;
end;

procedure TDMInloco.tblOutrasEntradasCalcFields(DataSet: TDataSet);
begin
DMInloco.tblOutrasEntradasValor_Total.Value:=
DMInloco.tblOutrasEntradasValor_Unitario.Value*
DMInloco.tblOutrasEntradasQuantidade.Value;
end;

procedure TDMInloco.tblOutrasSaidasCalcFields(DataSet: TDataSet);
begin
DMInloco.tblOutrasSaidasValor_Total.Value:=
DMInloco.tblOutrasSaidasValor_Unitario.Value*
DMInloco.tblOutrasSaidasQuantidade.Value;
end;

procedure TDMInloco.tblFuncHorariosCalcFields(DataSet: TDataSet);
var
   Hora1,Hora2:TdateTime;
   Hora,Max:Integer;
begin
Hora1:=StrToTime('00:00:00');
Hora2:=StrToTime('00:00:00');
if not DMInloco.tblFuncHorariosPeriodo1.IsNull then
   begin
   if not DMInloco.tblFuncHorariosPeriodo2.IsNull then
      begin
      Hora1:=DMInloco.tblFuncHorariosPeriodo2.Value-
             DMInloco.tblFuncHorariosPeriodo1.Value;
      if not DMInloco.tblFuncHorariosPeriodo4.IsNull then
         begin
         Hora2:=DMInloco.tblFuncHorariosPeriodo4.Value-
             DMInloco.tblFuncHorariosPeriodo3.Value;
         end
      else
         begin
         Hora2:=StrToTime('00:00:00');
         end;
      end
   else
      begin
      if not DMInloco.tblFuncHorariosPeriodo4.IsNull then
         begin
         Hora1:=DMInloco.tblFuncHorariosPeriodo4.Value-
                DMInloco.tblFuncHorariosPeriodo1.Value;
         Hora2:=StrToTime('00:00:00');
         end
      else
         begin
         Hora1:=StrToTime('00:00:00');
         Hora2:=StrToTime('00:00:00');
         end;
      end;
   end
else
   begin
   if not DMInloco.tblFuncHorariosPeriodo4.IsNull then
      begin
      Hora1:=StrToTime('00:00:00');
      Hora2:=DMInloco.tblFuncHorariosPeriodo4.Value-
             DMInloco.tblFuncHorariosPeriodo3.Value;
      end;
   end;
DMInloco.tblFuncHorariosHoras_Trab.Value:=Hora1+Hora2;
Hora:=StrToInt(Copy(TimeToStr(DMInloco.tblFuncHorariosHoras_Trab.Value),1,2))*60+
      StrToInt(Copy(TimeToStr(DMInloco.tblFuncHorariosHoras_Trab.Value),4,2));
case DayOfWeek(DMInloco.tblFuncHorariosData.Value) of
   1,7:max:=240;
else max:=480;
end;
if hora>max then
   begin
   case DayOfWeek(DMInloco.tblFuncHorariosData.Value) of
      1,7:DMInloco.tblFuncHorariosHoras_Normais.Value:=StrToTime('04:00:00');
   else DMInloco.tblFuncHorariosHoras_Normais.Value:=StrToTime('08:00:00');
   end;

   Hora:=Hora-max;
   if Hora>=120 then
      begin
      DMInloco.tblFuncHorariosHoras_Extras1.Value:=StrToTime('02:00:00');
      Hora:=Hora-120;
      DMInloco.tblFuncHorariosHoras_Extras2.Value:=StrToTime(CalculaHE(Hora));
      end
   else
      begin
      DMInloco.tblFuncHorariosHoras_Extras1.Value:=StrToTime(CalculaHE(Hora));
      DMInloco.tblFuncHorariosHoras_Extras2.Value:=StrToTime('00:00:00');
      end;
   end
else
   begin
   DMInloco.tblFuncHorariosHoras_Normais.Value:=
   DMInloco.tblFuncHorariosHoras_Trab.Value;
   DMInloco.tblFuncHorariosHoras_Extras1.Value:=StrToTime('00:00:00');
   DMInloco.tblFuncHorariosHoras_Extras2.Value:=StrToTime('00:00:00');
   end;
end;

procedure TDMInloco.tblFuncComissoesCalcFields(DataSet: TDataSet);
begin
DMInloco.tblFuncComissoesValor_Comissao.Value:=
DMInloco.tblFuncComissoesValor_Vendas.Value*
DMInloco.tblFuncionariosComissao.Value/100;
end;

procedure TDMInloco.tblClientesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
   mes:String;
begin
mes:=copy(DateToStr(date),4,2);
if niver then
   if Copy(DMInloco.tblClientesData_Aniversario.Value,4,2)=mes then
      Accept:=True
   else
      Accept:=False;
end;

procedure TDMInloco.queProdutosPendentesCalcFields(DataSet: TDataSet);
begin
if DMInloco.queProdutosPendentesPreco_Venda.Value>0 then
if (DMInloco.queProdutosPendentesValor_Unitario.Value+
((DMInloco.queProdutosPendentesMargem_Lucro.Value-
DMInloco.queProdutosPendentesDiferenca_Permitida.Value)*
DMInloco.queProdutosPendentesValor_Unitario.Value/100)>
DMInloco.queProdutosPendentesPreco_Venda.Value) or
(DMInloco.queProdutosPendentesValor_Unitario.Value+
((DMInloco.queProdutosPendentesMargem_Lucro.Value+
DMInloco.queProdutosPendentesDiferenca_Permitida.Value)*
DMInloco.queProdutosPendentesValor_Unitario.Value/100)<
DMInloco.queProdutosPendentesPreco_Venda.Value) then
   DMInloco.queProdutosPendentesNovo_Valor.Value:=
   DMInloco.queProdutosPendentesValor_Unitario.Value+
   (DMInloco.queProdutosPendentesValor_Unitario.Value*
   DMInloco.queProdutosPendentesMargem_Lucro.Value/100);
end;

end.
