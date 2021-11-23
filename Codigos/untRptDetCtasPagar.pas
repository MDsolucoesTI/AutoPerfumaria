//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptDetCtasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptDetCtasPagar = class(TForm)
    relCtasPagar: TQuickRep;
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
    QRLabel6: TQRLabel;
    lblData1: TQRLabel;
    QRLabel8: TQRLabel;
    lblData2: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    lblTotal: TQRLabel;
    procedure relCtasPagarBeforePrint(Sender: TQuickRep;
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
  rptDetCtasPagar: TrptDetCtasPagar;
  valor:real;

implementation

uses untDMInloco, untConsultarCtasPagar;

{$R *.DFM}

procedure TrptDetCtasPagar.relCtasPagarBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
valor:=0;
lblData1.Caption:=frmConsultarCtasPagar.edtData1.Text;
lblData2.Caption:=frmConsultarCtasPagar.edtData2.Text;
end;

procedure TrptDetCtasPagar.QRDBText5Print(sender: TObject;
  var Value: String);
begin
valor:=valor+DMInloco.queCtasPagarValor.Value;
end;

procedure TrptDetCtasPagar.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
lblTotal.Caption:=FloatToStrF(valor,ffFixed,6,2);
end;

end.
