//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConsultarCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmConsultarCaixa = class(TForm)
    lblPeriodo: TLabel;
    lbla: TLabel;
    dbgMovFinanceira: TDBGrid;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnDetalhes: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    btnConsulta: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    lblValor: TLabel;
    GroupBox1: TGroupBox;
    chkCreditos: TCheckBox;
    chkDebitos: TCheckBox;
    PrintDialog: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure dbgMovFinanceiraCellClick(Column: TColumn);
    procedure dbgMovFinanceiraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgMovFinanceiraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarCaixa: TfrmConsultarCaixa;
  ConsMovFinanceira: Boolean;
  ctrl: Boolean = False;
  Valor: Real;

implementation

uses untDMInloco, untCadCtasPagar, untConsultarVendas, untCadEntradas,
  untCadSaidas, untRptMovFinanceira;

{$R *.DFM}

procedure MostraValor;
begin
if ctrl then
   if DMInloco.tblMovFinanceiraEspecie.Value='C' then
      Valor:=Valor+DMInloco.tblMovFinanceiraValor.Value
   else
      Valor:=Valor-DMInloco.tblMovFinanceiraValor.Value
else
   if DMInloco.tblMovFinanceiraEspecie.Value='C' then
      Valor:=DMInloco.tblMovFinanceiraValor.Value
   else
      Valor:=0-DMInloco.tblMovFinanceiraValor.Value;
if Valor<0 then
   frmConsultarCaixa.lblValor.Font.Color:=clRed
else
   frmConsultarCaixa.lblValor.Font.Color:=clWindowText;
frmConsultarCaixa.lblValor.Caption:=FloatToStrF(Valor,ffFixed,5,2);
end;

procedure TfrmConsultarCaixa.FormShow(Sender: TObject);
var
   mes:string;
begin
mes:=DateToStr(date);
mes:=copy(mes,4,7);
DMInloco.tblMovFinanceira.Open;
DMInloco.tblMovFinanceira.IndexName:='Data_Movimentacao';
DMInloco.tblMovFinanceira.Filter:='Data_Operacao>='+#39+'01/'+mes+#39;
DMInloco.tblMovFinanceira.Filtered:=True;
DMInloco.tblMovFinanceira.First;
ConsMovFinanceira:=True;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.Text:='01/'+mes;
edtData1.SetFocus;
end;

procedure TfrmConsultarCaixa.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblMovFinanceira.IndexName:='';
DMInloco.tblMovFinanceira.Filtered:=False;
DMInloco.tblMovFinanceira.Close;
ConsMovFinanceira:=False;
Action:=caFree;
end;

procedure TfrmConsultarCaixa.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblMovFinanceira.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
MostraValor;
end;

procedure TfrmConsultarCaixa.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblMovFinanceira.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblMovFinanceira.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
MostraValor;
end;

procedure TfrmConsultarCaixa.btnProximoClick(Sender: TObject);
begin
DMInloco.tblMovFinanceira.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblMovFinanceira.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
MostraValor;
end;

procedure TfrmConsultarCaixa.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblMovFinanceira.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
MostraValor;
end;

procedure TfrmConsultarCaixa.btnConsultaClick(Sender: TObject);
begin
DMInloco.tblMovFinanceira.Filtered:=False;
if edtData1.Text='  /  /    ' then
   if edtData2.Text='  /  /    ' then
      DMInloco.tblMovFinanceira.Filter:=''
   else
      DMInloco.tblMovFinanceira.Filter:=
      'Data_Operacao<='+#39+edtData2.Text+#39
else
   if edtData2.Text='  /  /    ' then
      DMInloco.tblMovFinanceira.Filter:=
      'Data_Operacao>='+#39+edtData1.Text+#39
   else
      DMInloco.tblMovFinanceira.Filter:=
      '(Data_Operacao>='+#39+edtData1.Text+#39+
      ') and (Data_Operacao<='+#39+edtData2.Text+#39+')';
if not chkCreditos.Checked then
   if DMInloco.tblMovFinanceira.Filter='' then
      DMInloco.tblMovFinanceira.Filter:='Especie<>'+#39+'C'+#39
   else
      DMInloco.tblMovFinanceira.Filter:=
      DMInloco.tblMovFinanceira.Filter+' and Especie<>'+#39+'C'+#39;
if not chkDebitos.Checked then
   if DMInloco.tblMovFinanceira.Filter='' then
      DMInloco.tblMovFinanceira.Filter:='Especie<>'+#39+'D'+#39
   else
      DMInloco.tblMovFinanceira.Filter:=
      DMInloco.tblMovFinanceira.Filter+' and Especie<>'+#39+'D'+#39;
DMInloco.tblMovFinanceira.Filtered:=True;
DMInloco.tblMovFinanceira.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.SetFocus;
end;

procedure TfrmConsultarCaixa.btnDetalhesClick(Sender: TObject);
begin
if DMInloco.tblMovFinanceiraEspecie.Value='D' then
   begin
   if DMInloco.tblMovFinanceiraData_Referencia.IsNull then
      begin
      Application.CreateForm(TfrmCadCtasPagar, frmCadCtasPagar);
      frmCadCtasPagar.ShowModal;
      end
   else
      begin
      Application.CreateForm(TfrmCadEntradas, frmCadEntradas);
      frmCadEntradas.ShowModal;
      end;
   end
else
   begin
   if DMInloco.tblMovFinanceiraData_Referencia.IsNull then
      begin
      Application.CreateForm(TfrmCadSaidas, frmCadSaidas);
      frmCadSaidas.ShowModal;
      end
   else
      begin
      Application.CreateForm(TfrmConsultarVendas, frmConsultarVendas);
      DMInloco.tblVendas.IndexName:='';
      DMInloco.tblCtaReceber.IndexName:='';
      DMInloco.tblVendas.Open;
      DMInloco.tblDetVendas.Open;
      DMInloco.tblCtaReceber.Open;
      DMInloco.tblFuncionarios.Open;
      DMInloco.tblVendas.FindKey
      ([DMInloco.tblMovFinanceiraData_Referencia.Value,
      DMInloco.tblMovFinanceiraReferencia.Value]);
      if not DMInloco.tblCtaReceberCod_Cliente.IsNull then
         begin
         DMInloco.tblClientes.Open;
         DMInloco.tblClientes.FindKey([DMInloco.tblCtaReceberCod_Cliente.Value]);
      end;
      frmConsultarVendas.ShowModal;
      DMInloco.tblVendas.Close;
      DMInloco.tblDetVendas.Close;
      DMInloco.tblCtaReceber.Close;
      DMInloco.tblFuncionarios.Close;
      DMInloco.tblClientes.Close;
      end;
   end;
end;

procedure TfrmConsultarCaixa.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConsultarCaixa.dbgMovFinanceiraCellClick(Column: TColumn);
begin
MostraValor;
end;

procedure TfrmConsultarCaixa.dbgMovFinanceiraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Shift=[ssCtrl] then
   ctrl:=True;
end;

procedure TfrmConsultarCaixa.dbgMovFinanceiraKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
ctrl:=False;
end;

procedure TfrmConsultarCaixa.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptMovFinanceira, rptMovFinanceira);
   rptMovFinanceira.relMovFinanceira.PrinterSettings.Copies:=PrintDialog.Copies;
   rptMovFinanceira.relMovFinanceira.Print;
   end;}
Application.CreateForm(TrptMovFinanceira, rptMovFinanceira);
rptMovFinanceira.relMovFinanceira.Preview;
end;

end.
