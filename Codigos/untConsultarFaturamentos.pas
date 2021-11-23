//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConsultarFaturamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TfrmConsultarFaturamentos = class(TForm)
    dbgFaturamentos: TDBGrid;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    PrintDialog: TPrintDialog;
    Bevel1: TBevel;
    Label3: TLabel;
    lblValor: TLabel;
    btnConsulta: TSpeedButton;
    lblPeriodo: TLabel;
    edtData1: TMaskEdit;
    lbla: TLabel;
    edtData2: TMaskEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbgFaturamentosCellClick(Column: TColumn);
    procedure dbgFaturamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFaturamentosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarFaturamentos: TfrmConsultarFaturamentos;
  ctrl: Boolean = False;
  Valor: Real;

implementation

uses untDMInloco, untRptFaturamentos;

{$R *.DFM}

procedure MostraValor;
begin
if ctrl then
   Valor:=Valor+DMInloco.tblFaturamentosValor_Liquido.Value
else
   Valor:=DMInloco.tblFaturamentosValor_Liquido.Value;
frmConsultarFaturamentos.lblValor.Caption:=FloatToStrF(Valor,ffFixed,5,2);
end;

procedure TfrmConsultarFaturamentos.FormShow(Sender: TObject);
begin
DMInloco.tblFuncionarios.Open;
DMInloco.tblFaturamentos.Open;
DMInloco.tblFaturamentos.IndexName:='';
DMInloco.tblFaturamentos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.SetFocus;
end;

procedure TfrmConsultarFaturamentos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblFaturamentos.Filtered:=False;
DMInloco.tblFaturamentos.Close;
DMInloco.tblFuncionarios.Close;
Action:=caFree;
end;

procedure TfrmConsultarFaturamentos.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmConsultarFaturamentos.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblFaturamentos.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmConsultarFaturamentos.btnProximoClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblFaturamentos.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmConsultarFaturamentos.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmConsultarFaturamentos.btnConsultaClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.Filtered:=False;
if edtData1.Text='  /  /    ' then
   if edtData2.Text='  /  /    ' then
      DMInloco.tblFaturamentos.Filter:=''
   else
      DMInloco.tblFaturamentos.Filter:=
      'Data<='+#39+edtData2.Text+#39
else
   if edtData2.Text='  /  /    ' then
      DMInloco.tblFaturamentos.Filter:=
      'Data>='+#39+edtData1.Text+#39
   else
      DMInloco.tblFaturamentos.Filter:=
      '(Data>='+#39+edtData1.Text+#39+
      ') and (Data<='+#39+edtData2.Text+#39+')';
DMInloco.tblFaturamentos.Filtered:=True;
DMInloco.tblFaturamentos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.SetFocus;
end;

procedure TfrmConsultarFaturamentos.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptFaturamentos, rptFaturamentos);
   rptFaturamentos.relFaturamentos.PrinterSettings.Copies:=PrintDialog.Copies;
   rptFaturamentos.relFaturamentos.Print;
   end;}
   Application.CreateForm(TrptFaturamentos, rptFaturamentos);
   rptFaturamentos.relFaturamentos.Preview;
end;

procedure TfrmConsultarFaturamentos.dbgFaturamentosCellClick(Column: TColumn);
begin
MostraValor;
end;

procedure TfrmConsultarFaturamentos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConsultarFaturamentos.dbgFaturamentosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Shift=[ssCtrl] then
   ctrl:=True;
end;

procedure TfrmConsultarFaturamentos.dbgFaturamentosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
ctrl:=False;
end;


end.
