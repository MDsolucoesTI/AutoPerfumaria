//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRptHorarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TrptHorarios = class(TForm)
    relHorarios: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
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
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    lblHNormais: TQRLabel;
    lblHENormais: TQRLabel;
    lblHEExcedentes: TQRLabel;
    lblHTrab: TQRLabel;
    lblVlrHENormais: TQRLabel;
    lblVlrHEExcedentes: TQRLabel;
    lblVlrHTrab: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape1: TQRShape;
    QRDBText12: TQRDBText;
    procedure relHorariosBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptHorarios: TrptHorarios;

implementation

uses untDMInloco, untConsultarHorarios;

{$R *.DFM}











procedure TrptHorarios.relHorariosBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
lblData1.Caption:=frmConsultarHorarios.edtData1.Text;
lblData2.Caption:=frmConsultarHorarios.edtData2.Text;
lblHNormais.Caption:=HNormais;
lblHENormais.Caption:=HENormais;
lblHEExcedentes.Caption:=HEExcedentes;
lblHTrab.Caption:=HTrab;
lblVlrHENormais.Caption:=VlrHENormais;
lblVlrHEExcedentes.Caption:=VlrHEExcedentes;
lblVlrHTrab.Caption:=VlrHTrab;
end;

procedure TrptHorarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
