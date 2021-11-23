//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptFecharCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptFecharCaixa = class(TForm)
    relCaixa: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
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
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    lblDinheiro: TQRLabel;
    lblCheque: TQRLabel;
    lblCartao: TQRLabel;
    lblConvenio: TQRLabel;
    lblPromissoria: TQRLabel;
    lblVale: TQRLabel;
    lblTotal: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lblQDinheiro: TQRLabel;
    lblQCheque: TQRLabel;
    lblQCartao: TQRLabel;
    lblQConvenio: TQRLabel;
    lblQPromissoria: TQRLabel;
    lblQVale: TQRLabel;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lblVlrAbertura: TQRLabel;
    lblRetiradas: TQRLabel;
    lblEntradas: TQRLabel;
    lblMov: TQRLabel;
    lblSaldoCalc: TQRLabel;
    lblSaldoReal: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure relCaixaBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptFecharCaixa: TrptFecharCaixa;

implementation

uses untDMInloco, untFecharCaixa;

{$R *.DFM}


procedure TrptFecharCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TrptFecharCaixa.relCaixaBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
lblDinheiro.Caption:=frmFecharCaixa.txtDinheiro.Caption;
lblCheque.Caption:=frmFecharCaixa.txtCheque.Caption;
lblCartao.Caption:=frmFecharCaixa.txtCartao.Caption;
lblConvenio.Caption:=frmFecharCaixa.txtConvenio.Caption;
lblPromissoria.Caption:=frmFecharCaixa.txtPromissoria.Caption;
lblVale.Caption:=frmFecharCaixa.txtVale.Caption;
lblTotal.Caption:=frmFecharCaixa.txtTotal.Caption;
lblQDinheiro.Caption:=frmFecharCaixa.txtQuantDinheiro.Caption;
lblQCheque.Caption:=frmFecharCaixa.txtQuantCheque.Caption;
lblQCartao.Caption:=frmFecharCaixa.txtQuantCartao.Caption;
lblQConvenio.Caption:=frmFecharCaixa.txtQuantConvenio.Caption;
lblQPromissoria.Caption:=frmFecharCaixa.txtQuantPromissoria.Caption;
lblQVale.Caption:=frmFecharCaixa.txtQuantVale.Caption;
lblVlrAbertura.Caption:=frmFecharCaixa.edtAbertura.Text;
lblRetiradas.Caption:=frmFecharCaixa.txtRetiradas.Caption;
lblEntradas.Caption:=frmFecharCaixa.txtEntradas.Caption;
lblMov.Caption:=frmFecharCaixa.txtMovimentacao.Caption;
lblSaldoCalc.Caption:=frmFecharCaixa.txtSaldo.Caption;
lblSaldoReal.Caption:=frmFecharCaixa.edtSaldo.Text;
end;

end.
