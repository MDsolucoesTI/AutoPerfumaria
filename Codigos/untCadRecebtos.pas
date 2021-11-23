//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadRecebtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TfrmCadRecebtos = class(TForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    dbgCtasReceber: TDBGrid;
    GroupBox2: TGroupBox;
    dbgCheque: TDBGrid;
    GroupBox3: TGroupBox;
    dbgCartao: TDBGrid;
    GroupBox4: TGroupBox;
    dbgConvenio: TDBGrid;
    GroupBox5: TGroupBox;
    dbgPromissoria: TDBGrid;
    btnSair: TBitBtn;
    pnlRecebto: TPanel;
    lblValor: TLabel;
    lblDataRecebimento: TLabel;
    edtDataRecebimento: TDBEdit;
    edtValor: TDBEdit;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    btnRecebto: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnRecebtoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRecebtos: TfrmCadRecebtos;

implementation

uses untDMInloco;

{$R *.DFM}

procedure SomenteLeitura;
begin
frmCadRecebtos.pnlRecebto.Visible:=False;
frmCadRecebtos.btnSair.Enabled:=True;
frmCadRecebtos.btnRecebto.Enabled:=True;
frmCadRecebtos.dbgCtasReceber.Enabled:=True;
frmCadRecebtos.dbgCtasReceber.SetFocus;
end;

procedure TfrmCadRecebtos.FormShow(Sender: TObject);
begin
DMInloco.tblCtaReceber.MasterFields:='';
DMInloco.tblCtaReceber.Filter:='Data_Recebimento=Null and Cod_Forma_Pagto<>1';
DMInloco.tblCtaReceber.Open;
DMInloco.tblCtaReceber.Filtered:=True;
DMInloco.tblCtaReceber.IndexName:='Vencimento';
DMInloco.tblCtaReceber.First;
SomenteLeitura;
end;

procedure TfrmCadRecebtos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblCtaReceber.Filtered:=False;
DMInloco.tblCtaReceber.MasterFields:='Data_Venda;Cod_Venda';
DMInloco.tblCtaReceber.IndexName:='';
DMInloco.tblCtaReceber.Close;
Action:=caFree;
end;

procedure TfrmCadRecebtos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadRecebtos.btnOkClick(Sender: TObject);
var
   Numero:string;
   Codigo:Integer;
begin
if length(edtDataRecebimento.Text)=0 then
   begin
   beep;
   MessageDlg('Data do Recebimento n�o pode estar vazia!',mtError,[mbOK],0);
   edtDataRecebimento.SetFocus;
   end
else if length(edtValor.Text)=0 then
   begin
   beep;
   MessageDlg('Valor Recebido n�o pode estar vazio!',mtError,[mbOK],0);
   edtValor.SetFocus;
   end
else
   begin
   Case DMInloco.tblCtaReceberCod_Forma_Pagto.Value of
      2: Numero:=' N� '+DMInloco.tblCtaReceberNum_Cheque.AsString;
      3: Numero:=' N� '+DMInloco.tblCtaReceberNum_Cartao.AsString;
      4: Numero:=' '+DMInloco.tblCtaReceberConvenio.AsString;
      5: Numero:=' N� '+DMInloco.tblCtaReceberNum_Promissoria.AsString;
      6: Numero:='';
      end;
   DMInloco.tblMovFinanceira.Open;
   DMInloco.tblMovFinanceira.Last;
   codigo:=DMInloco.tblMovFinanceiraCod_Operacao.AsInteger;
   DMInloco.tblMovFinanceira.Append;
   DMInloco.tblMovFinanceiraCod_Operacao.Value:=codigo+1;
   DMInloco.tblMovFinanceiraData_Operacao.Value:=Date;
   DMInloco.tblMovFinanceiraEspecie.Value:='C';
   DMInloco.tblMovFinanceiraData_Referencia.Value:=
   DMInloco.tblCtaReceberData_Venda.Value;
   DMInloco.tblMovFinanceiraReferencia.Value:=
   DMInloco.tblCtaReceberCod_Venda.Value;
   DMInloco.tblMovFinanceiraHistorico.AsString:=
   DMInloco.tblCtaReceberFormaPagto.AsString+numero+' - '+
   DMInloco.tblCtaReceberCliente.AsString;
   DMInloco.tblMovFinanceiraValor.Value:=
   DMInloco.tblCtaReceberValor_Recebido.Value;
   DMInloco.tblMovFinanceira.Post;
   DMInloco.tblMovFinanceira.Close;
   DMInloco.tblCtaReceber.Post;
   SomenteLeitura;
   end;
end;

procedure TfrmCadRecebtos.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblCtaReceber.Cancel;
SomenteLeitura;
end;


procedure TfrmCadRecebtos.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadRecebtos.btnRecebtoClick(Sender: TObject);
begin
pnlRecebto.Visible:=True;
btnSair.Enabled:=False;
btnRecebto.Enabled:=False;
dbgCtasReceber.Enabled:=False;
DMInloco.tblCtaReceber.Edit;
DMInloco.tblCtaReceberData_Recebimento.Value:=Date;
DMInloco.tblCtaReceberValor_Recebido.Value:=
DMInloco.tblCtaReceberValor_Receber.Value;
edtDataRecebimento.SetFocus;
end;

end.
