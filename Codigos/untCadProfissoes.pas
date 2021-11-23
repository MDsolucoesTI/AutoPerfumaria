//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadProfissoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmCadProfissoes = class(TForm)
    lblCodProfissao: TLabel;
    lblProfissao: TLabel;
    Panel1: TPanel;
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
    edtProfissao: TDBEdit;
    txtCodProfissao: TDBText;
    Bevel1: TBevel;
    rdgClassProfissoes: TRadioGroup;
    btnVoltar: TSpeedButton;
    dbgProfissoes: TDBGrid;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure rdgClassProfissoesClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProfissoes: TfrmCadProfissoes;

implementation

uses untDMInloco, untLocProfissoes, untCadClientes;

{$R *.DFM}

procedure Escrita;
begin
frmCadProfissoes.btnPrimeiro.Enabled:=False;
frmCadProfissoes.btnAnterior.Enabled:=False;
frmCadProfissoes.btnProximo.Enabled:=False;
frmCadProfissoes.btnUltimo.Enabled:=False;
frmCadProfissoes.btnTabela.Enabled:=False;
frmCadProfissoes.btnVoltar.Enabled:=False;
frmCadProfissoes.btnLocalizar.Enabled:=False;
frmCadProfissoes.btnEditar.Enabled:=False;
frmCadProfissoes.btnExcluir.Enabled:=False;
frmCadProfissoes.btnIncluir.Enabled:=False;
frmCadProfissoes.btnSair.Enabled:=False;
frmCadProfissoes.btnConfirmar.Enabled:=True;
frmCadProfissoes.btnCancelar.Enabled:=True;
frmCadProfissoes.rdgClassProfissoes.Enabled:=False;
frmCadProfissoes.edtProfissao.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadProfissoes.btnPrimeiro.Enabled:=True;
frmCadProfissoes.btnAnterior.Enabled:=True;
frmCadProfissoes.btnProximo.Enabled:=True;
frmCadProfissoes.btnUltimo.Enabled:=True;
frmCadProfissoes.btnConfirmar.Enabled:=False;
frmCadProfissoes.btnCancelar.Enabled:=False;
frmCadProfissoes.btnTabela.Enabled:=True;
frmCadProfissoes.btnVoltar.Enabled:=True;
frmCadProfissoes.btnLocalizar.Enabled:=True;
frmCadProfissoes.btnEditar.Enabled:=True;
frmCadProfissoes.btnExcluir.Enabled:=True;
frmCadProfissoes.btnIncluir.Enabled:=True;
frmCadProfissoes.btnSair.Enabled:=True;
frmCadProfissoes.rdgClassProfissoes.Enabled:=True;
frmCadProfissoes.rdgClassProfissoes.SetFocus;
end;

procedure TfrmCadProfissoes.FormShow(Sender: TObject);
begin
DMInloco.tblCliProfissoes.IndexName:='';
DMInloco.tblCliProfissoes.Open;
DMInloco.tblCliProfissoes.First;
SomenteLeitura;
rdgClassProfissoes.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadProfissoes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if not CadClientes then
   begin
   DMInloco.tblCliProfissoes.IndexName:='';
   DMInloco.tblCliProfissoes.Close;
   end
else
   DMInloco.tblCliProfissoes.IndexName:='Descr_Profissao';
Action:=caFree;
end;

procedure TfrmCadProfissoes.rdgClassProfissoesClick(Sender: TObject);
begin
   case rdgClassProfissoes.ItemIndex of
      0: DMInloco.tblCliProfissoes.IndexName := '';
      1: DMInloco.tblCliProfissoes.IndexName := 'Descr_Profissao';
   end;
   SomenteLeitura;
end;

procedure TfrmCadProfissoes.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblCliProfissoes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadProfissoes.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblCliProfissoes.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblCliProfissoes.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadProfissoes.btnProximoClick(Sender: TObject);
begin
DMInloco.tblCliProfissoes.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblCliProfissoes.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadProfissoes.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblCliProfissoes.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadProfissoes.btnEditarClick(Sender: TObject);
begin
dbgProfissoes.Visible:=False;
Escrita;
DMInloco.tblCliProfissoes.Edit;
end;

procedure TfrmCadProfissoes.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir essa Profiss�o?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblCliProfissoes.Delete;
end;

procedure TfrmCadProfissoes.btnIncluirClick(Sender: TObject);
var
i,codigo:integer;
begin
dbgProfissoes.Visible:=False;
Escrita;
DMInloco.tblCliProfissoes.IndexName := '';
DMInloco.tblCliProfissoes.Last;
codigo:=DMInloco.tblCliProfissoesCod_Profissao.AsInteger;
DMInloco.tblCliProfissoes.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblCliProfissoesCod_Profissao.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblCliProfissoes.Next;
   end;
DMInloco.tblCliProfissoes.Append;
DMInloco.tblCliProfissoesCod_Profissao.AsInteger:=codigo+1;
end;

procedure TfrmCadProfissoes.btnConfirmarClick(Sender: TObject);
begin
if length(edtProfissao.Text)=0 then
   begin
   beep;
   MessageDlg('Profiss�o n�o pode estar vazia!',mtError,[mbOK],0);
   edtProfissao.SetFocus;
   end
else
   begin
   DMInloco.tblCliProfissoes.Post;
   if rdgClassProfissoes.ItemIndex=1 then
      DMInloco.tblCliProfissoes.IndexName := 'Descr_Profissao';
   SomenteLeitura;
   if btnTabela.Down then
      dbgProfissoes.Visible:=True;
   end;
end;

procedure TfrmCadProfissoes.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblCliProfissoes.Cancel;
if rdgClassProfissoes.ItemIndex=1 then
   DMInloco.tblCliProfissoes.IndexName := 'Descr_Profissao';
SomenteLeitura;
if btnTabela.Down then
   dbgProfissoes.Visible:=True;
end;

procedure TfrmCadProfissoes.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadProfissoes.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocProfissoes, frmLocProfissoes);
frmLocProfissoes.ShowModal;
end;

procedure TfrmCadProfissoes.btnTabelaClick(Sender: TObject);
begin
dbgProfissoes.Visible:=True;
end;

procedure TfrmCadProfissoes.btnVoltarClick(Sender: TObject);
begin
dbgProfissoes.Visible:=False;
end;

end.
