//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untPropriedades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TfrmPropriedades = class(TForm)
    pgcPropriedades: TPageControl;
    pgcGrupo: TTabSheet;
    pgcCategoria: TTabSheet;
    lblCodCategoria: TLabel;
    lblCategoria: TLabel;
    lblMargemLucro: TLabel;
    lblDifPermitida: TLabel;
    lblCodGrupo: TLabel;
    lblGrupo: TLabel;
    lblFoto: TLabel;
    btnFoto: TButton;
    Bevel1: TBevel;
    rdgClassGrupos: TRadioGroup;
    btnPainel2: TPanel;
    btnPrimeiro2: TSpeedButton;
    btnAnterior2: TSpeedButton;
    btnProximo2: TSpeedButton;
    btnUltimo2: TSpeedButton;
    btnTabela2: TSpeedButton;
    btnLocalizar2: TSpeedButton;
    btnEditar2: TSpeedButton;
    btnExcluir2: TSpeedButton;
    btnIncluir2: TSpeedButton;
    btnConfirmar2: TSpeedButton;
    btnCancelar2: TSpeedButton;
    btnSair2: TSpeedButton;
    btnPainel1: TPanel;
    btnPrimeiro1: TSpeedButton;
    btnAnterior1: TSpeedButton;
    btnProximo1: TSpeedButton;
    btnUltimo1: TSpeedButton;
    btnTabela1: TSpeedButton;
    btnLocalizar1: TSpeedButton;
    btnEditar1: TSpeedButton;
    btnExcluir1: TSpeedButton;
    btnIncluir1: TSpeedButton;
    btnConfirmar1: TSpeedButton;
    btnCancelar1: TSpeedButton;
    btnSair1: TSpeedButton;
    txtCodCategoria: TDBText;
    edtCategoria: TDBEdit;
    edtMargemLucro: TDBEdit;
    edtDifPermitida: TDBEdit;
    edtGrupo: TDBEdit;
    txtCodGrupo: TDBText;
    imgGrupo: TDBImage;
    Bevel2: TBevel;
    rdgClassCategorias: TRadioGroup;
    btnVoltar1: TSpeedButton;
    btnVoltar2: TSpeedButton;
    dbgGrupos: TDBGrid;
    dbgCategorias: TDBGrid;
    procedure btnPrimeiro1Click(Sender: TObject);
    procedure btnPrimeiro2Click(Sender: TObject);
    procedure btnAnterior2Click(Sender: TObject);
    procedure btnAnterior1Click(Sender: TObject);
    procedure btnProximo1Click(Sender: TObject);
    procedure btnProximo2Click(Sender: TObject);
    procedure btnUltimo2Click(Sender: TObject);
    procedure btnUltimo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClassGruposClick(Sender: TObject);
    procedure rdgClassCategoriasClick(Sender: TObject);
    procedure btnExcluir1Click(Sender: TObject);
    procedure btnExcluir2Click(Sender: TObject);
    procedure btnEditar1Click(Sender: TObject);
    procedure btnEditar2Click(Sender: TObject);
    procedure btnIncluir2Click(Sender: TObject);
    procedure btnConfirmar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnSair2Click(Sender: TObject);
    procedure btnSair1Click(Sender: TObject);
    procedure btnIncluir1Click(Sender: TObject);
    procedure btnConfirmar1Click(Sender: TObject);
    procedure btnCancelar1Click(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure pgcCategoriaEnter(Sender: TObject);
    procedure pgcGrupoEnter(Sender: TObject);
    procedure btnLocalizar1Click(Sender: TObject);
    procedure btnLocalizar2Click(Sender: TObject);
    procedure btnTabela1Click(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnTabela2Click(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure edtMargemLucroKeyPress(Sender: TObject; var Key: Char);
    procedure edtDifPermitidaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropriedades: TfrmPropriedades;

implementation

uses untDMInloco, untLocGrupos, untLocCategorias, untLocFotos,
  untCadProdutos;

{$R *.DFM}

procedure Escrita1;
begin
frmPropriedades.pgcCategoria.Enabled:=False;
frmPropriedades.btnPrimeiro1.Enabled:=False;
frmPropriedades.btnAnterior1.Enabled:=False;
frmPropriedades.btnProximo1.Enabled:=False;
frmPropriedades.btnUltimo1.Enabled:=False;
frmPropriedades.btnTabela1.Enabled:=False;
frmPropriedades.btnVoltar1.Enabled:=False;
frmPropriedades.btnLocalizar1.Enabled:=False;
frmPropriedades.btnEditar1.Enabled:=False;
frmPropriedades.btnExcluir1.Enabled:=False;
frmPropriedades.btnIncluir1.Enabled:=False;
frmPropriedades.btnSair1.Enabled:=False;
frmPropriedades.btnConfirmar1.Enabled:=True;
frmPropriedades.btnCancelar1.Enabled:=True;
frmPropriedades.btnFoto.Enabled:=True;
frmPropriedades.edtGrupo.SetFocus;
frmPropriedades.rdgClassGrupos.Enabled:=False;
end;

procedure SomenteLeitura1;
begin
frmPropriedades.pgcCategoria.Enabled:=True;
frmPropriedades.btnPrimeiro1.Enabled:=True;
frmPropriedades.btnAnterior1.Enabled:=True;
frmPropriedades.btnProximo1.Enabled:=True;
frmPropriedades.btnUltimo1.Enabled:=True;
frmPropriedades.btnConfirmar1.Enabled:=False;
frmPropriedades.btnCancelar1.Enabled:=False;
frmPropriedades.btnTabela1.Enabled:=True;
frmPropriedades.btnVoltar1.Enabled:=True;
frmPropriedades.btnLocalizar1.Enabled:=True;
frmPropriedades.btnEditar1.Enabled:=True;
frmPropriedades.btnExcluir1.Enabled:=True;
frmPropriedades.btnIncluir1.Enabled:=True;
frmPropriedades.btnSair1.Enabled:=True;
frmPropriedades.btnFoto.Enabled:=False;
frmPropriedades.rdgClassGrupos.Enabled:=True;
frmPropriedades.rdgClassGrupos.SetFocus;
end;

procedure Escrita2;
begin
frmPropriedades.pgcGrupo.Enabled:=False;
frmPropriedades.btnPrimeiro2.Enabled:=False;
frmPropriedades.btnAnterior2.Enabled:=False;
frmPropriedades.btnProximo2.Enabled:=False;
frmPropriedades.btnUltimo2.Enabled:=False;
frmPropriedades.btnTabela2.Enabled:=False;
frmPropriedades.btnVoltar2.Enabled:=False;
frmPropriedades.btnLocalizar2.Enabled:=False;
frmPropriedades.btnEditar2.Enabled:=False;
frmPropriedades.btnExcluir2.Enabled:=False;
frmPropriedades.btnIncluir2.Enabled:=False;
frmPropriedades.btnSair2.Enabled:=False;
frmPropriedades.btnConfirmar2.Enabled:=True;
frmPropriedades.btnCancelar2.Enabled:=True;
frmPropriedades.rdgClassCategorias.Enabled:=False;
frmPropriedades.edtCategoria.SetFocus;
end;

procedure SomenteLeitura2;
begin
frmPropriedades.pgcGrupo.Enabled:=True;
frmPropriedades.btnPrimeiro2.Enabled:=True;
frmPropriedades.btnAnterior2.Enabled:=True;
frmPropriedades.btnProximo2.Enabled:=True;
frmPropriedades.btnUltimo2.Enabled:=True;
frmPropriedades.btnConfirmar2.Enabled:=False;
frmPropriedades.btnCancelar2.Enabled:=False;
frmPropriedades.btnTabela2.Enabled:=True;
frmPropriedades.btnVoltar2.Enabled:=True;
frmPropriedades.btnLocalizar2.Enabled:=True;
frmPropriedades.btnEditar2.Enabled:=True;
frmPropriedades.btnExcluir2.Enabled:=True;
frmPropriedades.btnIncluir2.Enabled:=True;
frmPropriedades.btnSair2.Enabled:=True;
frmPropriedades.rdgClassCategorias.Enabled:=True;
if frmPropriedades.pgcPropriedades.ActivePage=frmPropriedades.PgcCategoria then
   frmPropriedades.rdgClassCategorias.SetFocus;
end;

procedure TfrmPropriedades.FormShow(Sender: TObject);
begin
DMInloco.tblProdGrupo.IndexName:='';
DMInloco.tblProdCategoria.IndexName:='';
DMInloco.tblProdGrupo.Open;
DMInloco.tblProdCategoria.Open;
DMInloco.tblProdGrupo.First;
DMInloco.tblProdCategoria.First;
pgcPropriedades.ActivePage:=PgcGrupo;
SomenteLeitura1;
SomenteLeitura2;
rdgClassGrupos.ItemIndex:=0;
rdgClassCategorias.ItemIndex:=0;
pgcGrupo.Enabled:=True;
pgcCategoria.Enabled:=True;
btnPrimeiro1.Enabled:=False;
btnAnterior1.Enabled:=False;
btnPrimeiro2.Enabled:=False;
btnAnterior2.Enabled:=False;
end;

procedure TfrmPropriedades.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if not Produto then
   begin
   DMInloco.tblProdGrupo.IndexName:='';
   DMInloco.tblProdCategoria.IndexName:='';
   DMInloco.tblProdGrupo.Close;
   DMInloco.tblProdCategoria.Close;
   end
else
   begin
   DMInloco.tblProdGrupo.IndexName:='Descr_Grupo';
   DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
   end;
Action:=caFree;
end;

procedure TfrmPropriedades.pgcCategoriaEnter(Sender: TObject);
begin
rdgClassCategorias.SetFocus;
end;

procedure TfrmPropriedades.pgcGrupoEnter(Sender: TObject);
begin
rdgClassGrupos.SetFocus;
end;

procedure TfrmPropriedades.rdgClassGruposClick(Sender: TObject);
begin
   Case rdgClassGrupos.ItemIndex of
      0: DMInloco.tblProdGrupo.IndexName := '';
      1: DMInloco.tblProdGrupo.IndexName := 'Descr_Grupo';
   end;
end;

procedure TfrmPropriedades.rdgClassCategoriasClick(Sender: TObject);
begin
   Case rdgClassCategorias.ItemIndex of
      0: DMInloco.tblProdCategoria.IndexName := '';
      1: DMInloco.tblProdCategoria.IndexName := 'Descr_Categoria';
   end;
end;

procedure TfrmPropriedades.btnPrimeiro1Click(Sender: TObject);
begin
DMInloco.tblProdGrupo.First;
btnPrimeiro1.Enabled:=False;
btnAnterior1.Enabled:=False;
btnProximo1.Enabled:=True;
btnUltimo1.Enabled:=True;
end;

procedure TfrmPropriedades.btnPrimeiro2Click(Sender: TObject);
begin
DMInloco.tblProdCategoria.First;
btnPrimeiro2.Enabled:=False;
btnAnterior2.Enabled:=False;
btnProximo2.Enabled:=True;
btnUltimo2.Enabled:=True;
end;

procedure TfrmPropriedades.btnAnterior1Click(Sender: TObject);
begin
DMInloco.tblProdGrupo.Prior;
btnProximo1.Enabled:=True;
btnUltimo1.Enabled:=True;
if DMInloco.tblProdGrupo.BOF then
   begin
   btnPrimeiro1.Enabled:=False;
   btnAnterior1.Enabled:=False;
   end;
end;

procedure TfrmPropriedades.btnAnterior2Click(Sender: TObject);
begin
DMInloco.tblProdCategoria.Prior;
btnProximo2.Enabled:=True;
btnUltimo2.Enabled:=True;
if DMInloco.tblProdCategoria.BOF then
   begin
   btnPrimeiro2.Enabled:=False;
   btnAnterior2.Enabled:=False;
   end;
end;

procedure TfrmPropriedades.btnProximo1Click(Sender: TObject);
begin
DMInloco.tblProdGrupo.Next;
btnPrimeiro1.Enabled:=True;
btnAnterior1.Enabled:=True;
if DMInloco.tblProdGrupo.EOF then
   begin
   btnProximo1.Enabled:=False;
   btnUltimo1.Enabled:=False;
   end;
end;

procedure TfrmPropriedades.btnProximo2Click(Sender: TObject);
begin
DMInloco.tblProdCategoria.Next;
btnPrimeiro2.Enabled:=True;
btnAnterior2.Enabled:=True;
if DMInloco.tblProdCategoria.EOF then
   begin
   btnProximo2.Enabled:=False;
   btnUltimo2.Enabled:=False;
   end;
end;

procedure TfrmPropriedades.btnUltimo1Click(Sender: TObject);
begin
DMInloco.tblProdGrupo.Last;
btnPrimeiro1.Enabled:=True;
btnAnterior1.Enabled:=True;
btnProximo1.Enabled:=False;
btnUltimo1.Enabled:=False;
end;

procedure TfrmPropriedades.btnUltimo2Click(Sender: TObject);
begin
DMInloco.tblProdCategoria.Last;
btnPrimeiro2.Enabled:=True;
btnAnterior2.Enabled:=True;
btnProximo2.Enabled:=False;
btnUltimo2.Enabled:=False;
end;

procedure TfrmPropriedades.btnEditar1Click(Sender: TObject);
begin
edtGrupo.SetFocus;
dbgGrupos.Visible:=False;
Escrita1;
DMInloco.tblProdGrupo.Edit;
end;

procedure TfrmPropriedades.btnEditar2Click(Sender: TObject);
begin
edtCategoria.SetFocus;
dbgCategorias.Visible:=False;
Escrita2;
DMInloco.tblProdCategoria.Edit;
end;

procedure TfrmPropriedades.btnExcluir1Click(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Grupo?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblProdGrupo.Delete;
end;

procedure TfrmPropriedades.btnExcluir2Click(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir essa Categoria?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblProdCategoria.Delete;
end;

procedure TfrmPropriedades.btnIncluir1Click(Sender: TObject);
var
   codigo:integer;
begin
DMInloco.tblProdGrupo.IndexName:='';
DMInloco.tblProdGrupo.Last;
codigo:=DMInloco.tblProdGrupoCod_Grupo.Value;
DMInloco.tblProdGrupo.Append;
DMInloco.tblProdGrupoCod_Grupo.Value:=codigo+1;
Escrita1;
dbgGrupos.Visible:=False;
end;

procedure TfrmPropriedades.btnIncluir2Click(Sender: TObject);
var
i,codigo:integer;
begin
edtCategoria.SetFocus;
dbgCategorias.Visible:=False;
Escrita2;
DMInloco.tblProdCategoria.IndexName:='';
DMInloco.tblProdCategoria.Last;
codigo:=DMInloco.tblProdCategoriaCod_Categoria.AsInteger;
DMInloco.tblProdCategoria.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblProdCategoriaCod_Categoria.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblProdCategoria.Next;
   end;
DMInloco.tblProdCategoria.Append;
DMInloco.tblProdCategoriaCod_Categoria.AsInteger:=codigo+1;
end;

procedure TfrmPropriedades.btnConfirmar1Click(Sender: TObject);
begin
if length(edtGrupo.Text)=0 then
   begin
   beep;
   MessageDlg('Descri��o do Grupo n�o pode estar vazia!',mtError,[mbOK],0);
   edtGrupo.SetFocus;
   end
else
   begin
   DMInloco.tblProdGrupo.Post;
   if rdgClassGrupos.ItemIndex=1 then
      DMInloco.tblProdGrupo.IndexName := 'Descr_Grupo';
   SomenteLeitura1;
   if btnTabela1.Down then
      dbgGrupos.Visible:=True;
   end;
end;

procedure TfrmPropriedades.btnConfirmar2Click(Sender: TObject);
begin
if length(edtCategoria.Text)=0 then
   begin
   beep;
   MessageDlg('Descri��o da Categoria n�o pode estar vazia!',mtError,[mbOK],0);
   edtCategoria.SetFocus;
   end
else if length(edtMargemLucro.Text)=0 then
   begin
   beep;
   MessageDlg('Margem de Lucro n�o pode estar vazia!',mtError,[mbOK],0);
   edtMargemLucro.SetFocus;
   end
else if length(edtDifPermitida.Text)=0 then
   begin
   beep;
   MessageDlg('Diferen�a permitida n�o pode estar vazia!',mtError,[mbOK],0);
   edtDifPermitida.SetFocus;
   end
else
   begin
   DMInloco.tblProdCategoria.Post;
   if rdgClassCategorias.ItemIndex=1 then
      DMInloco.tblProdCategoria.IndexName := 'Descr_Categoria';
   SomenteLeitura2;
   if btnTabela2.Down then
      dbgCategorias.Visible:=True;
   end;
end;

procedure TfrmPropriedades.btnCancelar1Click(Sender: TObject);
begin
DMInloco.tblProdGrupo.Cancel;
   if rdgClassGrupos.ItemIndex=1 then
      DMInloco.tblProdGrupo.IndexName := 'Descr_Grupo';
   SomenteLeitura1;
   if btnTabela1.Down then
      dbgGrupos.Visible:=True;
end;

procedure TfrmPropriedades.btnCancelar2Click(Sender: TObject);
begin
DMInloco.tblProdCategoria.Cancel;
if rdgClassCategorias.ItemIndex=1 then
   DMInloco.tblProdCategoria.IndexName := 'Descr_Categoria';
SomenteLeitura2;
if btnTabela2.Down then
   dbgCategorias.Visible:=True;
end;

procedure TfrmPropriedades.btnSair1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmPropriedades.btnSair2Click(Sender: TObject);
begin
Close;
end;

procedure TfrmPropriedades.btnFotoClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocFotos, frmLocFotos);
frmLocFotos.ShowModal;
end;

procedure TfrmPropriedades.btnLocalizar1Click(Sender: TObject);
begin
Application.CreateForm(TfrmLocGrupos, frmLocGrupos);
frmLocGrupos.ShowModal;
end;

procedure TfrmPropriedades.btnLocalizar2Click(Sender: TObject);
begin
Application.CreateForm(TfrmLocCategorias, frmLocCategorias);
frmLocCategorias.ShowModal;
end;


procedure TfrmPropriedades.btnTabela1Click(Sender: TObject);
begin
dbgGrupos.Visible:=True;
end;

procedure TfrmPropriedades.btnVoltar1Click(Sender: TObject);
begin
dbgGrupos.Visible:=False;
end;

procedure TfrmPropriedades.btnTabela2Click(Sender: TObject);
begin
dbgCategorias.Visible:=True;
end;

procedure TfrmPropriedades.btnVoltar2Click(Sender: TObject);
begin
dbgCategorias.Visible:=False;
end;

procedure TfrmPropriedades.edtMargemLucroKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmPropriedades.edtDifPermitidaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
