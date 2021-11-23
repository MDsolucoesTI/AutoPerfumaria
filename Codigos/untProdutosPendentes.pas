//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untProdutosPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmProdutosPendentes = class(TForm)
    grdProdutosPendentes: TDBGrid;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosPendentes: TfrmProdutosPendentes;

implementation

uses untDMInloco, untRptProdutosPendentes;

{$R *.DFM}

procedure TfrmProdutosPendentes.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmProdutosPendentes.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.queProdutosPendentes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmProdutosPendentes.btnAnteriorClick(Sender: TObject);
begin
DMInloco.queProdutosPendentes.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.queProdutosPendentes.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmProdutosPendentes.btnProximoClick(Sender: TObject);
begin
DMInloco.queProdutosPendentes.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.queProdutosPendentes.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmProdutosPendentes.btnUltimoClick(Sender: TObject);
begin
DMInloco.queProdutosPendentes.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmProdutosPendentes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.queProdutosPendentes.Close;
Action:=caFree;
end;

procedure TfrmProdutosPendentes.FormShow(Sender: TObject);
begin
DMInloco.queProdutosPendentes.Active:=False;
DMInloco.queProdutosPendentes.Active:=True;
DMInloco.queProdutosPendentes.Open;
DMInloco.queProdutosPendentes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
end;

procedure TfrmProdutosPendentes.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptProdutosPendentes, rptProdutosPendentes);
   rptProdutosPendentes.relPedidos.PrinterSettings.Copies:=PrintDialog.Copies;
   rptProdutosPendentes.relPedidos.Print;
   end;}
   Application.CreateForm(TrptProdutosPendentes, rptProdutosPendentes);
   rptProdutosPendentes.relPedidos.Preview;
end;

end.
