//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadPagtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfrmCadPagtos = class(TForm)
    dgbCtasPagar: TDBGrid;
    dbgParcelas: TDBGrid;
    Bevel1: TBevel;
    lblDataPagto: TLabel;
    lblValorPago: TLabel;
    edtDataPagto: TDBEdit;
    edtValorPago: TDBEdit;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnSair: TBitBtn;
    btnPagto: TBitBtn;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPagtoClick(Sender: TObject);
    procedure edtValorPagoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPagtos: TfrmCadPagtos;

implementation

uses untDMInloco;

{$R *.DFM}

procedure SomenteLeitura;
begin
frmCadPagtos.lblDataPagto.Visible:=False;
frmCadPagtos.lblValorPago.Visible:=False;
frmCadPagtos.edtDataPagto.Visible:=False;
frmCadPagtos.edtValorPago.Visible:=False;
frmCadPagtos.btnOk.Visible:=False;
frmCadPagtos.btnCancelar.Visible:=False;
frmCadPagtos.btnSair.Visible:=True;
frmCadPagtos.btnPagto.Visible:=True;
frmCadPagtos.dbgParcelas.Enabled:=True;
frmCadPagtos.dbgParcelas.SetFocus;
end;

procedure TfrmCadPagtos.FormShow(Sender: TObject);
begin
DMInloco.tblCtaPagar.Filter:='Quitado=False';
DMInloco.tblCtaPagar.Open;
DMInloco.tblCtaPagar.IndexName:='';
DMInloco.tblCtaPagar.Filtered:=True;
DMInloco.tblDetCtaPagar.Open;
end;

procedure TfrmCadPagtos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblCtaPagar.Close;
DMInloco.tblCtaPagar.Filtered:=False;
DMInloco.tblDetCtaPagar.Close;
Action:=caFree;
end;

procedure TfrmCadPagtos.btnOkClick(Sender: TObject);
var
   quitado:boolean;
   Codigo:Integer;
begin
if length(edtDataPagto.Text)=0 then
   begin
   beep;
   MessageDlg('Data do Pagamento n�o pode estar vazia!',mtError,[mbOK],0);
   edtDataPagto.SetFocus;
   end
else if length(edtValorPago.Text)=0 then
   begin
   beep;
   MessageDlg('Valor Pago n�o pode estar vazio!',mtError,[mbOK],0);
   edtValorPago.SetFocus;
   end
else
   begin
   DMInloco.tblMovFinanceira.Open;
   DMInloco.tblMovFinanceira.Last;
   codigo:=DMInloco.tblMovFinanceiraCod_Operacao.AsInteger;
   DMInloco.tblMovFinanceira.Append;
   DMInloco.tblMovFinanceiraCod_Operacao.Value:=codigo+1;
   DMInloco.tblMovFinanceiraReferencia.Value:=
    DMInloco.tblDetCtaPagarCod_Cta_Pagar.Value;
   DMInloco.tblMovFinanceiraData_Operacao.Value:=
   DMInloco.tblDetCtaPagarData_Pagto.Value;
   DMInloco.tblMovFinanceiraEspecie.Value:='D';
   DMInloco.tblMovFinanceiraHistorico.AsString:=
    DMInloco.tblCtaPagarFornecedor.AsString+' - '+
    DMInloco.tblCtaPagarDescricao.AsString+' - '+
    DMInloco.tblDetCtaPagarNum_Parcela.AsString+'� Parcela';
   DMInloco.tblMovFinanceiraValor.Value:=
    DMInloco.tblDetCtaPagarValor_Pago.Value;
   DMInloco.tblMovFinanceira.Post;
   DMInloco.tblMovFinanceira.Close;
   DMInloco.tblDetCtaPagar.Post;
   DMInloco.tblCtaPagar.Edit;
   DMInloco.tblCtaPagarValor_Pago.Value:=
    DMInloco.tblCtaPagarValor_Pago.Value+
    DMInloco.tblDetCtaPagarValor_Pago.Value;
   DMInloco.tblCtaPagar.Post;
   quitado:=True;
   DMInloco.tblDetCtaPagar.First;
   while not DMInloco.tblDetCtaPagar.EOF do
      begin
      if DMInloco.tblDetCtaPagarData_Pagto.IsNull then
         begin
         quitado:=False;
         break;
         end;
      DMInloco.tblDetCtaPagar.Next;
      end;
   if quitado=True then
      begin
      DMInloco.tblCtaPagar.Edit;
      DMInloco.tblCtaPagarQuitado.Value:=True;
      DMInloco.tblCtaPagar.Post;
      end;
   SomenteLeitura;
   end;
end;

procedure TfrmCadPagtos.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblDetCtaPagar.Cancel;
SomenteLeitura;
end;

procedure TfrmCadPagtos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadPagtos.btnPagtoClick(Sender: TObject);
begin
if not DMInloco.tblDetCtaPagarData_Pagto.IsNull then
   begin
   beep;
   MessageDlg('Essa Parcela j� foi paga!',mtInformation,[mbOK],0);
   dbgParcelas.SetFocus;
   end
else
   begin
   lblDataPagto.Visible:=True;
   lblValorPago.Visible:=True;
   edtDataPagto.Visible:=True;
   edtValorPago.Visible:=True;
   btnOk.Visible:=True;
   btnCancelar.Visible:=True;
   btnSair.Visible:=False;
   btnPagto.Visible:=False;
   DMInloco.tblDetCtaPagar.Edit;
   DMInloco.tblDetCtaPagarData_Pagto.Value:=
    DMInloco.tblDetCtaPagarVencimento.Value;
   DMInloco.tblDetCtaPagarValor_Pago.Value:=
    DMInloco.tblDetCtaPagarValor.Value;
   edtDataPagto.SetFocus;
   end;
end;

procedure TfrmCadPagtos.edtValorPagoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
