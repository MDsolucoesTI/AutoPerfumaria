//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptProdutosEmFalta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptProdutosEmFalta = class(TForm)
    relProdutos: TQuickRep;
    PageHeaderBand1: TQRBand;
    lblTitulo: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    txtPedido: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptProdutosEmFalta: TrptProdutosEmFalta;

implementation

uses untDMInloco;

{$R *.DFM}



procedure TrptProdutosEmFalta.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
if DMInloco.tblProdutosQuant_Atual.Value<=DMInloco.tblProdutosQuant_Min.Value
then
   begin
   PrintBand:=True;
   if DMInloco.tblProdutosPedido.Value=0 then
      txtPedido.Caption:='o'
   else
      txtPedido.Caption:='x';
   end
else
   PrintBand:=False;
end;

end.
