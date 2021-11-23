//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConsultarCtasReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfrmConsultarCtasReceber = class(TForm)
    dbgCtasReceber: TDBGrid;
    grbConsulta: TGroupBox;
    chkCheque: TCheckBox;
    chkConvenio: TCheckBox;
    chkCartao: TCheckBox;
    chkPromissoria: TCheckBox;
    btnPainel: TPanel;
    btnConsulta: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnDetalhes: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    Label3: TLabel;
    lblValor: TLabel;
    chkVale: TCheckBox;
    PrintDialog: TPrintDialog;
    Bevel1: TBevel;
    lblPeriodo: TLabel;
    edtData1: TMaskEdit;
    lbla: TLabel;
    edtData2: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure dbgCtasReceberCellClick(Column: TColumn);
    procedure dbgCtasReceberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgCtasReceberKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarCtasReceber: TfrmConsultarCtasReceber;
  ctrl: Boolean = False;
  Valor: Real;

implementation

uses untDMInloco, untConsultarVendas, untPrincipal, untRptCtasReceber;


{$R *.DFM}

procedure MostraValor;
begin
if ctrl then
   Valor:=Valor+DMInloco.tblCtaReceberValor_Receber.Value
else
   Valor:=DMInloco.tblCtaReceberValor_Receber.Value;
frmConsultarCtasReceber.lblValor.Caption:=FloatToStrF(Valor,ffFixed,5,2);
end;

procedure TfrmConsultarCtasReceber.FormShow(Sender: TObject);
begin
DMInloco.tblCtaReceber.MasterFields:='';
DMInloco.tblCtaReceber.Filter:='Data_Recebimento=Null and Cod_Forma_Pagto<>1';
DMInloco.tblCtaReceber.Open;
DMInloco.tblCtaReceber.IndexName:='Vencimento';
DMInloco.tblCtaReceber.Filtered:=True;
DMInloco.tblCtaReceber.First;
DMInloco.tblClientes.IndexName:='';
DMInloco.tblClientes.Open;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
MostraValor;
edtData1.SetFocus;
end;

procedure TfrmConsultarCtasReceber.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblCtaReceber.Filtered:=False;
DMInloco.tblCtaReceber.IndexName:='';
DMInloco.tblCtaReceber.MasterFields:='Data_Venda;Cod_Venda';
DMInloco.tblCtaReceber.Close;
DMInloco.tblClientes.Close;
Action:=caFree;
end;

procedure TfrmConsultarCtasReceber.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
MostraValor;
end;

procedure TfrmConsultarCtasReceber.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblCtaReceber.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
MostraValor;
end;

procedure TfrmConsultarCtasReceber.btnProximoClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblCtaReceber.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
MostraValor;
end;

procedure TfrmConsultarCtasReceber.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
MostraValor;
end;

procedure TfrmConsultarCtasReceber.btnConsultaClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Filtered:=False;
DMInloco.tblCtaReceber.Filter:='Data_Recebimento=Null and Cod_Forma_Pagto<>1';
if not chkCheque.Checked then
   DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
   ' and Cod_Forma_Pagto<>2';
if not chkCartao.Checked then
   DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
   ' and Cod_Forma_Pagto<>3';
if not chkConvenio.Checked then
   DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
   ' and Cod_Forma_Pagto<>4';
if not chkPromissoria.Checked then
   DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
   ' and Cod_Forma_Pagto<>5';
if not chkVale.Checked then
   DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
   ' and Cod_Forma_Pagto<>6';
if edtData1.Text='  /  /    ' then
   begin
   if edtData2.Text<>'  /  /    ' then
      DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
      ' and Data_Vencimento<='+#39+edtData2.Text+#39;
   end
else
   begin
   if edtData2.Text='  /  /    ' then
      DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
      ' and Data_Vencimento>='+#39+edtData1.Text+#39
   else
      DMInloco.tblCtaReceber.Filter:=DMInloco.tblCtaReceber.Filter+
      ' and Data_Vencimento>='+#39+edtData1.Text+#39+
      ' and Data_Vencimento<='+#39+edtData2.Text+#39;
   end;
DMInloco.tblCtaReceber.Filtered:=True;
edtData1.SetFocus;
end;

procedure TfrmConsultarCtasReceber.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConsultarCtasReceber.dbgCtasReceberCellClick(
  Column: TColumn);
begin
MostraValor;
end;

procedure TfrmConsultarCtasReceber.dbgCtasReceberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Shift=[ssCtrl] then
   ctrl:=True;
end;

procedure TfrmConsultarCtasReceber.dbgCtasReceberKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
ctrl:=False;
end;

procedure TfrmConsultarCtasReceber.btnDetalhesClick(Sender: TObject);
var
   reg:TBookMark;
begin
reg:=DMInloco.tblCtaReceber.GetBookMark;
Application.CreateForm(TfrmConsultarVendas, frmConsultarVendas);
DMInloco.tblVendas.Open;
DMInloco.tblDetVendas.Open;
DMInloco.tblFuncionarios.Open;
DMInloco.tblVendas.FindKey
([DMInloco.tblCtaReceberData_Venda.Value,DMInloco.tblCtaReceberCod_Venda.Value]);
DMInloco.tblCtaReceber.Filtered:=False;
DMInloco.tblCtaReceber.IndexName:='';
DMInloco.tblCtaReceber.MasterFields:='Data_Venda;Cod_Venda';
if not DMInloco.tblCtaReceberCod_Cliente.IsNull then
   DMInloco.tblClientes.FindKey([DMInloco.tblCtaReceberCod_Cliente.Value]);
frmConsultarVendas.ShowModal;
DMInloco.tblCtaReceber.MasterFields:='';
DMInloco.tblCtaReceber.Filtered:=True;
DMInloco.tblCtaReceber.IndexName:='Vencimento';
DMInloco.tblCtaReceber.GotoBookMark(reg);
DMInloco.tblCtaReceber.FreeBookMark(reg);
DMInloco.tblVendas.Close;
DMInloco.tblDetVendas.Close;
DMInloco.tblFuncionarios.Close;
end;

procedure TfrmConsultarCtasReceber.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptCtasReceber, rptCtasReceber);
   rptCtasReceber.relCtasReceber.PrinterSettings.Copies:=PrintDialog.Copies;
   rptCtasReceber.relCtasReceber.Print;
   end;}
Application.CreateForm(TrptCtasReceber, rptCtasReceber);
rptCtasReceber.relCtasReceber.Preview;
end;


end.
