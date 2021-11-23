//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocConvenios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocConvenios = class(TForm)
    edtProcurar: TEdit;
    DBGrid1: TDBGrid;
    lblProcurar: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocConvenios: TfrmLocConvenios;

implementation

uses untDMInloco, untCadConvenios, untPrincipal;

{$R *.DFM}

procedure TfrmLocConvenios.FormShow(Sender: TObject);
begin
DMInloco.tblConvenios.IndexName:='Descr_Convenio';
reg:=DMInloco.tblConvenios.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocConvenios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmCadConvenios.rdgClassConvenios.ItemIndex of
   0: DMInloco.tblConvenios.IndexName := '';
end;
DMInloco.tblConvenios.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocConvenios.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblConvenios.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocConvenios.btnOkClick(Sender: TObject);
begin
frmCadConvenios.btnPrimeiro.Enabled:=True;
frmCadConvenios.btnAnterior.Enabled:=True;
frmCadConvenios.btnProximo.Enabled:=True;
frmCadConvenios.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocConvenios.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblConvenios.GotoBookmark(reg);
Close;
end;

end.
