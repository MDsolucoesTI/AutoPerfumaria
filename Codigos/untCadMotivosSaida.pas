//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadMotivosSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask;

type
  TfrmCadMotivosSaida = class(TForm)
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
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotivosSaida: TfrmCadMotivosSaida;

implementation

uses untDMInloco;

{$R *.DFM}

procedure Escrita;
begin
frmCadMotivosSaida.btnPrimeiro.Enabled:=False;
frmCadMotivosSaida.btnAnterior.Enabled:=False;
frmCadMotivosSaida.btnProximo.Enabled:=False;
frmCadMotivosSaida.btnUltimo.Enabled:=False;
frmCadMotivosSaida.btnTabela.Enabled:=False;
frmCadMotivosSaida.btnVoltar.Enabled:=False;
frmCadMotivosSaida.btnIncluir.Enabled:=False;
frmCadMotivosSaida.btnSair.Enabled:=False;
frmCadMotivosSaida.btnConfirmar.Enabled:=True;
frmCadMotivosSaida.btnCancelar.Enabled:=True;
frmCadMotivosSaida.rdgClassMotivos.Enabled:=False;
frmCadMotivosSaida.edtMotivo.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadMotivosSaida.btnPrimeiro.Enabled:=True;
frmCadMotivosSaida.btnAnterior.Enabled:=True;
frmCadMotivosSaida.btnProximo.Enabled:=True;
frmCadMotivosSaida.btnUltimo.Enabled:=True;
frmCadMotivosSaida.btnConfirmar.Enabled:=False;
frmCadMotivosSaida.btnCancelar.Enabled:=False;
frmCadMotivosSaida.btnTabela.Enabled:=True;
frmCadMotivosSaida.btnVoltar.Enabled:=True;
frmCadMotivosSaida.btnIncluir.Enabled:=True;
frmCadMotivosSaida.btnSair.Enabled:=True;
frmCadMotivosSaida.rdgClassMotivos.Enabled:=True;
frmCadMotivosSaida.rdgClassMotivos.SetFocus;
end;



procedure TfrmCadMotivosSaida.FormShow(Sender: TObject);
begin
DMInloco.tblMotivosSaida.IndexName:='';
DMInloco.tblMotivosSaida.Open;
DMInloco.tblMotivosSaida.First;
SomenteLeitura;
rdgClassMotivos.ItemIndex:=0;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmCadMotivosSaida.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblMotivosSaida.IndexName:='';
DMInloco.tblMotivosSaida.Close;
Action:=caFree;
end;

procedure TfrmCadMotivosSaida.rdgClassMotivosClick(Sender: TObject);
begin
   Case rdgClassMotivos.ItemIndex of
      0: DMInloco.tblMotivosSaida.IndexName := '';
      1: DMInloco.tblMotivosSaida.IndexName := 'Motivo_Saida';
   end;
   SomenteLeitura;
end;

procedure TfrmCadMotivosSaida.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblMotivosSaida.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadMotivosSaida.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblMotivosSaida.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblMotivosSaida.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadMotivosSaida.btnProximoClick(Sender: TObject);
begin
DMInloco.tblMotivosSaida.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblMotivosSaida.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadMotivosSaida.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblMotivosSaida.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadMotivosSaida.btnIncluirClick(Sender: TObject);
var
   i,codigo:integer;
begin
dbgMotivos.Visible:=False;
Escrita;
DMInloco.tblMotivosSaida.IndexName:='';
DMInloco.tblMotivosSaida.Last;
codigo:=DMInloco.tblMotivosSaidaCod_Motivo.AsInteger;
DMInloco.tblMotivosSaida.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblMotivosSaidaCod_Motivo.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblMotivosSaida.Next;
   end;
DMInloco.tblMotivosSaida.Append;
DMInloco.tblMotivosSaidaCod_Motivo.AsInteger:=codigo+1;
end;

procedure TfrmCadMotivosSaida.btnConfirmarClick(Sender: TObject);
begin
if length(edtMotivo.Text)=0 then
   begin
   beep;
   MessageDlg('Descri��o do Motivo n�o pode estar vazia!',mtError,[mbOK],0);
   edtMotivo.SetFocus;
   end
else
   begin
   DMInloco.tblMotivosSaida.Post;
   if rdgClassMotivos.ItemIndex=1 then
      DMInloco.tblMotivosSaida.IndexName := 'Motivo_Saida';
   SomenteLeitura;
   if btnTabela.Down then
      dbgMotivos.Visible:=True;
   end;
end;

procedure TfrmCadMotivosSaida.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblMotivosSaida.Cancel;
if rdgClassMotivos.ItemIndex=1 then
   DMInloco.tblMotivosSaida.IndexName := 'Motivo_Saida';
SomenteLeitura;
if btnTabela.Down then
   dbgMotivos.Visible:=True;
end;

procedure TfrmCadMotivosSaida.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadMotivosSaida.btnTabelaClick(Sender: TObject);
begin
dbgMotivos.Visible:=True;
end;

procedure TfrmCadMotivosSaida.btnVoltarClick(Sender: TObject);
begin
dbgMotivos.Visible:=False;
end;

end.
