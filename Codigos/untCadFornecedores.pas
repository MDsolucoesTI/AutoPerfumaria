//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls, Grids, DBGrids;

type
  TfrmCadFornecedores = class(TForm)
    lblCodForn: TLabel;
    lblNomeFantasia: TLabel;
    lblRazaoSocial: TLabel;
    lblTelForn: TLabel;
    lblFaxForn: TLabel;
    lblVendedor: TLabel;
    lblTelVendedor: TLabel;
    lblCondPagto: TLabel;
    lblPrazoEntrega: TLabel;
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
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUf: TLabel;
    lblCep: TLabel;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    edtCidade: TDBEdit;
    edtUf: TDBEdit;
    edtCep: TDBEdit;
    edtCondPagto: TDBEdit;
    edtTelForn: TDBEdit;
    edtFaxForn: TDBEdit;
    edtTelVendedor: TDBEdit;
    edtNomeVendedor: TDBEdit;
    edtNomeFantasia: TDBEdit;
    edtRazaoSocial: TDBEdit;
    txtCodForn: TDBText;
    edtPrazoEntrega: TDBEdit;
    Bevel1: TBevel;
    rdgClassFornecedores: TRadioGroup;
    btnVoltar: TSpeedButton;
    dbgFornecedores: TDBGrid;
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure rdgClassFornecedoresClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCondPagtoExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtPrazoEntregaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornecedores: TfrmCadFornecedores;

implementation

uses untDMInloco, untLocFornecedores;

{$R *.DFM}

procedure Escrita;
begin
frmCadFornecedores.btnPrimeiro.Enabled:=False;
frmCadFornecedores.btnAnterior.Enabled:=False;
frmCadFornecedores.btnProximo.Enabled:=False;
frmCadFornecedores.btnUltimo.Enabled:=False;
frmCadFornecedores.btnConfirmar.Enabled:=True;
frmCadFornecedores.btnCancelar.Enabled:=True;
frmCadFornecedores.btnTabela.Enabled:=False;
frmCadFornecedores.btnVoltar.Enabled:=False;
frmCadFornecedores.btnLocalizar.Enabled:=False;
frmCadFornecedores.btnEditar.Enabled:=False;
frmCadFornecedores.btnExcluir.Enabled:=False;
frmCadFornecedores.btnIncluir.Enabled:=False;
frmCadFornecedores.btnSair.Enabled:=False;
frmCadFornecedores.rdgClassFornecedores.Enabled:=False;
frmCadFornecedores.edtNomeFantasia.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadFornecedores.btnPrimeiro.Enabled:=True;
frmCadFornecedores.btnAnterior.Enabled:=True;
frmCadFornecedores.btnProximo.Enabled:=True;
frmCadFornecedores.btnUltimo.Enabled:=True;
frmCadFornecedores.btnConfirmar.Enabled:=False;
frmCadFornecedores.btnCancelar.Enabled:=False;
frmCadFornecedores.btnTabela.Enabled:=True;
frmCadFornecedores.btnVoltar.Enabled:=True;
frmCadFornecedores.btnLocalizar.Enabled:=True;
frmCadFornecedores.btnEditar.Enabled:=True;
frmCadFornecedores.btnExcluir.Enabled:=True;
frmCadFornecedores.btnIncluir.Enabled:=True;
frmCadFornecedores.btnSair.Enabled:=True;
frmCadFornecedores.rdgClassFornecedores.Enabled:=True;
frmCadFornecedores.rdgClassFornecedores.SetFocus;
end;

procedure TfrmCadFornecedores.FormShow(Sender: TObject);
begin
DMInloco.tblFornecedores.IndexName:='';
DMInloco.tblFornecedores.Open;
DMInloco.tblFornecedores.First;
SomenteLeitura;
rdgClassFornecedores.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMInloco.tblFornecedores.IndexName:='';
DMInloco.tblFornecedores.Close;
Action:=caFree;
end;

procedure TfrmCadFornecedores.rdgClassFornecedoresClick(Sender: TObject);
begin
   Case rdgClassFornecedores.ItemIndex of
      0: DMInloco.tblFornecedores.IndexName := '';
      1: DMInloco.tblFornecedores.IndexName := 'Descr_Fornecedor';
   end;
   SomenteLeitura;
end;

procedure TfrmCadFornecedores.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblFornecedores.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadFornecedores.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblFornecedores.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblFornecedores.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadFornecedores.btnProximoClick(Sender: TObject);
begin
DMInloco.tblFornecedores.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblFornecedores.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadFornecedores.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblFornecedores.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadFornecedores.btnEditarClick(Sender: TObject);
begin
dbgFornecedores.Visible:=False;
Escrita;
DMInloco.tblFornecedores.Edit;
end;

procedure TfrmCadFornecedores.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Fornecedor?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblFornecedores.Delete;
end;

procedure TfrmCadFornecedores.btnIncluirClick(Sender: TObject);
var
i,codigo:integer;
begin
dbgFornecedores.Visible:=False;
Escrita;
DMInloco.tblFornecedores.IndexName := '';
DMInloco.tblFornecedores.Last;
codigo:=DMInloco.tblFornecedoresCod_Fornecedor.AsInteger;
DMInloco.tblFornecedores.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblFornecedoresCod_Fornecedor.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblFornecedores.Next;
   end;
DMInloco.tblFornecedores.Append;
DMInloco.tblFornecedoresCod_Fornecedor.AsInteger:=codigo+1;
end;

procedure TfrmCadFornecedores.btnConfirmarClick(Sender: TObject);
begin
if length(edtNomeFantasia.Text)=0 then
   begin
   beep;
   MessageDlg('Nome Fantasia n�o pode estar vazio!',mtError,[mbOK],0);
   edtNomeFantasia.SetFocus;
   end
else if length(edtRazaoSocial.Text)=0 then
   begin
   beep;
   MessageDlg('Raz�o Social n�o pode estar vazia!',mtError,[mbOK],0);
   edtRazaoSocial.SetFocus;
   end
else
   begin
   DMInloco.tblFornecedores.Post;
   if rdgClassFornecedores.ItemIndex=1 then
      DMInloco.tblFornecedores.IndexName := 'Descr_Fornecedor';
   SomenteLeitura;
   if btnTabela.Down then
      dbgFornecedores.Visible:=True;
   end;
end;

procedure TfrmCadFornecedores.btnCancelarClick(Sender: TObject);
begin
   DMInloco.tblFornecedores.Cancel;
   if rdgClassFornecedores.ItemIndex=1 then
      DMInloco.tblFornecedores.IndexName := 'Descr_Fornecedor';
   SomenteLeitura;
   if btnTabela.Down then
      dbgFornecedores.Visible:=True;
end;

procedure TfrmCadFornecedores.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadFornecedores.edtCondPagtoExit(Sender: TObject);
begin
edtNomeFantasia.SetFocus;
end;

procedure TfrmCadFornecedores.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocFornecedores, frmLocFornecedores);
frmLocFornecedores.ShowModal;
end;

procedure TfrmCadFornecedores.btnTabelaClick(Sender: TObject);
begin
dbgFornecedores.Visible:=True;
end;

procedure TfrmCadFornecedores.btnVoltarClick(Sender: TObject);
begin
dbgFornecedores.Visible:=False;
end;

procedure TfrmCadFornecedores.edtPrazoEntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
