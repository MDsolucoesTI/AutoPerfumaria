//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocCartoesCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocCartoesCredito = class(TForm)
    edtProcurar: TEdit;
    DBGrid1: TDBGrid;
    lblProcurar: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCartoesCredito: TfrmLocCartoesCredito;

implementation

uses untDMInloco, untCadCartoesCredito, untPrincipal;

{$R *.DFM}

procedure TfrmLocCartoesCredito.FormShow(Sender: TObject);
begin
DMInloco.tblCartoesCredito.IndexName:='Descr_Cartao';
reg:=DMInloco.tblCartoesCredito.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocCartoesCredito.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmCadCartoesCredito.rdgClassCartoesCredito.ItemIndex of
   0: DMInloco.tblCartoesCredito.IndexName := '';
end;
DMInloco.tblCartoesCredito.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocCartoesCredito.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblCartoesCredito.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocCartoesCredito.btnOkClick(Sender: TObject);
begin
frmCadCartoesCredito.btnPrimeiro.Enabled:=True;
frmCadCartoesCredito.btnAnterior.Enabled:=True;
frmCadCartoesCredito.btnProximo.Enabled:=True;
frmCadCartoesCredito.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocCartoesCredito.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblCartoesCredito.GotoBookmark(reg);
Close;
end;

end.
