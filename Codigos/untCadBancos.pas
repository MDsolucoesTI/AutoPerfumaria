//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmCadBancos = class(TForm)
    lblNumBanco: TLabel;
    lblBanco: TLabel;
    btnPainel: TPanel;
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
    edtNumBanco: TDBEdit;
    edtBanco: TDBEdit;
    Bevel1: TBevel;
    rdgClassBancos: TRadioGroup;
    dbgBancos: TDBGrid;
    btnVoltar: TSpeedButton;
    edtNumBanco2: TEdit;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure rdgClassBancosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtNumBanco2Exit(Sender: TObject);
    procedure edtNumBanco2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBancos: TfrmCadBancos;
  Cancelado:Boolean=False;

implementation

uses untDMInloco, untLocBancos, untPrincipal;

{$R *.DFM}

procedure Escrita;
begin
frmCadBancos.btnPrimeiro.Enabled:=False;
frmCadBancos.btnAnterior.Enabled:=False;
frmCadBancos.btnProximo.Enabled:=False;
frmCadBancos.btnUltimo.Enabled:=False;
frmCadBancos.btnTabela.Enabled:=False;
frmCadBancos.btnVoltar.Enabled:=False;
frmCadBancos.btnLocalizar.Enabled:=False;
frmCadBancos.btnEditar.Enabled:=False;
frmCadBancos.btnExcluir.Enabled:=False;
frmCadBancos.btnIncluir.Enabled:=False;
frmCadBancos.btnSair.Enabled:=False;
frmCadBancos.btnConfirmar.Enabled:=True;
frmCadBancos.btnCancelar.Enabled:=True;
frmCadBancos.rdgClassBancos.Enabled:=False;
frmCadBancos.edtNumBanco.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadBancos.btnPrimeiro.Enabled:=True;
frmCadBancos.btnAnterior.Enabled:=True;
frmCadBancos.btnProximo.Enabled:=True;
frmCadBancos.btnUltimo.Enabled:=True;
frmCadBancos.btnConfirmar.Enabled:=False;
frmCadBancos.btnCancelar.Enabled:=False;
frmCadBancos.btnTabela.Enabled:=True;
frmCadBancos.btnVoltar.Enabled:=True;
frmCadBancos.btnLocalizar.Enabled:=True;
frmCadBancos.btnEditar.Enabled:=True;
frmCadBancos.btnExcluir.Enabled:=True;
frmCadBancos.btnIncluir.Enabled:=True;
frmCadBancos.btnSair.Enabled:=True;
frmCadBancos.edtNumBanco2.Text:='';
frmCadBancos.edtNumBanco2.Visible:=False;
frmCadBancos.rdgClassBancos.Enabled:=True;
frmCadBancos.rdgClassBancos.SetFocus;
end;

procedure TfrmCadBancos.FormShow(Sender: TObject);
begin
DMInloco.tblBancos.IndexName:='';
DMInloco.tblBancos.Open;
DMInloco.tblBancos.First;
SomenteLeitura;
rdgClassBancos.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadBancos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblBancos.IndexName:='';
DMInloco.tblBancos.Close;
Action:=caFree;
end;

procedure TfrmCadBancos.rdgClassBancosClick(Sender: TObject);
begin
   Case rdgClassBancos.ItemIndex of
      0: DMInloco.tblBancos.IndexName := '';
      1: DMInloco.tblBancos.IndexName := 'Descr_Banco';
   end;
   SomenteLeitura;
end;

procedure TfrmCadBancos.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblBancos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadBancos.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblBancos.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblBancos.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadBancos.btnProximoClick(Sender: TObject);
begin
DMInloco.tblBancos.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblBancos.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadBancos.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblBancos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadBancos.btnEditarClick(Sender: TObject);
begin
dbgBancos.Visible:=False;
Escrita;
DMInloco.tblBancos.Edit;
end;

procedure TfrmCadBancos.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Banco?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblBancos.Delete;
end;

procedure TfrmCadBancos.btnIncluirClick(Sender: TObject);
begin
Cancelado:=False;
dbgBancos.Visible:=False;
Escrita;
edtNumBanco2.Visible:=True;
edtNumBanco2.SetFocus;
DMInloco.tblBancos.IndexName:='';
DMInloco.tblBancos.Append;
DMInloco.tblBancos.Post;
end;

procedure TfrmCadBancos.btnConfirmarClick(Sender: TObject);
begin
if length(edtNumBanco.Text)=0 then
   begin
   beep;
   MessageDlg('N�mero do Banco n�o pode estar vazio!',mtError,[mbOK],0);
   edtNumBanco.SetFocus;
   end
else if length(edtBanco.Text)=0 then
   begin
   beep;
   MessageDlg('Nome do Banco n�o pode estar vazio!',mtError,[mbOK],0);
   edtBanco.SetFocus;
   end
else
   begin
   DMInloco.tblBancos.Post;
   SomenteLeitura;
   if btnTabela.Down=True then
      dbgBancos.Visible:=True;
   end;
end;

procedure TfrmCadBancos.btnCancelarClick(Sender: TObject);
begin
Cancelado:=True;
DMInloco.tblBancos.Delete;
SomenteLeitura;
btnUltimo.Enabled:=False;
btnProximo.Enabled:=False;
if btnTabela.Down=True then
   dbgBancos.Visible:=True;
case rdgClassBancos.ItemIndex of
   0: DMInloco.tblBancos.IndexName := '';
   1: DMInloco.tblBancos.IndexName := 'Descr_Banco';
   end;
end;

procedure TfrmCadBancos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadBancos.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocBancos, frmLocBancos);
frmLocBancos.ShowModal;
end;

procedure TfrmCadBancos.btnTabelaClick(Sender: TObject);
begin
dbgBancos.Visible:=True;
end;

procedure TfrmCadBancos.btnVoltarClick(Sender: TObject);
begin
dbgBancos.Visible:=False;
end;

procedure TfrmCadBancos.edtNumBanco2Exit(Sender: TObject);
var
   Reg: TBookMark;
begin
if not Cancelado then
   begin
   if length(edtNumBanco2.Text)=0 then
      begin
      beep;
      MessageDlg('N�mero do Banco n�o pode estar vazio!',mtError,[mbOK],0);
      edtNumBanco2.SetFocus;
      end
   else
      begin
      reg:=DMInloco.tblBancos.GetBookmark;
      if DMInloco.tblBancos.FindKey([edtNumBanco2.Text]) then
         begin
         beep;
         MessageDlg('Banco j� cadastrado!',mtError,[mbOK],0);
         DMinloco.tblBancos.GotoBookmark(reg);
         DMinloco.tblBancos.FreeBookmark(reg);
         edtNumBanco2.SetFocus;
         end
      else
         begin
         DMinloco.tblBancos.GotoBookmark(reg);
         DMinloco.tblBancos.FreeBookmark(reg);
         DMInloco.tblBancos.Edit;
         DMInloco.tblBancosNum_Banco.Value:=StrToInt(edtNumBanco2.Text);
         edtNumBanco2.Text:='';
         edtNumBanco2.Visible:=False;
         end;
      end;
   end
end;

procedure TfrmCadBancos.edtNumBanco2KeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
