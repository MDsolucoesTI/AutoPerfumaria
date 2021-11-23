//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TfrmLocBancos = class(TForm)
    edtProcurar: TEdit;
    DBGrid1: TDBGrid;
    lblProcurar: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure edtProcurarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocBancos: TfrmLocBancos;

implementation

uses untDMInloco, untCadBancos, untPrincipal;

{$R *.DFM}

procedure TfrmLocBancos.FormShow(Sender: TObject);
begin
DMInloco.tblBancos.IndexName:='Descr_Banco';
reg:=DMInloco.tblBancos.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocBancos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmCadBancos.rdgClassBancos.ItemIndex of
   0: DMInloco.tblBancos.IndexName := '';
end;
DMInloco.tblBancos.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocBancos.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblBancos.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocBancos.btnOkClick(Sender: TObject);
begin
frmCadBancos.btnPrimeiro.Enabled:=True;
frmCadBancos.btnAnterior.Enabled:=True;
frmCadBancos.btnProximo.Enabled:=True;
frmCadBancos.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocBancos.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblBancos.GotoBookmark(reg);
Close;
end;

end.
