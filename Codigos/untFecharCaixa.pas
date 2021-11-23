//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untFecharCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, Mask;

type
  TfrmFecharCaixa = class(TForm)
    lblOperador: TLabel;
    lblFaturamento: TLabel;
    lblSaldo: TLabel;
    txtSaldo: TLabel;
    lblSaldoReal: TLabel;
    lblDiferenca: TLabel;
    btnOK: TButton;
    btnCancelar: TButton;
    btnMais: TButton;
    dbgMovimentacao: TDBGrid;
    lblMovCaixa: TLabel;
    lblVendas: TLabel;
    Panel1: TPanel;
    lblDinheiro: TLabel;
    lblCheque: TLabel;
    lblCartao: TLabel;
    lblConvenio: TLabel;
    lblPromissoria: TLabel;
    lblVale: TLabel;
    txtDinheiro: TLabel;
    txtCheque: TLabel;
    txtCartao: TLabel;
    txtConvenio: TLabel;
    txtPromissoria: TLabel;
    txtVale: TLabel;
    lblQuantidade: TLabel;
    lblTotal: TLabel;
    txtTotal: TLabel;
    txtQuantDinheiro: TLabel;
    txtQuantCheque: TLabel;
    txtQuantCartao: TLabel;
    txtQuantConvenio: TLabel;
    txtQuantPromissoria: TLabel;
    txtQuantVale: TLabel;
    lblAbertura: TLabel;
    lblRetiradas: TLabel;
    lblEntradas: TLabel;
    lblMovimentacao: TLabel;
    txtMovimentacao: TLabel;
    txtEntradas: TLabel;
    txtRetiradas: TLabel;
    Bevel1: TBevel;
    lblData: TLabel;
    lblHora: TLabel;
    txtOperador: TDBText;
    txtData: TDBText;
    txtHora: TDBText;
    txtFaturamento: TDBText;
    edtSaldo: TEdit;
    edtAbertura: TEdit;
    lblValor: TLabel;
    btnImprimir: TButton;
    PrintDialog: TPrintDialog;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtSaldoExit(Sender: TObject);
    procedure edtAberturaExit(Sender: TObject);
    procedure btnMaisClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtAberturaKeyPress(Sender: TObject; var Key: Char);
    procedure edtSaldoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecharCaixa: TfrmFecharCaixa;
  Debitos,Creditos:real;

implementation

uses untDMInloco, untPrincipal, untRptFecharCaixa;

{$R *.DFM}

procedure TfrmFecharCaixa.FormShow(Sender: TObject);
var
   x:integer;
   FormaPagto:array[1..6] of real;
   Quant:array[1..6] of integer;
begin
frmFecharCaixa.Width:=227;
DMInloco.tblFuncionarios.Open;
DMInloco.tblMovCaixa.Open;
DMInloco.tblDetMovCaixa.Open;
DMInloco.tblCtaReceber.Open;
DMInloco.tblCtaReceber.MasterFields:='';
DMInloco.tblCtaReceber.MasterSource:=DMinloco.dscFaturamentos;
DMInloco.tblCtaReceber.MasterFields:='Data';
DMInloco.tblFaturamentos.Edit;
DMInloco.tblFaturamentosCod_Operador.Value:=Operador;
DMInloco.tblFaturamentosHorario.Value:=time;
DMInloco.tblFaturamentos.Post;
DMInloco.tblMovCaixa.Filter:='Data_Mov='+#39+
DMInloco.tblFaturamentosData.AsString+#39;
DMInloco.tblMovCaixa.Filtered:=True;
DMInloco.tblMovCaixa.First;
Debitos:=0;
Creditos:=0;
while not DMInloco.tblMovCaixa.EOF do
   begin
   if DMInloco.tblMovCaixaEspecie_Mov.Value='D' then
      Debitos:=Debitos+DMInloco.tblMovCaixaValor_Total.Value
   else
      Creditos:=Creditos+DMInloco.tblMovCaixaValor_Total.Value;
   DMInloco.tblMovCaixa.Next;
   end;
txtRetiradas.Caption:=FloattoStrF(Debitos,ffFixed,5,2);
txtEntradas.Caption:=FloatToStrF(Creditos,ffFixed,5,2);
txtMovimentacao.Caption:=FloatToStrF(Creditos-Debitos,ffFixed,5,2);
For x:=1 to 6 do
   begin
   FormaPagto[x]:=0;
   Quant[x]:=0;
   end;
DMInloco.tblCtaReceber.First;
While not DMInloco.tblCtaReceber.EOF do
   begin
   FormaPagto[DMInloco.tblCtaReceberCod_Forma_Pagto.Value]:=
   FormaPagto[DMInloco.tblCtaReceberCod_Forma_Pagto.Value]+
   DMInloco.tblCtaReceberValor.Value;
   Quant[DMInloco.tblCtaReceberCod_Forma_Pagto.Value]:=
   Quant[DMInloco.tblCtaReceberCod_Forma_Pagto.Value]+1;
   DMInloco.tblCtaReceber.Next;
   end;
