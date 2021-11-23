//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptRecebimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptRecebimentos = class(TForm)
    relPedidos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    txtQuant: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    GroupHeaderBand1: TQRBand;
    lblIpi: TQRLabel;
    lblQuant: TQRLabel;
    lblProduto: TQRLabel;
    lblValorUnitario: TQRLabel;
    lblSubTotal: TQRLabel;
    PageHeaderBand1: TQRBand;
    lblTitulo: TQRLabel;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    lblPedido: TQRLabel;
    lblFornecedor: TQRLabel;
    lblFormaPagto: TQRLabel;
    lblItens: TQRLabel;
    lblValorTotal: TQRLabel;
    lblData: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRImage2: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    lblNovo: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptRecebimentos: TrptRecebimentos;

implementation

uses untDMInloco;

{$R *.DFM}

procedure TrptRecebimentos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   novo:Real;
begin
Novo:=0;
DMInloco.tblProdutos.Locate('Cod_Produto',
DMInloco.tblDetPedidosCod_Produto.Value,[]);
DMInloco.tblProdCategoria.FindKey([DMInloco.tblProdutosCod_Categoria.Value]);
if DMInloco.tblProdutosPreco_Venda.Value>0 then
   if (DMInloco.tblDetPedidosValor_Unitario.Value+
   ((DMInloco.tblProdCategoriaMargem_Lucro.Value-
   DMInloco.tblProdCategoriaDiferenca_Permitida.Value)*
   DMInloco.tblDetPedidosValor_Unitario.Value/100)>
   DMInloco.tblProdutosPreco_Venda.Value) or
   (DMInloco.tblDetPedidosValor_Unitario.Value+
   ((DMInloco.tblProdCategoriaMargem_Lucro.Value+
   DMInloco.tblProdCategoriaDiferenca_Permitida.Value)*
   DMInloco.tblDetPedidosValor_Unitario.Value/100)<
   DMInloco.tblProdutosPreco_Venda.Value) then
      Novo:=DMInloco.tblDetPedidosValor_Unitario.Value+
      (DMInloco.tblProdCategoriaMargem_Lucro.Value*
      DMInloco.tblDetPedidosValor_Unitario.Value/100);
if novo>0 then
   lblNovo.Caption:=FloatToStrf(Novo,ffFixed,5,2)
else
   lblNovo.Caption:='';
end;


end.
