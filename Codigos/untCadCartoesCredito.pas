//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadCartoesCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmCadCartoesCredito = class(TForm)
    lblCodCartao: TLabel;
    lblCartaoCredito: TLabel;
    lblRecebimento: TLabel;
    lblComentario: TLabel;
    Panel2: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnTabela: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    edtCartaoCredito: TDBEdit;
    edtRecebimento: TDBEdit;
    txtCodCartao: TDBText;
    lblValorAutorizacao: TLabel;
    edtValorAutorizacao: TDBEdit;
    Bevel1: TBevel;
    rdgClassCartoesCredito: TRadioGroup;
    dbgCartoesCredito: TDBGrid;
    btnVoltar: TSpeedButton;
    lblDesconto: TLabel;
    edtDesconto: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClassCartoesCreditoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtRecebimentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorAutorizacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCartoesCredito: TfrmCadCartoesCredito;

implementation

uses untDMInloco, untLocCartoesCredito;

{$R *.DFM}

procedure Escrita;
begin
frmCadCartoesCredito.btnPrimeiro.Enabled:=False;
frmCadCartoesCredito.btnAnterior.Enabled:=False;
frmCadCartoesCredito.btnProximo.Enabled:=False;
frmCadCartoesCredito.btnUltimo.Enabled:=False;
frmCadCartoesCredito.btnTabela.Enabled:=False;
frmCadCartoesCredito.btnVoltar.Enabled:=False;
frmCadCartoesCredito.btnLocalizar.Enabled:=False;
frmCadCartoesCredito.btnEditar.Enabled:=False;
frmCadCartoesCredito.btnExcluir.Enabled:=False;
frmCadCartoesCredito.btnIncluir.Enabled:=False;
frmCadCartoesCredito.btnSair.Enabled:=False;
frmCadCartoesCredito.btnConfirmar.Enabled:=True;
frmCadCartoesCredito.btnCancelar.Enabled:=True;
frmCadCartoesCredito.rdgClassCartoesCredito.Enabled:=False;
frmCadCartoesCredito.edtCartaoCredito.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadCartoesCredito.btnPrimeiro.Enabled:=True;
frmCadCartoesCredito.btnAnterior.Enabled:=True;
frmCadCartoesCredito.btnProximo.Enabled:=True;
frmCadCartoesCredito.btnUltimo.Enabled:=True;
frmCadCartoesCredito.btnConfirmar.Enabled:=False;
frmCadCartoesCredito.btnCancelar.Enabled:=False;
frmCadCartoesCredito.btnTabela.Enabled:=True;
frmCadCartoesCredito.btnVoltar.Enabled:=True;
frmCadCartoesCredito.btnLocalizar.Enabled:=True;
frmCadCartoesCredito.btnEditar.Enabled:=True;
frmCadCartoesCredito.btnExcluir.Enabled:=True;
frmCadCartoesCredito.btnIncluir.Enabled:=True;
frmCadCartoesCredito.btnSair.Enabled:=True;
frmCadCartoesCredito.rdgClassCartoesCredito.Enabled:=True;
frmCadCartoesCredito.rdgClassCartoesCredito.SetFocus;
end;

procedure TfrmCadCartoesCredito.FormShow(Sender: TObject);
begin
DMInloco.tblCartoesCredito.IndexName:='';
DMInloco.tblCartoesCredito.Open;
DMInloco.tblCartoesCredito.First;
SomenteLeitura;
rdgClassCartoesCredito.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadCartoesCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMInloco.tblCartoesCredito.IndexName:='';
DMInloco.tblCartoesCredito.Close;
Action:=caFree;
end;

procedure TfrmCadCartoesCredito.rdgClassCartoesCreditoClick(Sender: TObject);
begin
   Case rdgClassCartoesCredito.ItemIndex of
      0: DMInloco.tblCartoesCredito.IndexName := '';
      1: DMInloco.tblCartoesCredito.IndexName := 'Descr_Cartao';
   end;
   SomenteLeitura;
end;

procedure TfrmCadCartoesCredito.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblCartoesCredito.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadCartoesCredito.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblCartoesCredito.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblCartoesCredito.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadCartoesCredito.btnProximoClick(Sender: TObject);
begin
DMInloco.tblCartoesCredito.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblCartoesCredito.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadCartoesCredito.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblCartoesCredito.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadCartoesCredito.btnEditarClick(Sender: TObject);
begin
dbgCartoesCredito.Visible:=False;
Escrita;
DMInloco.tblCartoesCredito.Edit;
end;

procedure TfrmCadCartoesCredito.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Cart�o de Cr�dito?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblCartoesCredito.Delete;
end;

procedure TfrmCadCartoesCredito.btnIncluirClick(Sender: TObject);
var
i,codigo:integer;
begin
Escrita;
dbgCartoesCredito.Visible:=False;
DMInloco.tblCartoesCredito.IndexName:='';
DMInloco.tblCartoesCredito.Last;
codigo:=DMInloco.tblCartoesCreditoCod_Cartao.AsInteger;
DMInloco.tblCartoesCredito.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblCartoesCreditoCod_Cartao.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblCartoesCredito.Next;
   end;
DMInloco.tblCartoesCredito.Append;
DMInloco.tblCartoesCreditoCod_Cartao.AsInteger:=codigo+1;
end;

procedure TfrmCadCartoesCredito.btnConfirmarClick(Sender: TObject);
begin
if length(edtCartaoCredito.Text)=0 then
   begin
   beep;
   MessageDlg('Nome do Cart�o n�o pode estar vazio!',mtError,[mbOK],0);
   edtCartaoCredito.SetFocus;
   end
else if length(edtRecebimento.Text)=0 then
   begin
   beep;
   MessageDlg('Per�odo para recebimento n�o pode estar vazio!',mtError,[mbOK],0);
   edtRecebimento.SetFocus;
   end
else if length(edtValorAutorizacao.Text)=0 then
   begin
   beep;
   MessageDlg('Valor para autoriza��o n�o pode estar vazio!',mtError,[mbOK],0);
   edtValorAutorizacao.SetFocus;
   end
else if length(edtDesconto.Text)=0 then
   begin
   beep;
   MessageDlg('Valor Descontado n�o pode estar vazio!',mtError,[mbOK],0);
   edtDesconto.SetFocus;
   end
else
   begin
   DMInloco.tblCartoesCredito.Post;
   if rdgClassCartoesCredito.ItemIndex=1 then
      DMInloco.tblCartoesCredito.IndexName := 'Descr_Cartao';
   SomenteLeitura;
   if btnTabela.Down=True then
      dbgCartoesCredito.Visible:=True;
   end;
end;

procedure TfrmCadCartoesCredito.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblCartoesCredito.Cancel;
if rdgClassCartoesCredito.ItemIndex=1 then
   DMInloco.tblCartoesCredito.IndexName := 'Descr_Cartao';
SomenteLeitura;
if btnTabela.Down=True then
   dbgCartoesCredito.Visible:=True;
end;

procedure TfrmCadCartoesCredito.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadCartoesCredito.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocCartoesCredito, frmLocCartoesCredito);
frmLocCartoesCredito.ShowModal;
end;

procedure TfrmCadCartoesCredito.btnTabelaClick(Sender: TObject);
begin
dbgCartoesCredito.Visible:=True;
end;

procedure TfrmCadCartoesCredito.btnVoltarClick(Sender: TObject);
begin
dbgCartoesCredito.Visible:=False;
end;

procedure TfrmCadCartoesCredito.edtRecebimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadCartoesCredito.edtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadCartoesCredito.edtValorAutorizacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
