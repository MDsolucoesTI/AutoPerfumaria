//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untAlterarPrecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfrmAlterarPrecos = class(TForm)
    btnPainel: TPanel;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    dbgProdutos: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    imgGrupo: TDBImage;
    Bevel1: TBevel;
    edtPreco1: TEdit;
    edtPreco2: TEdit;
    cmbCategorias: TDBLookupComboBox;
    cmbGrupos: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPreco1KeyPress(Sender: TObject; var Key: Char);
    procedure edtPreco2KeyPress(Sender: TObject; var Key: Char);
    procedure cmbCategoriasClick(Sender: TObject);
    procedure cmbGruposClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarPrecos: TfrmAlterarPrecos;

implementation

uses untDMInloco;

{$R *.DFM}

procedure TfrmAlterarPrecos.FormShow(Sender: TObject);
begin
DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
DMInloco.tblProdGrupo.IndexName:='Descr_Grupo';
DMInloco.tblProdutos.IndexName:='Descr_Prod';
DMInloco.tblProdCategoria.Open;
DMInloco.tblProdGrupo.Open;
DMInloco.tblProdutos.Open;
DMInloco.tblProdCategoria.First;
DMInloco.tblProdGrupo.First;
DMInloco.tblProdutos.Filter:=
'Cod_Categoria='+DMInloco.tblProdCategoriaCod_Categoria.AsString+
' and Cod_Grupo='+DMInloco.tblProdGrupoCod_Grupo.AsString;
DMInloco.tblProdutos.Filtered:=True;
imgGrupo.Picture.LoadFromFile('c:\Projetos\autocomer\Paris.bmp');
edtPreco1.Text:='';
edtPreco2.Text:='';
cmbCategorias.SetFocus;
end;

procedure TfrmAlterarPrecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMInloco.tblProdCategoria.IndexName:='';
DMInloco.tblProdGrupo.IndexName:='';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblProdutos.Filtered:=False;
DMInloco.tblProdCategoria.Close;
DMInloco.tblProdGrupo.Close;
DMInloco.tblProdutos.Close;
Action:=caFree;
end;

procedure TfrmAlterarPrecos.edtPreco1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9' , ',' , #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmAlterarPrecos.edtPreco2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9' , ',' , #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmAlterarPrecos.cmbCategoriasClick(Sender: TObject);
begin
DMInloco.tblProdutos.Filtered:=False;
DMInloco.tblProdutos.Filter:=
'Cod_Categoria='+DMInloco.tblProdCategoriaCod_Categoria.AsString+
' and Cod_Grupo='+DMInloco.tblProdGrupoCod_Grupo.AsString;
DMInloco.tblProdutos.Filtered:=True;
end;

procedure TfrmAlterarPrecos.cmbGruposClick(Sender: TObject);
begin
DMInloco.tblProdutos.Filtered:=False;
DMInloco.tblProdutos.Filter:=
'Cod_Categoria='+DMInloco.tblProdCategoriaCod_Categoria.AsString+
' and Cod_Grupo='+DMInloco.tblProdGrupoCod_Grupo.AsString;
DMInloco.tblProdutos.Filtered:=True;
if DMInloco.tblProdGrupoFoto_Produto.IsNull then
   imgGrupo.Picture.LoadFromFile('c:\Meus documentos\Tgi\Imagens\Paris.bmp')
else
   imgGrupo.DataField:='Foto_Produto';
end;

procedure TfrmAlterarPrecos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmAlterarPrecos.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblProdutos.First;
While not DMInloco.tblProdutos.EOF do
   begin
   DMInloco.tblProdutos.Edit;
   if length(edtPreco1.Text)>0 then
      if StrToFloat(edtPreco1.Text)>0 then
      DMInloco.tblProdutosPreco_Venda.Value:=StrToFloat(edtPreco1.Text)
      else
      DMInloco.tblProdutosPreco_Venda.Clear;
   if length(edtPreco2.Text)>0 then
      if StrToFloat(edtPreco2.Text)>0 then
      DMInloco.tblProdutosPreco_Promocao.Value:=StrToFloat(edtPreco2.Text)
      else
      DMInloco.tblProdutosPreco_Promocao.Clear;
   DMInloco.tblProdutos.Post;
   DMInloco.tblProdutos.Next;
   end;
DMInloco.tblProdutos.First;
edtPreco1.Text:='';
edtPreco2.Text:='';
end;

end.
