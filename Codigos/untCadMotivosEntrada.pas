//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadMotivosEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmCadMotivosEntrada = class(TForm)
    lblCodMotivo: TLabel;
    lblMotivo: TLabel;
    edtMotivo: TDBEdit;
    txtCodMotivo: TDBText;
    Panel2: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnTabela: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    btnVoltar: TSpeedButton;
    rdgClassMotivos: TRadioGroup;
    Bevel1: TBevel;
    dbgMotivos: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClassMotivosClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotivosEntrada: TfrmCadMotivosEntrada;

implementation

uses untDMInloco;

{$R *.DFM}

procedure Escrita;
begin
frmCadMotivosEntrada.btnPrimeiro.Enabled:=False;
frmCadMotivosEntrada.btnAnterior.Enabled:=False;
frmCadMotivosEntrada.btnProximo.Enabled:=False;
frmCadMotivosEntrada.btnUltimo.Enabled:=False;
frmCadMotivosEntrada.btnTabela.Enabled:=False;
frmCadMotivosEntrada.btnVoltar.Enabled:=False;
frmCadMotivosEntrada.btnIncluir.Enabled:=False;
frmCadMotivosEntrada.btnSair.Enabled:=False;
frmCadMotivosEntrada.btnConfirmar.Enabled:=True;
frmCadMotivosEntrada.btnCancelar.Enabled:=True;
frmCadMotivosEntrada.rdgClassMotivos.Enabled:=False;
frmCadMotivosEntrada.edtMotivo.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadMotivosEntrada.btnPrimeiro.Enabled:=True;
frmCadMotivosEntrada.btnAnterior.Enabled:=True;
frmCadMotivosEntrada.btnProximo.Enabled:=True;
frmCadMotivosEntrada.btnUltimo.Enabled:=True;
frmCadMotivosEntrada.btnConfirmar.Enabled:=False;
frmCadMotivosEntrada.btnCancelar.Enabled:=False;
frmCadMotivosEntrada.btnTabela.Enabled:=True;
frmCadMotivosEntrada.btnVoltar.Enabled:=True;
frmCadMotivosEntrada.btnIncluir.Enabled:=True;
frmCadMotivosEntrada.btnSair.Enabled:=True;
frmCadMotivosEntrada.rdgClassMotivos.Enabled:=True;
frmCadMotivosEntrada.rdgClassMotivos.SetFocus;
end;


procedure TfrmCadMotivosEntrada.FormShow(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.IndexName:='';
DMInloco.tblMotivosEntrada.Open;
DMInloco.tblMotivosEntrada.First;
SomenteLeitura;
rdgClassMotivos.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadMotivosEntrada.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblMotivosEntrada.IndexName:='';
DMInloco.tblMotivosEntrada.Close;
Action:=caFree;
end;

procedure TfrmCadMotivosEntrada.rdgClassMotivosClick(Sender: TObject);
begin
   Case rdgClassMotivos.ItemIndex of
      0: DMInloco.tblMotivosEntrada.IndexName := '';
      1: DMInloco.tblMotivosEntrada.IndexName := 'Motivo_Entrada';
   end;
   SomenteLeitura;
end;

procedure TfrmCadMotivosEntrada.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadMotivosEntrada.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblMotivosEntrada.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadMotivosEntrada.btnProximoClick(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblMotivosEntrada.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadMotivosEntrada.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadMotivosEntrada.btnIncluirClick(Sender: TObject);
var
   i,codigo:integer;
begin
dbgMotivos.Visible:=False;
Escrita;
DMInloco.tblMotivosEntrada.IndexName:='';
DMInloco.tblMotivosEntrada.Last;
codigo:=DMInloco.tblMotivosEntradaCod_Motivo.AsInteger;
DMInloco.tblMotivosEntrada.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblMotivosEntradaCod_Motivo.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblMotivosEntrada.Next;
   end;
DMInloco.tblMotivosEntrada.Append;
DMInloco.tblMotivosEntradaCod_Motivo.AsInteger:=codigo+1;
end;

procedure TfrmCadMotivosEntrada.btnConfirmarClick(Sender: TObject);
begin
if length(edtMotivo.Text)=0 then
   begin
   beep;
   MessageDlg('Descri��o do Motivo n�o pode estar vazia!',mtError,[mbOK],0);
   edtMotivo.SetFocus;
   end
else
   begin
   DMInloco.tblMotivosEntrada.Post;
   if rdgClassMotivos.ItemIndex=1 then
      DMInloco.tblMotivosEntrada.IndexName := 'Motivo_Entrada';
   SomenteLeitura;
   if btnTabela.Down then
      dbgMotivos.Visible:=True;
   end;
end;

procedure TfrmCadMotivosEntrada.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblMotivosEntrada.Cancel;
if rdgClassMotivos.ItemIndex=1 then
   DMInloco.tblMotivosEntrada.IndexName := 'Motivo_Entrada';
SomenteLeitura;
if btnTabela.Down then
   dbgMotivos.Visible:=True;
end;

procedure TfrmCadMotivosEntrada.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadMotivosEntrada.btnTabelaClick(Sender: TObject);
begin
dbgMotivos.Visible:=True;
end;

procedure TfrmCadMotivosEntrada.btnVoltarClick(Sender: TObject);
begin
dbgMotivos.Visible:=False;
end;

end.
