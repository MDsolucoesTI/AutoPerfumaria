//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmLocProdutos = class(TForm)
    edtProcurar: TEdit;
    DBGrid1: TDBGrid;
    lblProcurar: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    rdgClassProdutos: TRadioGroup;
    cmbGrupo: TDBLookupComboBox;
    cmbCategoria: TDBLookupComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClassProdutosClick(Sender: TObject);
    procedure cmbCategoriaClick(Sender: TObject);
    procedure cmbGrupoClick(Sender: TObject);
    procedure edtProcurarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocProdutos: TfrmLocProdutos;

implementation

uses untDMInloco, untCadProdutos, untPrincipal, untCadEntradas, untCadSaidas;

{$R *.DFM}

procedure TfrmLocProdutos.FormShow(Sender: TObject);
begin
if OutrasEntradas or OutrasSaidas then
   begin
   DMInloco.tblProdutos.IndexName:='Descr_Prod';
   DMInloco.tblProdutos.First;
   rdgClassProdutos.ItemIndex:=1;
   edtProcurar.Visible:=True;
   edtProcurar.Width:=369;
   edtProcurar.MaxLength:=60;
   edtProcurar.SetFocus;
   end
else
   begin
   rdgClassProdutos.ItemIndex:=frmCadProdutos.rdgClassProdutos.ItemIndex;
   case rdgClassProdutos.ItemIndex of
      0: begin
         edtProcurar.Visible:=True;
         edtProcurar.Width:=89;
         edtProcurar.MaxLength:=13;
         edtProcurar.SetFocus;
         end;
      1: begin
         edtProcurar.Visible:=True;
         edtProcurar.Width:=369;
         edtProcurar.MaxLength:=60;
         edtProcurar.SetFocus;
         end;
      2: begin
         cmbGrupo.Visible:=True;
         cmbGrupo.SetFocus;
         end;
      3: begin
         cmbCategoria.Visible:=True;
         cmbCategoria.SetFocus;
         end;
      end;
   end;
reg:=DMInloco.tblProdutos.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocProdutos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if OutrasEntradas or OutrasSaidas then
   DMInloco.tblProdutos.IndexName := ''
else
   case frmCadProdutos.rdgClassProdutos.ItemIndex of
      0: DMInloco.tblProdutos.IndexName := '';
      1: DMInloco.tblProdutos.IndexName := 'Descr_Prod';
      2: DMInloco.tblProdutos.IndexName := 'Grupo_Prod';
      3: DMInloco.tblProdutos.IndexName := 'Categoria_Prod';
      end;
DMInloco.tblProdutos.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocProdutos.edtProcurarChange(Sender: TObject);
begin
   DMInloco.tblProdutos.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocProdutos.btnOkClick(Sender: TObject);
begin
if OutrasEntradas then
   begin
   DMInloco.tblOutrasEntradasCod_Produto.Value:=
   DMInloco.tblProdutosCod_Produto.Value;
   frmCadEntradas.txtProduto.Caption:=DMInloco.tblProdutosProduto.AsString;
   frmCadEntradas.cmbMotivo.SetFocus;
   end
else if OutrasSaidas then
   begin
   DMInloco.tblOutrasSaidasCod_Produto.Value:=
   DMInloco.tblProdutosCod_Produto.Value;
   frmCadSaidas.txtProduto.Caption:=DMInloco.tblProdutosProduto.AsString;
   frmCadSaidas.cmbMotivo.SetFocus;
   end
else
   begin
   frmCadProdutos.btnPrimeiro.Enabled:=True;
   frmCadProdutos.btnAnterior.Enabled:=True;
   frmCadProdutos.btnProximo.Enabled:=True;
   frmCadProdutos.btnUltimo.Enabled:=True;
   end;
Close;
end;

procedure TfrmLocProdutos.btnCancelarClick(Sender: TObject);
begin
if OutrasEntradas then
   frmCadEntradas.edtCodProduto.SetFocus
else if OutrasSaidas then
   frmCadSaidas.edtCodProduto.SetFocus;
DMInloco.tblProdutos.GotoBookmark(reg);
Close;
end;

procedure TfrmLocProdutos.rdgClassProdutosClick(Sender: TObject);
begin
edtProcurar.Visible:=False;
cmbGrupo.Visible:=False;
cmbCategoria.Visible:=False;
case rdgClassProdutos.ItemIndex of
   0: begin
      DMInloco.tblProdutos.IndexName:='';
      edtProcurar.Visible:=True;
      edtProcurar.Width:= 89;
      edtProcurar.MaxLength:=13;
      edtProcurar.SetFocus;
      end;
   1: begin
      DMInloco.tblProdutos.IndexName:='Descr_Prod';
      edtProcurar.Visible:=True;
      edtProcurar.Width:=369;
      edtProcurar.MaxLength:=60;
      edtProcurar.SetFocus;
      end;
   2: begin
      DMInloco.tblProdutos.IndexName:='Grupo_Prod';
      cmbGrupo.Visible:=True;
      cmbGrupo.SetFocus;
      end;
   3: begin
      DMInloco.tblProdutos.IndexName:='Categoria_Prod';
      cmbCategoria.Visible:=True;
      cmbCategoria.SetFocus;
      end;
   end;
end;

procedure TfrmLocProdutos.cmbCategoriaClick(Sender: TObject);
begin
if not DMInloco.tblProdutos.FindKey([DMInloco.tblProdCategoriaCod_Categoria])
   then
   begin
   beep;
   MessageDlg('N�o h� produto cadastrado com essa categoria!',mtInformation,
    [mbOK],0);
   cmbCategoria.SetFocus;
   end;
end;

procedure TfrmLocProdutos.cmbGrupoClick(Sender: TObject);
begin
if not DMInloco.tblProdutos.FindKey([DMInloco.tblProdGrupoCod_Grupo])
   then
   begin
   beep;
   MessageDlg('N�o h� produto cadastrado nesse grupo!',mtInformation,
    [mbOK],0);
   cmbGrupo.SetFocus;
   end;
end;

procedure TfrmLocProdutos.edtProcurarKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

end.
