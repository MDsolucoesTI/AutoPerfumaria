//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadEntradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCadEntradas = class(TForm)
    Bevel1: TBevel;
    lblProduto: TLabel;
    lblMotivo: TLabel;
    cmbMotivo: TDBLookupComboBox;
    lblQuantidade: TLabel;
    edtQuantidade: TDBEdit;
    lblData: TLabel;
    edtDataEntrada: TDBEdit;
    btnPainel: TPanel;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    btnLocalizar: TSpeedButton;
    edtCodProduto: TDBEdit;
    txtProduto: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtValorUnitario: TDBEdit;
    edtValorTotal: TDBEdit;
    btnVoltar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  frmCadEntradas: TfrmCadEntradas;
  OutrasEntradas:Boolean;

implementation

uses untDMInloco, untLocProdutos, untConsultarCaixa;

{$R *.DFM}

procedure Escrita;
begin
frmCadEntradas.btnIncluir.Enabled:=False;
frmCadEntradas.btnConfirmar.Enabled:=True;
frmCadEntradas.btnCancelar.Enabled:=True;
frmCadEntradas.btnSair.Enabled:=False;
frmCadEntradas.btnLocalizar.Enabled:=True;
end;

procedure SomenteLeitura;
begin
frmCadEntradas.btnIncluir.Enabled:=True;
frmCadEntradas.btnConfirmar.Enabled:=False;
frmCadEntradas.btnCancelar.Enabled:=False;
frmCadEntradas.btnSair.Enabled:=True;
frmCadEntradas.btnLocalizar.Enabled:=False;
frmCadEntradas.txtProduto.Caption:='';
DMInloco.tblOutrasEntradas.Close;
end;

procedure TfrmCadEntradas.FormShow(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.IndexName:='Motivo_Entrada';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblMotivosEntrada.Open;
DMInloco.tblProdutos.Open;
if ConsMovFinanceira then
   begin
   btnIncluir.Visible:=False;
   btnConfirmar.Visible:=False;
   btnCancelar.Visible:=False;
   btnSair.Visible:=False;
   btnLocalizar.Visible:=False;
   btnVoltar.Visible:=True;
   DMInloco.tblOutrasEntradas.Open;
   DMInloco.tblOutrasEntradas.FindKey
   ([DMInloco.tblMovFinanceiraReferencia.Value]);
   txtProduto.Caption:=DMInloco.tblOutrasEntradasProduto.Value;
   end
else
   begin
   SomenteLeitura;
   OutrasEntradas:=True;
   end;
btnPainel.SetFocus;
end;

procedure TfrmCadEntradas.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if ConsMovFinanceira then
   begin
   btnIncluir.Visible:=True;
   btnConfirmar.Visible:=True;
   btnCancelar.Visible:=True;
   btnSair.Visible:=True;
   btnLocalizar.Visible:=True;
   btnVoltar.Visible:=False;
   DMInloco.tblOutrasEntradas.Close;
   end
else
   OutrasEntradas:=False;
DMInloco.tblMotivosEntrada.IndexName:='';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblMotivosEntrada.Close;
DMInloco.tblProdutos.Close;
Action:=caFree;
end;

procedure TfrmCadEntradas.btnIncluirClick(Sender: TObject);
var
   codigo:integer;
begin
Escrita;
DMInloco.tblOutrasEntradas.Open;
DMInloco.tblOutrasEntradas.Last;
codigo:=DMInloco.tblOutrasEntradasCod_Entrada.Value;
DMInloco.tblOutrasEntradas.Append;
DMInloco.tblOutrasEntradasCod_Entrada.Value:=codigo+1;
DMInloco.tblOutrasEntradasData_Entrada.Value:=date;
end;

procedure TfrmCadEntradas.btnConfirmarClick(Sender: TObject);
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
   MessageDlg('Motivo da entrada deve ser especificado!',mtError,[mbOK],0);
   cmbMotivo.SetFocus;
   end
else if (length(edtQuantidade.Text)=0) or
   (StrToInt(edtQuantidade.Text)=0) then
   begin
   beep;
   MessageDlg('Quantidade deve ser maior que zero!',mtError,[mbOK],0);
   edtQuantidade.SetFocus;
   end
else if (length(edtDataEntrada.Text)=0) or
   (StrToDate(edtDataEntrada.Text)>date) then
   begin
   beep;
   MessageDlg('Data inv�lida!',mtError,[mbOK],0);
   edtDataEntrada.SetFocus;
   end
else
   begin
   DMInloco.tblOutrasEntradas.Post;
   DMInloco.tblProdutos.Edit;
   DMInloco.tblProdutosQuant_Atual.Value:=
   DMInloco.tblProdutosQuant_Atual.Value+
   DMInloco.tblOutrasEntradasQuantidade.Value;
   DMInloco.tblProdutos.Post;
   if DMInloco.tblOutrasEntradasValor_Unitario.Value>0 then
      begin
      DMInloco.tblMovFinanceira.Open;
      DMInloco.tblMovFinanceira.Last;
      Codigo:=DMInloco.tblMovFinanceiraCod_Operacao.Value;
      DMInloco.tblMovFinanceira.Append;
      DMInloco.tblMovFinanceiraCod_Operacao.Value:=Codigo+1;
      DMInloco.tblMovFinanceiraData_Operacao.Value:=date;
      DMInloco.tblMovFinanceiraEspecie.Value:='D';
      DMInloco.tblMovFinanceiraData_Referencia.Value:=
      DMInloco.tblOutrasEntradasData_Entrada.Value;
      DMInloco.tblMovFinanceiraReferencia.Value:=
      DMInloco.tblOutrasEntradasCod_Entrada.Value;
      DMInloco.tblMovFinanceiraHistorico.Value:=
      'Entrada de Mercadoria devido � '+DMInloco.tblOutrasEntradasMotivo.Value;
      DMInloco.tblMovFinanceiraValor.Value:=
      DMInloco.tblOutrasEntradasValor_Total.Value;
      DMInloco.tblMovFinanceira.Post;
      DMInloco.tblMovFinanceira.Close;
      end;
   SomenteLeitura;
   end;
end;

procedure TfrmCadEntradas.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblOutrasEntradas.Cancel;
SomenteLeitura;
end;

procedure TfrmCadEntradas.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadEntradas.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocProdutos, frmLocProdutos);
frmLocProdutos.ShowModal;
DMInloco.tblProdutos.IndexName:='';
end;

procedure TfrmCadEntradas.edtCodProdutoExit(Sender: TObject);
begin
if length(edtCodProduto.Text)>0 then
   if not DMInloco.tblProdutos.FindKey([DMInloco.tblOutrasEntradasCod_Produto])
      then
      begin
      beep;
      MessageDlg('Produto n�o cadastrado!',mtInformation,[mbOK],0);
      edtCodProduto.SetFocus;
      end
   else
      txtProduto.Caption:=DMInloco.tblProdutosProduto.AsString;
end;

procedure TfrmCadEntradas.edtCodProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TfrmCadEntradas.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadEntradas.btnVoltarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadEntradas.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
