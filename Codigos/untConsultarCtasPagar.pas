//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConsultarCtasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TfrmConsultarCtasPagar = class(TForm)
    dbgCtasPagar: TDBGrid;
    btnPainel: TPanel;
    btnConsulta: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    Label3: TLabel;
    lblValor: TLabel;
    PrintDialog: TPrintDialog;
    lblPeriodo: TLabel;
    edtData1: TMaskEdit;
    lbla: TLabel;
    edtData2: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbgCtasPagarCellClick(Column: TColumn);
    procedure dbgCtasPagarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgCtasPagarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarCtasPagar: TfrmConsultarCtasPagar;
  ctrl: Boolean = False;
  Valor: Real;

implementation

uses untDMInloco, untRptDetCtasPagar;

{$R *.DFM}

procedure MostraValor;
begin
if ctrl then
   Valor:=Valor+DMInloco.queCtasPagarValor.Value
else
   Valor:=DMInloco.queCtasPagarValor.Value;
frmConsultarCtasPagar.lblValor.Caption:=FloatToStrF(Valor,ffFixed,5,2);
end;

procedure TfrmConsultarCtasPagar.FormShow(Sender: TObject);
begin
DMInloco.queCtasPagar.Open;
DMInloco.queCtasPagar.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.SetFocus;
end;

procedure TfrmConsultarCtasPagar.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.queCtasPagar.Filtered:=False;
DMInloco.queCtasPagar.Close;
Action:=caFree;
end;

procedure TfrmConsultarCtasPagar.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.queCtasPagar.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
MostraValor;
end;

procedure TfrmConsultarCtasPagar.btnAnteriorClick(Sender: TObject);
begin
DMInloco.queCtasPagar.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.queCtasPagar.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
MostraValor;
end;

procedure TfrmConsultarCtasPagar.btnProximoClick(Sender: TObject);
begin
DMInloco.queCtasPagar.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.queCtasPagar.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
MostraValor;
end;

procedure TfrmConsultarCtasPagar.btnUltimoClick(Sender: TObject);
begin
DMInloco.queCtasPagar.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
MostraValor;
end;

procedure TfrmConsultarCtasPagar.btnConsultaClick(Sender: TObject);
begin
DMInloco.queCtasPagar.Filtered:=False;
if edtData1.Text='  /  /    ' then
   if edtData2.Text='  /  /    ' then
      DMInloco.queCtasPagar.Filter:=''
   else
      DMInloco.queCtasPagar.Filter:=
      'Vencimento<='+#39+edtData2.Text+#39
else
   if edtData2.Text='  /  /    ' then
      DMInloco.queCtasPagar.Filter:=
      'Vencimento>='+#39+edtData1.Text+#39
   else
      DMInloco.queCtasPagar.Filter:=
      '(Vencimento>='+#39+edtData1.Text+#39+
      ') and (Vencimento<='+#39+edtData2.Text+#39+')';
DMInloco.queCtasPagar.Filtered:=True;
DMInloco.queCtasPagar.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.SetFocus;
end;

procedure TfrmConsultarCtasPagar.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConsultarCtasPagar.dbgCtasPagarCellClick(Column: TColumn);
begin
MostraValor;
end;

procedure TfrmConsultarCtasPagar.dbgCtasPagarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Shift=[ssCtrl] then
   ctrl:=True;
end;

procedure TfrmConsultarCtasPagar.dbgCtasPagarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
ctrl:=False;
end;

procedure TfrmConsultarCtasPagar.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptDetCtasPagar, rptDetCtasPagar);
   rptDetCtasPagar.relCtasPagar.PrinterSettings.Copies:=PrintDialog.Copies;
   rptDetCtasPagar.relCtasPagar.Print;
   end;}
   Application.CreateForm(TrptDetCtasPagar, rptDetCtasPagar);
   rptDetCtasPagar.relCtasPagar.Preview;
end;


end.
