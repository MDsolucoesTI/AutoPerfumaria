//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocProfissoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocProfissoes = class(TForm)
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
  frmLocProfissoes: TfrmLocProfissoes;

implementation

uses untDMInloco, untCadProfissoes, untPrincipal;

{$R *.DFM}

procedure TfrmLocProfissoes.FormShow(Sender: TObject);
begin
DMInloco.tblCliProfissoes.IndexName:='Descr_Profissao';
reg:=DMInloco.tblCliProfissoes.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocProfissoes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmCadProfissoes.rdgClassProfissoes.ItemIndex of
   0: DMInloco.tblCliProfissoes.IndexName := '';
end;
DMInloco.tblCliProfissoes.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocProfissoes.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblCliProfissoes.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocProfissoes.btnOkClick(Sender: TObject);
begin
frmCadProfissoes.btnPrimeiro.Enabled:=True;
frmCadProfissoes.btnAnterior.Enabled:=True;
frmCadProfissoes.btnProximo.Enabled:=True;
frmCadProfissoes.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocProfissoes.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblCliProfissoes.GotoBookmark(reg);
Close;
end;

end.
