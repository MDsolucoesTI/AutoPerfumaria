//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocCategorias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocCategorias = class(TForm)
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
  frmLocCategorias: TfrmLocCategorias;

implementation

uses untDMInloco, untPropriedades, untPrincipal;

{$R *.DFM}


procedure TfrmLocCategorias.FormShow(Sender: TObject);
begin
DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
reg:=DMInloco.tblProdCategoria.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocCategorias.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmPropriedades.rdgClassCategorias.ItemIndex of
   0: DMInloco.tblProdCategoria.IndexName := '';
end;
DMInloco.tblProdCategoria.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocCategorias.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblProdCategoria.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocCategorias.btnOkClick(Sender: TObject);
begin
frmPropriedades.btnPrimeiro2.Enabled:=True;
frmPropriedades.btnAnterior2.Enabled:=True;
frmPropriedades.btnProximo2.Enabled:=True;
frmPropriedades.btnUltimo2.Enabled:=True;
Close;
end;

procedure TfrmLocCategorias.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblProdCategoria.GotoBookmark(reg);
Close;
end;

end.
