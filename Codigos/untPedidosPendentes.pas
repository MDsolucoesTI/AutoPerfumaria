//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untPedidosPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmPedidosPendentes = class(TForm)
    grdPedidosPendentes: TDBGrid;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnDetalhes: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    PrintDialog: TPrintDialog;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDetalhesClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosPendentes: TfrmPedidosPendentes;
  Consulta:Boolean;

implementation

uses untDMInloco, untCadPedidos, untRptPedidosPendentes;

{$R *.DFM}

procedure TfrmPedidosPendentes.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPedidosPendentes.FormShow(Sender: TObject);
begin
DMInloco.tblPedidos.Filter:='Data_Recebimento=Null';
DMInloco.tblPedidos.Open;
DMInloco.tblPedidos.Filtered:=True;
Consulta:=True;
end;

procedure TfrmPedidosPendentes.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
DMInloco.tblPedidos.Close;
DMInloco.tblPedidos.Filtered:=False;
Consulta:=False;
end;

procedure TfrmPedidosPendentes.btnDetalhesClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadPedidos, frmCadPedidos);
frmCadPedidos.ShowModal;
end;

procedure TfrmPedidosPendentes.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblPedidos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmPedidosPendentes.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblPedidos.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblPedidos.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmPedidosPendentes.btnProximoClick(Sender: TObject);
begin
DMInloco.tblPedidos.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblPedidos.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmPedidosPendentes.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblPedidos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmPedidosPendentes.btnImprimirClick(Sender: TObject);
begin
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptPedidosPendentes, rptPedidosPendentes);
   rptPedidosPendentes.relPedidos.PrinterSettings.Copies:=PrintDialog.Copies;
   rptPedidosPendentes.relPedidos.Print;
   end;}
Application.CreateForm(TrptPedidosPendentes, rptPedidosPendentes);
rptPedidosPendentes.relPedidos.Preview;
end;

end.
