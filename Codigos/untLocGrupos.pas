//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocGrupos = class(TForm)
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
  frmLocGrupos: TfrmLocGrupos;

implementation

uses untDMInloco, untPropriedades, untPrincipal;

{$R *.DFM}

procedure TfrmLocGrupos.FormShow(Sender: TObject);
begin
DMInloco.tblProdGrupo.IndexName:='Descr_Grupo';
reg:=DMInloco.tblProdGrupo.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocGrupos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Case frmPropriedades.rdgClassGrupos.ItemIndex of
   0: DMInloco.tblProdGrupo.IndexName := '';
end;
DMInloco.tblProdGrupo.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocGrupos.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblProdGrupo.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocGrupos.btnOkClick(Sender: TObject);
begin
frmPropriedades.btnPrimeiro1.Enabled:=True;
frmPropriedades.btnAnterior1.Enabled:=True;
frmPropriedades.btnProximo1.Enabled:=True;
frmPropriedades.btnUltimo1.Enabled:=True;
Close;
end;

procedure TfrmLocGrupos.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblProdGrupo.GotoBookmark(reg);
Close;
end;

end.
