//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untImprimirPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmImprimirPedidos = class(TForm)
    grdPedidos: TDBGrid;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    rdgClassPedidos: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClassPedidosClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimirPedidos: TfrmImprimirPedidos;

implementation

uses untDMInloco;

{$R *.DFM}



procedure TfrmImprimirPedidos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmImprimirPedidos.FormShow(Sender: TObject);
begin
DMInloco.tblPedidos.Open;
DMInloco.tblPedidos.IndexName:='';
end;

procedure TfrmImprimirPedidos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblPedidos.Close;
Action:=caFree;
end;

procedure TfrmImprimirPedidos.rdgClassPedidosClick(Sender: TObject);
begin
Case rdgClassPedidos.ItemIndex of
   0: DMInloco.tblPedidos.IndexName:='';
   1: DMInloco.tblPedidos.IndexName:='Cod_Fornecedor';
   end;
end;

procedure TfrmImprimirPedidos.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblPedidos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmImprimirPedidos.btnAnteriorClick(Sender: TObject);
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

procedure TfrmImprimirPedidos.btnProximoClick(Sender: TObject);
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

procedure TfrmImprimirPedidos.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblPedidos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

end.
