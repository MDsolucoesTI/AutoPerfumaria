//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocFornecedores = class(TForm)
    edtProcurar: TEdit;
    DBGrid1: TDBGrid;
    lblProcurar: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure edtProcurarChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocFornecedores: TfrmLocFornecedores;

implementation

uses untDMInloco, untCadFornecedores, untPrincipal;

{$R *.DFM}

procedure TfrmLocFornecedores.FormShow(Sender: TObject);
begin
DMInloco.tblFornecedores.IndexName:='Descr_Fornecedor';
reg:=DMInloco.tblFornecedores.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocFornecedores.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmCadFornecedores.rdgClassFornecedores.ItemIndex of
   0: DMInloco.tblFornecedores.IndexName := '';
end;
DMInloco.tblFornecedores.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocFornecedores.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblFornecedores.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocFornecedores.btnOkClick(Sender: TObject);
begin
frmCadFornecedores.btnPrimeiro.Enabled:=True;
frmCadFornecedores.btnAnterior.Enabled:=True;
frmCadFornecedores.btnProximo.Enabled:=True;
frmCadFornecedores.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocFornecedores.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblFornecedores.GotoBookmark(reg);
Close;
end;

end.
