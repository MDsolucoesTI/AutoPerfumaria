//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptPedidos1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TrptPedidos1 = class(TForm)
    relPedidos: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    lblTitulo: TQRLabel;
    QRSysData2: TQRSysData;
    QRImage2: TQRImage;
    lblPerfumaria: TQRLabel;
    lblEndereco: TQRLabel;
    lblTelefone: TQRLabel;
    lblCgc: TQRLabel;
    lblIE: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
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
    QRDBText7: TQRDBText;
    txtQuant: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    GroupHeaderBand1: TQRBand;
    lblProduto: TQRLabel;
    lblQuant: TQRLabel;
    lblIpi: TQRLabel;
    lblValorUnitario: TQRLabel;
    lblSubTotal: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure relPedidosBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptPedidos1: TrptPedidos1;

implementation

uses untDMInloco;

{$R *.DFM}

procedure TrptPedidos1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TrptPedidos1.relPedidosBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
if DMinloco.tblPedidosData_Recebimento.IsNull then
   txtQuant.DataField:='Quant_Pedida'
else
   txtQuant.DataField:='Quant_Recebida';
end;

end.
