//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConsultarCtasTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfrmConsultarCtasTotal = class(TForm)
    DBGrid1: TDBGrid;
    btnPainel: TPanel;
    btnConsulta: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnDetalhes: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    lblPeriodo: TLabel;
    edtData1: TMaskEdit;
    lbla: TLabel;
    edtData2: TMaskEdit;
    lblValor: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarCtasTotal: TfrmConsultarCtasTotal;

implementation

uses untDMInloco;

{$R *.DFM}

procedure TfrmConsultarCtasTotal.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Action:=caFree;
end;



end.
