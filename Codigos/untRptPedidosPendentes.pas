//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptPedidosPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptPedidosPendentes = class(TForm)
    relPedidos: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    lblTitulo: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    lblTotal: TQRLabel;
    procedure relPedidosBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptPedidosPendentes: TrptPedidosPendentes;
  valor:real;

implementation

uses untDMInloco;

{$R *.DFM}


procedure TrptPedidosPendentes.relPedidosBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
valor:=0;
end;

procedure TrptPedidosPendentes.QRDBText5Print(sender: TObject;
  var Value: String);
begin
valor:=valor+DMInloco.tblPedidosValor_Total.Value;
end;

procedure TrptPedidosPendentes.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
lblTotal.Caption:=FloatToStrF(valor,ffFixed,6,2);
end;

end.
