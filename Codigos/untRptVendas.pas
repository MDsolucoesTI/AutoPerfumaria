//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptVendas = class(TForm)
    relVendas: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    lblTitulo: TQRLabel;
    QRSysData2: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    lblQuant: TQRLabel;
    lblSubTotal: TQRLabel;
    lblData: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure relVendasBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptVendas: TrptVendas;

implementation

uses untDMInloco, untRelVendas;

{$R *.DFM}


procedure TrptVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TrptVendas.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   Quant:integer;
   SubTotal:Real;
begin
quant:=0;
SubTotal:=0;
if DMInloco.tblDetVendas.IsEmpty then
   PrintBand:=False
else
   begin
   DMInloco.tblDetVendas.First;
   While not DMInloco.tblDetVendas.EOF do
      begin
      quant:=quant+DMInloco.tblDetVendasQuant_Vendida.Value;
      SubTotal:=SubTotal+DMInloco.tblDetVendasValor_Total.Value;
      DMInloco.tblDetVendas.Next;
      end;
   lblQuant.Caption:=IntToStr(Quant);
   lblSubTotal.Caption:=FloatToStrF(SubTotal,ffFixed,6,2)
   end;
end;

procedure TrptVendas.relVendasBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
lblData.Caption:=frmRelVendas.edtData.Text;
end;

end.
