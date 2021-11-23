//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadConvenios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TfrmCadConvenios = class(TForm)
    lblCodConvenio: TLabel;
    lblConvenio: TLabel;
    lblDiaRecebimento: TLabel;
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
    edtConvenio: TDBEdit;
    edtDiaRecebimento: TDBEdit;
    txtCodConvenio: TDBText;
    Bevel1: TBevel;
    rdgClassConvenios: TRadioGroup;
    btnVoltar: TSpeedButton;
    dbgConvenios: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClassConveniosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtDiaRecebimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConvenios: TfrmCadConvenios;

implementation

uses untDMInloco, untLocConvenios;

{$R *.DFM}

procedure Escrita;
begin
frmCadConvenios.btnPrimeiro.Enabled:=False;
frmCadConvenios.btnAnterior.Enabled:=False;
frmCadConvenios.btnProximo.Enabled:=False;
frmCadConvenios.btnUltimo.Enabled:=False;
frmCadConvenios.btnTabela.Enabled:=False;
frmCadConvenios.btnVoltar.Enabled:=False;
frmCadConvenios.btnLocalizar.Enabled:=False;
frmCadConvenios.btnEditar.Enabled:=False;
frmCadConvenios.btnExcluir.Enabled:=False;
frmCadConvenios.btnIncluir.Enabled:=False;
frmCadConvenios.btnSair.Enabled:=False;
frmCadConvenios.btnConfirmar.Enabled:=True;
frmCadConvenios.btnCancelar.Enabled:=True;
frmCadConvenios.rdgClassConvenios.Enabled:=False;
frmCadConvenios.edtConvenio.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadConvenios.btnPrimeiro.Enabled:=True;
frmCadConvenios.btnAnterior.Enabled:=True;
frmCadConvenios.btnProximo.Enabled:=True;
frmCadConvenios.btnUltimo.Enabled:=True;
frmCadConvenios.btnConfirmar.Enabled:=False;
frmCadConvenios.btnCancelar.Enabled:=False;
frmCadConvenios.btnTabela.Enabled:=True;
frmCadConvenios.btnVoltar.Enabled:=True;
frmCadConvenios.btnLocalizar.Enabled:=True;
frmCadConvenios.btnEditar.Enabled:=True;
frmCadConvenios.btnExcluir.Enabled:=True;
frmCadConvenios.btnIncluir.Enabled:=True;
frmCadConvenios.btnSair.Enabled:=True;
frmCadConvenios.rdgClassConvenios.Enabled:=True;
frmCadConvenios.rdgClassConvenios.SetFocus;
end;

procedure TfrmCadConvenios.FormShow(Sender: TObject);
begin
DMInloco.tblConvenios.IndexName:='';
DMInloco.tblConvenios.Open;
DMInloco.tblConvenios.First;
SomenteLeitura;
rdgClassConvenios.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadConvenios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblConvenios.IndexName:='';
DMInloco.tblConvenios.Close;
Action:=caFree;
end;

procedure TfrmCadConvenios.rdgClassConveniosClick(Sender: TObject);
begin
   Case rdgClassConvenios.ItemIndex of
      0: DMInloco.tblConvenios.IndexName := '';
      1: DMInloco.tblConvenios.IndexName := 'Descr_Convenio';
   end;
   SomenteLeitura;
end;

procedure TfrmCadConvenios.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblConvenios.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadConvenios.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblConvenios.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblConvenios.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadConvenios.btnProximoClick(Sender: TObject);
begin
DMInloco.tblConvenios.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblConvenios.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadConvenios.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblConvenios.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadConvenios.btnEditarClick(Sender: TObject);
begin
dbgConvenios.Visible:=False;
Escrita;
DMInloco.tblConvenios.Edit;
end;

procedure TfrmCadConvenios.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Conv�nio?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblConvenios.Delete;
end;

procedure TfrmCadConvenios.btnIncluirClick(Sender: TObject);
var
i,codigo:integer;
begin
dbgConvenios.Visible:=False;
Escrita;
DMInloco.tblConvenios.IndexName:='';
DMInloco.tblConvenios.Last;
codigo:=DMInloco.tblConveniosCod_Convenio.AsInteger;
DMInloco.tblConvenios.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblConveniosCod_Convenio.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblConvenios.Next;
   end;
DMInloco.tblConvenios.Append;
DMInloco.tblConveniosCod_Convenio.AsInteger:=codigo+1;
end;

procedure TfrmCadConvenios.btnConfirmarClick(Sender: TObject);
begin
if length(edtConvenio.Text)=0 then
   begin
   beep;
   MessageDlg('Nome do Conv�nio n�o pode estar vazio!',mtError,[mbOK],0);
   edtConvenio.SetFocus;
   end
else if length(edtDiaRecebimento.Text)=0 then
   begin
   beep;
   MessageDlg('Dia do recebimento n�o pode estar vazio!',mtError,[mbOK],0);
   edtDiaRecebimento.SetFocus;
   end
else
   begin
   DMInloco.tblConvenios.Post;
   if rdgClassConvenios.ItemIndex=1 then
      DMInloco.tblConvenios.IndexName := 'Descr_Convenio';
   SomenteLeitura;
   if btnTabela.Down then
      dbgConvenios.Visible:=True;
   end;
end;

procedure TfrmCadConvenios.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblConvenios.Cancel;
if rdgClassConvenios.ItemIndex=1 then
   DMInloco.tblConvenios.IndexName := 'Descr_Convenio';
SomenteLeitura;
if btnTabela.Down then
   dbgConvenios.Visible:=True;
end;

procedure TfrmCadConvenios.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadConvenios.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocConvenios, frmLocConvenios);
frmLocConvenios.ShowModal;
end;

procedure TfrmCadConvenios.btnTabelaClick(Sender: TObject);
begin
dbgConvenios.Visible:=True;
end;

procedure TfrmCadConvenios.btnVoltarClick(Sender: TObject);
begin
dbgConvenios.Visible:=False;
end;

procedure TfrmCadConvenios.edtDiaRecebimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