txtDinheiro.Caption:=FloatToStrF(FormaPagto[1],ffFixed,5,2);
txtCheque.Caption:=FloatToStrF(FormaPagto[2],ffFixed,5,2);
txtCartao.Caption:=FloatToStrF(FormaPagto[3],ffFixed,5,2);
txtConvenio.Caption:=FloatToStrF(FormaPagto[4],ffFixed,5,2);
txtPromissoria.Caption:=FloatToStrF(FormaPagto[5],ffFixed,5,2);
txtVale.Caption:=FloatToStrF(FormaPagto[6],ffFixed,5,2);
txtTotal.Caption:=FloatToStrF(FormaPagto[1]+FormaPagto[2]+FormaPagto[3]+
                        FormaPagto[4]+FormaPagto[5]+FormaPagto[6],ffFixed,5,2);
txtQuantDinheiro.Caption:=IntToStr(Quant[1]);
txtQuantCheque.Caption:=IntToStr(Quant[2]);
txtQuantCartao.Caption:=IntToStr(Quant[3]);
txtQuantConvenio.Caption:=IntToStr(Quant[4]);
txtQuantPromissoria.Caption:=IntToStr(Quant[5]);
txtQuantVale.Caption:=IntToStr(Quant[6]);
edtAbertura.SetFocus;
end;

procedure TfrmFecharCaixa.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblCtaReceber.MasterFields:='';
DMInloco.tblCtaReceber.MasterSource:=DMInloco.dscVendas;
DMInloco.tblCtaReceber.MasterFields:='Data_Venda;Cod_Venda';
DMInloco.tblMovCaixa.Filtered:=False;
DMInloco.tblMovCaixa.Close;
DMInloco.tblCtaReceber.Close;
DMInloco.tblDetMovCaixa.Close;
DMInloco.tblFaturamentos.Close;
DMInloco.tblFuncionarios.Close;
Action:=caFree;
end;

procedure TfrmFecharCaixa.edtAberturaExit(Sender: TObject);
begin
if length(edtAbertura.Text)<>0 then
   begin
   txtSaldo.Caption:=
   FloatToStrF(StrToFloat(edtAbertura.Text)+Creditos-Debitos+
   DMInloco.tblFaturamentosValor_Bruto.Value,ffFixed,5,2);
   edtSaldo.Enabled:=True;
   edtSaldo.SetFocus;
   end
end;

procedure TfrmFecharCaixa.edtSaldoExit(Sender: TObject);
begin
if length(edtSaldo.Text)<>0 then
   begin
   DMInloco.tblFaturamentos.Edit;
   DMInloco.tblFaturamentosDiferenca_Caixa.Value:=
   StrToFloat(edtSaldo.Text)-StrToFloat(txtSaldo.Caption);
   DMInloco.tblFaturamentos.Post;
   end;
end;

procedure TfrmFecharCaixa.btnMaisClick(Sender: TObject);
begin
if btnMais.Caption='>>' then
   begin
   frmFecharCaixa.Left:=round((Screen.Width-570)/2);
   frmFecharCaixa.Width:=570;
   btnMais.Caption:='<<';
   end
else
   begin
   frmFecharCaixa.Left:=round((Screen.Width-227)/2);
   frmFecharCaixa.Width:=227;
   btnMais.Caption:='>>';
   end;
end;

procedure TfrmFecharCaixa.btnOKClick(Sender: TObject);
begin
if length(edtAbertura.Text)=0 then
   begin
   beep;
   MessageDlg('Valor de Abertura do Caixa n�o pode estar vazio!',mtError,[mbOK],0);
   edtAbertura.SetFocus;
   end
else if length(edtSaldo.Text)=0 then
   begin
   beep;
   MessageDlg('Saldo do Caixa n�o pode estar vazio!',mtError,[mbOK],0);
   edtSaldo.SetFocus;
   end
else
   Close;
end;

procedure TfrmFecharCaixa.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblFaturamentos.Edit;
DMInloco.tblFaturamentosCod_Operador.Clear;
DMInloco.tblFaturamentosHorario.Clear;
DMInloco.tblFaturamentosDiferenca_Caixa.Clear;
DMInloco.tblFaturamentos.Post;
Close;
end;

procedure TfrmFecharCaixa.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptFecharCaixa, rptFecharCaixa);
   rptComissoes.relComissoes.PrinterSettings.Copies:=PrintDialog.Copies;
   rptFecharCaixa.relCaixa.Print;
   end;}
Application.CreateForm(TrptFecharCaixa, rptFecharCaixa);
rptFecharCaixa.relCaixa.Preview;
end;




procedure TfrmFecharCaixa.edtAberturaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmFecharCaixa.edtSaldoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
