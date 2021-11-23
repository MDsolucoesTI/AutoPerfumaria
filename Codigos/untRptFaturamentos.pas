//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptFaturamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptFaturamentos = class(TForm)
    relFaturamentos: TQuickRep;
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
    lblValorLiquido: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    lblDifCaixa: TQRLabel;
    lblDesconto: TQRLabel;
    lblValorBruto: TQRLabel;
    lblVendas: TQRLabel;
    procedure relFaturamentosBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptFaturamentos: TrptFaturamentos;
  Vendas:integer;
  ValorBruto,Desconto,DifCaixa,ValorLiquido:Real;

implementation

uses untDMInloco, untConsultarFaturamentos;

{$R *.DFM}

procedure TrptFaturamentos.relFaturamentosBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
Vendas:= 0;
ValorBruto:= 0;
Desconto:= 0;
DifCaixa:= 0;
ValorLiquido:= 0;
lblData1.Caption:=frmConsultarFaturamentos.edtData1.Text;
lblData2.Caption:=frmConsultarFaturamentos.edtData2.Text;
end;

procedure TrptFaturamentos.QRDBText4Print(sender: TObject;
  var Value: String);
begin
Vendas:=Vendas+DMInloco.tblFaturamentosTotal_Vendas.Value;
end;

procedure TrptFaturamentos.QRDBText6Print(sender: TObject;
  var Value: String);
begin
ValorBruto:=ValorBruto+DMInloco.tblFaturamentosValor_Bruto.Value;
end;

procedure TrptFaturamentos.QRDBText7Print(sender: TObject;
  var Value: String);
begin
Desconto:=Desconto+DMInloco.tblFaturamentosValor_Desconto.Value;
end;

procedure TrptFaturamentos.QRDBText8Print(sender: TObject;
  var Value: String);
begin
DifCaixa:=DifCaixa+DMInloco.tblFaturamentosDiferenca_Caixa.Value;
end;

procedure TrptFaturamentos.QRDBText5Print(sender: TObject;
  var Value: String);
begin
ValorLiquido:=ValorLiquido+DMInloco.tblFaturamentosValor_Liquido.Value;

end;

procedure TrptFaturamentos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
lblVendas.Caption:=IntToStr(Vendas);
lblValorBruto.Caption:=FloatToStrF(ValorBruto,ffFixed,5,2);
lblDesconto.Caption:=FloatToStrF(Desconto,ffFixed,5,2);
lblDifCaixa.Caption:=FloatToStrF(DifCaixa,ffFixed,5,2);
lblValorLiquido.Caption:=FloatToStrF(ValorLiquido,ffFixed,5,2);
end;

end.
