//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptComissoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptComissoes = class(TForm)
    relComissoes: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    lblQVendas: TQRLabel;
    lblVendas: TQRLabel;
    lblComissao: TQRLabel;
    QRDBText12: TQRDBText;
    procedure relComissoesBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptComissoes: TrptComissoes;

implementation

uses untDMInloco, untCalcularComisoes;

{$R *.DFM}


procedure TrptComissoes.relComissoesBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
lblData1.Caption:=frmCalcularComissoes.edtData1.Text;
lblData2.Caption:=frmCalcularComissoes.edtData2.Text;
lblQVendas.Caption:=IntToStr(QVendas);
lblVendas.Caption:=FloatToStrf(Vendas,ffFixed,5,2);
lblComissao.Caption:=FloatToStrf(Comissao,ffFixed,5,2);
end;

end.
