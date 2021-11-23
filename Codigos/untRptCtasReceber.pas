//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptCtasReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptCtasReceber = class(TForm)
    relCtasReceber: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    lblTitulo1: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    lblData1: TQRLabel;
    QRLabel8: TQRLabel;
    lblData2: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    lblTotal: TQRLabel;
    lblTitulo: TQRLabel;
    procedure relCtasReceberBeforePrint(Sender: TQuickRep;
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
  rptCtasReceber: TrptCtasReceber;
  valor:Real;

implementation

uses untDMInloco, untConsultarCtasReceber;

{$R *.DFM}

procedure TrptCtasReceber.relCtasReceberBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
valor:=0;
if frmConsultarCtasReceber.chkCheque.Checked then
   lblTitulo.Caption:='Cheques, ';
if frmConsultarCtasReceber.chkCartao.Checked then
   lblTitulo.Caption:=lblTitulo.Caption+'C.Cr�dito, ';
if frmConsultarCtasReceber.chkConvenio.Checked then
   lblTitulo.Caption:=lblTitulo.Caption+'Conv�nios, ';
if frmConsultarCtasReceber.chkPromissoria.Checked then
   lblTitulo.Caption:=lblTitulo.Caption+'Promiss�rias, ';
if frmConsultarCtasReceber.chkVale.Checked then
   lblTitulo.Caption:=lblTitulo.Caption+'Vales, ';
lblTitulo.Caption:=lblTitulo.Caption+'a Receber';
lblData1.Caption:=frmConsultarCtasReceber.edtData1.Text;
lblData2.Caption:=frmConsultarCtasReceber.edtData2.Text;
end;

procedure TrptCtasReceber.QRDBText5Print(sender: TObject;
  var Value: String);
begin
valor:=valor+DMInloco.tblCtaReceberValor.Value;
end;

procedure TrptCtasReceber.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
lblTotal.Caption:=FloatToStrF(valor,ffFixed,6,2);
end;

end.
