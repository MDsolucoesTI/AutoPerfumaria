//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptMovFinanceira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptMovFinanceira = class(TForm)
    relMovFinanceira: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    txtEspecie: TQRDBText;
    QRDBText3: TQRDBText;
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
    procedure relMovFinanceiraBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure txtEspeciePrint(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptMovFinanceira: TrptMovFinanceira;
  Valor:Real;
  Especie:String;

implementation

uses untDMInloco, untConsultarCaixa;

{$R *.DFM}


procedure TrptMovFinanceira.relMovFinanceiraBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
valor:=0;
lblData1.Caption:=frmConsultarCaixa.edtData1.Text;
lblData2.Caption:=frmConsultarCaixa.edtData2.Text;
end;

procedure TrptMovFinanceira.QRDBText5Print(sender: TObject;
  var Value: String);
begin
if especie='C' then
   Valor:=Valor+DMInloco.tblMovFinanceiraValor.Value
else
   Valor:=Valor-DMInloco.tblMovFinanceiraValor.Value;
end;

procedure TrptMovFinanceira.txtEspeciePrint(sender: TObject;
  var Value: String);
begin
Especie:=value;
end;

procedure TrptMovFinanceira.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
lblTotal.Caption:=FloatToStrF(valor,ffFixed,6,2);
end;

end.
