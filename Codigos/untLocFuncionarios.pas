//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocFuncionarios = class(TForm)
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
  frmLocFuncionarios: TfrmLocFuncionarios;

implementation

uses untDMInloco, untCadFuncionarios, untPrincipal;

{$R *.DFM}

procedure TfrmLocFuncionarios.FormShow(Sender: TObject);
begin
DMInloco.tblFuncionarios.IndexName:='Apelido_Funcionario';
reg:=DMInloco.tblFuncionarios.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocFuncionarios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmCadFuncionarios.rdgClassFuncionarios.ItemIndex of
   0: DMInloco.tblFuncionarios.IndexName := '';
   2: DMInloco.tblFuncionarios.IndexName := 'Apelido_Funcionario';
end;
DMInloco.tblFuncionarios.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocFuncionarios.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblFuncionarios.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocFuncionarios.btnOkClick(Sender: TObject);
begin
frmCadFuncionarios.btnPrimeiro.Enabled:=True;
frmCadFuncionarios.btnAnterior.Enabled:=True;
frmCadFuncionarios.btnProximo.Enabled:=True;
frmCadFuncionarios.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocFuncionarios.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblFuncionarios.GotoBookmark(reg);
Close;
end;

end.
