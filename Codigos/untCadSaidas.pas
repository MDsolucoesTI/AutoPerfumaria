//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadSaidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons;

type
  TfrmCadSaidas = class(TForm)
    Bevel1: TBevel;
    lblProduto: TLabel;
    lblMotivo: TLabel;
    lblQuantidade: TLabel;
    lblData: TLabel;
    btnLocalizar: TSpeedButton;
    cmbMotivo: TDBLookupComboBox;
    edtQuantidade: TDBEdit;
    edtDataSaida: TDBEdit;
    btnPainel: TPanel;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    edtCodProduto: TDBEdit;
    txtProduto: TLabel;
    Label1: TLabel;
    edtValorUnitario: TDBEdit;
    Label2: TLabel;
    edtValorTotal: TDBEdit;
    btnVoltar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSaidas: TfrmCadSaidas;
  OutrasSaidas:Boolean;

implementation

uses untDMInloco, untLocProdutos, untConsultarCaixa;

{$R *.DFM}

procedure Escrita;
begin
frmCadSaidas.btnIncluir.Enabled:=False;
frmCadSaidas.btnConfirmar.Enabled:=True;
frmCadSaidas.btnCancelar.Enabled:=True;
frmCadSaidas.btnSair.Enabled:=False;
frmCadSaidas.btnLocalizar.Enabled:=True;
end;

procedure SomenteLeitura;
begin
frmCadSaidas.btnIncluir.Enabled:=True;
frmCadSaidas.btnConfirmar.Enabled:=False;
frmCadSaidas.btnCancelar.Enabled:=False;
frmCadSaidas.btnSair.Enabled:=True;
frmCadSaidas.btnLocalizar.Enabled:=False;
frmCadSaidas.txtProduto.Caption:='';
DMInloco.tblOutrasSaidas.Close;
end;

procedure TfrmCadSaidas.FormShow(Sender: TObject);
begin
DMInloco.tblMotivosSaida.IndexName:='Motivo_Saida';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblMotivosSaida.Open;
DMInloco.tblProdutos.Open;
if ConsMovFinanceira then
   begin
   btnIncluir.Visible:=False;
   btnConfirmar.Visible:=False;
   btnCancelar.Visible:=False;
   btnSair.Visible:=False;
   btnLocalizar.Visible:=False;
   btnVoltar.Visible:=True;
   DMInloco.tblOutrasSaidas.Open;
   DMInloco.tblOutrasSaidas.FindKey
   ([DMInloco.tblMovFinanceiraReferencia.Value]);
   txtProduto.Caption:=DMInloco.tblOutrasSaidasProduto.Value;
   end
else
   begin
   OutrasSaidas:=True;
   SomenteLeitura;
   end;
btnPainel.SetFocus;
end;

procedure TfrmCadSaidas.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if ConsMovFinanceira then
   begin
   btnIncluir.Visible:=True;
   btnConfirmar.Visible:=True;
   btnCancelar.Visible:=True;
   btnSair.Visible:=True;
   btnLocalizar.Visible:=True;
   btnVoltar.Visible:=False;
   DMInloco.tblOutrasSaidas.Close;
   end
else
   OutrasSaidas:=False;
DMInloco.tblMotivosSaida.IndexName:='';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblMotivosSaida.Close;
DMInloco.tblProdutos.Close;
Action:=caFree;
end;

procedure TfrmCadSaidas.btnIncluirClick(Sender: TObject);
var
   codigo:integer;
begin
Escrita;
DMInloco.tblOutrasSaidas.Open;
DMInloco.tblOutrasSaidas.Last;
codigo:=DMInloco.tblOutrasSaidasCod_Saida.Value;
DMInloco.tblOutrasSaidas.Append;
DMInloco.tblOutrasSaidasCod_Saida.Value:=codigo+1;
DMInloco.tblOutrasSaidasData_Saida.Value:=date;
end;

procedure TfrmCadSaidas.btnConfirmarClick(Sender: TObject);
var
   Codigo:integer;
begin
if length(edtCodProduto.Text)=0 then
   begin
   beep;
   MessageDlg('Produto deve ser especificado!',mtError,[mbOK],0);
   edtCodProduto.SetFocus;
   end
else if length(cmbMotivo.Text)=0 then
   begin
   beep;
   MessageDlg('Motivo da sa�da deve ser especificado!',mtError,[mbOK],0);
   cmbMotivo.SetFocus;
   end
else if (length(edtQuantidade.Text)=0) or
   (StrToInt(edtQuantidade.Text)=0) then
   begin
   beep;
   MessageDlg('Quantidade deve ser maior que zero!',mtError,[mbOK],0);
   edtQuantidade.SetFocus;
   end
else if (length(edtDataSaida.Text)=0) or
   (StrToDate(edtDataSaida.Text)>date) then
   begin
   beep;
   MessageDlg('Data da sa�da de ser especificada!',mtError,[mbOK],0);
   edtDataSaida.SetFocus;
   end
else
   begin
   DMInloco.tblOutrasSaidas.Post;
   DMInloco.tblProdutos.Edit;
   DMInloco.tblProdutosQuant_Atual.Value:=
   DMInloco.tblProdutosQuant_Atual.Value-
   DMInloco.tblOutrasSaidasQuantidade.Value;
   DMInloco.tblProdutos.Post;
   if DMInloco.tblOutrasSaidasValor_Unitario.Value>0 then
      begin
      DMInloco.tblMovFinanceira.Open;
      DMInloco.tblMovFinanceira.Last;
      Codigo:=DMInloco.tblMovFinanceiraCod_Operacao.Value;
      DMInloco.tblMovFinanceira.Append;
      DMInloco.tblMovFinanceiraCod_Operacao.Value:=Codigo+1;
      DMInloco.tblMovFinanceiraData_Operacao.Value:=date;
      DMInloco.tblMovFinanceiraEspecie.Value:='C';
      DMInloco.tblMovFinanceiraReferencia.Value:=
      DMInloco.tblOutrasSaidasCod_Saida.Value;
      DMInloco.tblMovFinanceiraHistorico.Value:=
      'Sa�da de Mercadoria devido � '+DMInloco.tblOutrasSaidasMotivo.Value;
      DMInloco.tblMovFinanceiraValor.Value:=
      DMInloco.tblOutrasSaidasValor_Total.Value;
      DMInloco.tblMovFinanceira.Post;
      DMInloco.tblMovFinanceira.Close;
      end;
   SomenteLeitura;
   end;
end;

procedure TfrmCadSaidas.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblOutrasSaidas.Cancel;
SomenteLeitura;
end;

procedure TfrmCadSaidas.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadSaidas.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocProdutos, frmLocProdutos);
frmLocProdutos.ShowModal;
DMInloco.tblProdutos.IndexName:='';
end;

procedure TfrmCadSaidas.edtCodProdutoExit(Sender: TObject);
begin
if length(edtCodProduto.Text)>0 then
   if not DMInloco.tblProdutos.FindKey([DMInloco.tblOutrasSaidasCod_Produto])
      then
      begin
      beep;
      MessageDlg('Produto n�o cadastrado!',mtInformation,[mbOK],0);
      edtCodProduto.SetFocus;
      end
   else
      txtProduto.Caption:=DMInloco.tblProdutosProduto.AsString;
end;


procedure TfrmCadSaidas.edtCodProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TfrmCadSaidas.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;


procedure TfrmCadSaidas.btnVoltarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadSaidas.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
