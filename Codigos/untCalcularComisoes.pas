//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCalcularComisoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfrmCalcularComissoes = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    cmbFuncionario: TDBLookupComboBox;
    Label2: TLabel;
    edtData1: TMaskEdit;
    Label3: TLabel;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Panel2: TPanel;
    Label4: TLabel;
    lblVendas: TLabel;
    lblComissao: TLabel;
    Label6: TLabel;
    btnPainel: TPanel;
    btnConsulta: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    Label5: TLabel;
    lblQVendas: TLabel;
    PrintDialog: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbFuncionarioClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcularComissoes: TfrmCalcularComissoes;
  Vendas,Comissao:Real;
  QVendas:Integer;

implementation

uses untDMInloco, untRptComissoes;

{$R *.DFM}

procedure MostraValores;
begin
QVendas:=0;
Vendas:=0;
Comissao:=0;
DMInloco.tblFuncComissoes.First;
While not DMinloco.tblFuncComissoes.EOF do
   begin
   QVendas:=QVendas+DMInloco.tblFuncComissoesQuant_Vendas.Value;
   Vendas:=Vendas+DMInloco.tblFuncComissoesValor_Vendas.Value;
   Comissao:=Comissao+DMInloco.tblFuncComissoesValor_Comissao.Value;
   DMInloco.tblFuncComissoes.Next;
   end;
frmCalcularComissoes.lblQVendas.Caption:=IntToStr(QVendas);
frmCalcularComissoes.lblVendas.Caption:=FloatToStrF(Vendas,ffFixed,5,2);
frmCalcularComissoes.lblComissao.Caption:=FloatToStrF(Comissao,ffFixed,5,2);
end;

procedure TfrmCalcularComissoes.FormShow(Sender: TObject);
var
   mes:string;
begin
mes:=DateToStr(date);
mes:=copy(mes,4,7);
DMInloco.tblFuncionarios.Open;
DMInloco.tblFuncComissoes.Open;
DMInloco.tblFuncionarios.First;
DMInloco.tblFuncComissoes.Filter:='Data_Venda>='+#39+'01/'+mes+#39;
DMInloco.tblFuncComissoes.Filtered:=True;
MostraValores;
DMInloco.tblFuncComissoes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
edtData1.Text:='01/'+mes;
cmbFuncionario.SetFocus;
end;

procedure TfrmCalcularComissoes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblFuncComissoes.Filtered:=False;
DMInloco.tblFuncionarios.Close;
DMInloco.tblFuncComissoes.Close;
Action:=caFree;
end;

procedure TfrmCalcularComissoes.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblFuncComissoes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCalcularComissoes.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblFuncComissoes.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblFuncComissoes.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCalcularComissoes.btnProximoClick(Sender: TObject);
begin
DMInloco.tblFuncComissoes.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblFuncComissoes.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCalcularComissoes.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblFuncComissoes.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCalcularComissoes.cmbFuncionarioClick(Sender: TObject);
begin
MostraValores;
end;

procedure TfrmCalcularComissoes.btnConsultaClick(Sender: TObject);
begin
DMInloco.tblFuncComissoes.Filtered:=False;
if edtData1.Text='  /  /    ' then
   if edtData2.Text='  /  /    ' then
      DMInloco.tblFuncComissoes.Filter:=''
   else
      DMInloco.tblFuncComissoes.Filter:=
      'Data_Venda<='+#39+edtData2.Text+#39
else
   if edtData2.Text='  /  /    ' then
      DMInloco.tblFuncComissoes.Filter:=
      'Data_Venda>='+#39+edtData1.Text+#39
   else
      DMInloco.tblFuncComissoes.Filter:=
      '(Data_Venda>='+#39+edtData1.Text+#39+
      ') and (Data_Venda<='+#39+edtData2.Text+#39+')';
DMInloco.tblFuncComissoes.Filtered:=True;
MostraValores;
DMInloco.tblFuncComissoes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
cmbFuncionario.SetFocus;
end;

procedure TfrmCalcularComissoes.btnSairClick(Sender: TObject);
begin
Close;
end;


procedure TfrmCalcularComissoes.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptComissoes, rptComissoes);
   rptComissoes.relComissoes.PrinterSettings.Copies:=PrintDialog.Copies;
   rptComissoes.relComissoes.Print;
   end;}
   Application.CreateForm(TrptComissoes, rptComissoes);
   rptComissoes.relComissoes.Preview;
end;

end.
