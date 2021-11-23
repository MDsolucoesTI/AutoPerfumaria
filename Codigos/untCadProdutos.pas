//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls, Mask;

type
  TfrmCadProdutos = class(TForm)
    lblCodProduto: TLabel;
    lblProduto: TLabel;
    lblProGrupo: TLabel;
    lblProdCategoria: TLabel;
    btnPropriedades: TButton;
    Panel2: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnTabela: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    pgcProdutos: TPageControl;
    pgcInfAtuais: TTabSheet;
    pgcUltimasCompras: TTabSheet;
    pgcUltimasVendas: TTabSheet;
    grdUltimasCompras: TDBGrid;
    lblPrecoVenda: TLabel;
    lblPrecoPromocao: TLabel;
    lblQuantMin: TLabel;
    lblQuantMax: TLabel;
    lblQuantAtual: TLabel;
    lblPedidosPendentes: TLabel;
    Bevel1: TBevel;
    rdgClassProdutos: TRadioGroup;
    edtCodProduto: TDBEdit;
    edtProduto: TDBEdit;
    cmbProdGrupo: TDBLookupComboBox;
    cmbProdCategoria: TDBLookupComboBox;
    edtPrecoVenda: TDBEdit;
    edtPrecoPromocao: TDBEdit;
    edtQuantAtual: TDBEdit;
    edtQuantMax: TDBEdit;
    edtQuantMin: TDBEdit;
    btnVoltar: TSpeedButton;
    dbgProdutos: TDBGrid;
    dbgPedidosPendentes: TDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edtCodProduto2: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    procedure btnPropriedadesClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rdgClassProdutosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtQuantMaxExit(Sender: TObject);
    procedure edtCodProduto2Exit(Sender: TObject);
    procedure edtCodProduto2KeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantMaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoPromocaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;
  Produto:Boolean;
  Cancelado:Boolean=False;

implementation

uses untPropriedades,untDMInloco, untLocProdutos, untCadPedidos,
untCadRecebimento, untPrincipal;

{$R *.DFM}

procedure Escrita;
begin
frmCadProdutos.btnPrimeiro.Enabled:=False;
frmCadProdutos.btnAnterior.Enabled:=False;
frmCadProdutos.btnProximo.Enabled:=False;
frmCadProdutos.btnUltimo.Enabled:=False;
frmCadProdutos.btnTabela.Enabled:=False;
frmCadProdutos.btnVoltar.Enabled:=False;
frmCadProdutos.btnLocalizar.Enabled:=False;
frmCadProdutos.btnEditar.Enabled:=False;
frmCadProdutos.btnExcluir.Enabled:=False;
frmCadProdutos.btnIncluir.Enabled:=False;
frmCadProdutos.btnSair.Enabled:=False;
frmCadProdutos.btnConfirmar.Enabled:=True;
frmCadProdutos.btnCancelar.Enabled:=True;
frmCadProdutos.rdgClassProdutos.Enabled:=False;
frmCadProdutos.pgcProdutos.ActivePage:=frmCadProdutos.pgcInfAtuais;
frmCadProdutos.pgcUltimasCompras.Enabled:=False;
frmCadProdutos.pgcUltimasVendas.Enabled:=False;
frmCadProdutos.edtProduto.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadProdutos.btnPrimeiro.Enabled:=True;
frmCadProdutos.btnAnterior.Enabled:=True;
frmCadProdutos.btnProximo.Enabled:=True;
frmCadProdutos.btnUltimo.Enabled:=True;
frmCadProdutos.btnConfirmar.Enabled:=False;
frmCadProdutos.btnCancelar.Enabled:=False;
frmCadProdutos.btnTabela.Enabled:=True;
frmCadProdutos.btnVoltar.Enabled:=True;
frmCadProdutos.btnLocalizar.Enabled:=True;
frmCadProdutos.btnEditar.Enabled:=True;
frmCadProdutos.btnExcluir.Enabled:=True;
frmCadProdutos.btnIncluir.Enabled:=True;
frmCadProdutos.btnSair.Enabled:=True;
frmCadProdutos.edtCodProduto2.Text:='';
frmCadProdutos.edtCodProduto2.Visible:=False;
frmCadProdutos.rdgClassProdutos.Enabled:=True;
frmCadProdutos.pgcUltimasCompras.Enabled:=True;
frmCadProdutos.pgcUltimasVendas.Enabled:=True;
frmCadProdutos.rdgClassProdutos.SetFocus;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
DMInloco.tblProdGrupo.Open;
DMInloco.tblProdCategoria.Open;
DMInloco.tblProdGrupo.IndexName:='Descr_Grupo';
DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
{DMInloco.tblDetPedidos2.MasterFields:='';
DMInloco.tblDetPedidos2.IndexName:='Cod_Produto';
DMInloco.tblDetPedidos2.MasterSource:=DMInloco.dscProdutos;
DMInloco.tblDetPedidos2.MasterFields:='Cod_Produto';}
DMInloco.tblDetPedidos2.Open;
{DMInloco.tblOutrasEntradas.IndexName:='Cod_Produto';
DMInloco.tblOutrasEntradas.MasterSource:=DMInloco.dscProdutos;
DMInloco.tblOutrasEntradas.MasterFields:='Cod_Produto';}
DMInloco.tblOutrasEntradas.Open;
{DMInloco.tblOutrasSaidas.IndexName:='Cod_Produto';
DMInloco.tblOutrasSaidas.MasterSource:=DMInloco.dscProdutos;
DMInloco.tblOutrasSaidas.MasterFields:='Cod_Produto';}
DMInloco.tblOutrasSaidas.Open;
pgcProdutos.ActivePage:=pgcInfAtuais;
Produto:=True;
DMInloco.tblProdutos.IndexName:='';
if Pedido or Recebimento then
   begin
   dbgProdutos.Visible:=False;
   Escrita;
   DMInloco.tblProdutos.Append;
   end
else
   begin
   DMInloco.tblProdutos.Open;
   DMInloco.tblProdutos.First;
   DMInloco.tblDetPedidos2.Filter:='Quant_Recebida=Null';
   DMInloco.tblDetPedidos2.Open;
   DMInloco.tblDetPedidos2.Filtered:=True;
   SomenteLeitura;
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if not Pedido and Recebimento then
   begin
   DMInloco.tblProdutos.Close;
   DMInloco.tblDetPedidos2.Filtered:=False;
   DMInloco.tblDetPedidos2.Close;
   end;
DMInloco.tblProdGrupo.Close;
DMInloco.tblProdCategoria.Close;
DMInloco.tblOutrasEntradas.MasterSource:=Nil;
DMInloco.tblOutrasEntradas.MasterFields:='';
DMInloco.tblOutrasEntradas.IndexName:='';
DMInloco.tblOutrasEntradas.Close;
DMInloco.tblOutrasSaidas.MasterSource:=Nil;
DMInloco.tblOutrasSaidas.MasterFields:='';
DMInloco.tblOutrasSaidas.IndexName:='';
DMInloco.tblOutrasSaidas.Close;
Produto:=False;
Action:=caFree;
end;

procedure TfrmCadProdutos.rdgClassProdutosClick(Sender: TObject);
begin
   case rdgClassProdutos.ItemIndex of
      0: DMInloco.tblProdutos.IndexName := '';
      1: DMInloco.tblProdutos.IndexName := 'Descr_Prod';
      2: DMInloco.tblProdutos.IndexName := 'Grupo_Prod';
      3: DMInloco.tblProdutos.IndexName := 'Categoria_Prod';
   end;
   SomenteLeitura;
end;

procedure TfrmCadProdutos.btnPropriedadesClick(Sender: TObject);
begin
Application.CreateForm(TfrmPropriedades, frmPropriedades);
frmPropriedades.ShowModal;
end;

procedure TfrmCadProdutos.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblProdutos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadProdutos.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblProdutos.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblProdutos.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadProdutos.btnProximoClick(Sender: TObject);
begin
DMInloco.tblProdutos.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblProdutos.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadProdutos.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblProdutos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
dbgProdutos.Visible:=False;
Escrita;
DMInloco.tblProdutos.Edit;
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Produto?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblProdutos.Delete;
end;

procedure TfrmCadProdutos.btnIncluirClick(Sender: TObject);
begin
Cancelado:=False;
dbgProdutos.Visible:=False;
Escrita;
edtCodProduto2.Visible:=True;
edtCodProduto2.SetFocus;
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblProdutos.Append;
DMInloco.tblProdutos.Post;
end;

procedure TfrmCadProdutos.btnConfirmarClick(Sender: TObject);
begin
if length(edtProduto.Text)=0 then
   begin
   beep;
   MessageDlg('Descri��o do Produto n�o pode estar vazia!',mtError,[mbOK],0);
   edtProduto.SetFocus;
   end
else if length(cmbProdCategoria.Text)=0 then
   begin
   beep;
   MessageDlg('O produto tem que pertencer a uma categoria!',mtError,[mbOK],0);
   cmbProdCategoria.SetFocus;
   end
else if length(cmbProdGrupo.Text)=0 then
   begin
   beep;
   MessageDlg('O produto tem que pertencer a um grupo!',mtError,[mbOK],0);
   cmbProdCategoria.SetFocus;
   end
else if length(edtQuantMin.Text)=0 then
   begin
   beep;
   MessageDlg('Quantidade M�nima n�o pode estar vazia!',mtError,[mbOK],0);
   edtQuantMin.SetFocus;
   end
else if length(edtQuantMax.Text)=0 then
   begin
   beep;
   MessageDlg('Quantidade M�xima n�o pode estar vazia!',mtError,[mbOK],0);
   edtQuantMax.SetFocus;
   end
else if StrtoInt(edtQuantMin.Text) > StrtoInt(edtQuantMax.Text) then
   begin
   beep;
   MessageDlg('Quantidade M�nima n�o pode ser maior que a M�xima!',mtError,[mbOK],0);
   edtQuantMin.SetFocus;
   end
else
   begin
   DMInloco.tblProdutosPedido.Value:=0;
   if DMInloco.tblProdutosPreco_Venda.Value=0 then
      DMInloco.tblProdutosPreco_Venda.Clear;
   if DMInloco.tblProdutosPreco_Promocao.Value=0 then
      DMInloco.tblProdutosPreco_Promocao.Clear;
   if DMInloco.tblProdutosQuant_Atual.IsNull then
      DMInloco.tblProdutosQuant_Atual.Value:=0;
   DMInloco.tblProdutos.Post;
   if pedido or Recebimento then
      Close
   else
      begin
      SomenteLeitura;
      if btnTabela.Down then
         dbgProdutos.Visible:=True;
      case rdgClassProdutos.ItemIndex of
         0: DMInloco.tblProdutos.IndexName := '';
         1: DMInloco.tblProdutos.IndexName := 'Descr_Prod';
         2: DMInloco.tblProdutos.IndexName := 'Grupo_Prod';
         3: DMInloco.tblProdutos.IndexName := 'Categoria_Prod';
         end;
      end;
   end;
end;

procedure TfrmCadProdutos.btnCancelarClick(Sender: TObject);
begin
Cancelado:=True;
DMInloco.tblProdutos.Delete;
if Pedido or Recebimento then
   Close
else
   begin
   SomenteLeitura;
   btnUltimo.Enabled:=False;
   btnProximo.Enabled:=False;
   if btnTabela.Down then
      dbgProdutos.Visible:=True;
   case rdgClassProdutos.ItemIndex of
      0: DMInloco.tblProdutos.IndexName := '';
      1: DMInloco.tblProdutos.IndexName := 'Descr_Prod';
      2: DMInloco.tblProdutos.IndexName := 'Grupo_Prod';
      3: DMInloco.tblProdutos.IndexName := 'Categoria_Prod';
      end;
   end;
end;

procedure TfrmCadProdutos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadProdutos.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocProdutos, frmLocProdutos);
frmLocProdutos.ShowModal;
end;

procedure TfrmCadProdutos.btnTabelaClick(Sender: TObject);
begin
dbgProdutos.Visible:=True;
end;

procedure TfrmCadProdutos.btnVoltarClick(Sender: TObject);
begin
dbgProdutos.Visible:=False;
end;

procedure TfrmCadProdutos.edtQuantMaxExit(Sender: TObject);
begin
edtPrecoVenda.SetFocus;
end;

procedure TfrmCadProdutos.edtCodProduto2Exit(Sender: TObject);
var
   Reg: TBookMark;
begin
if not Cancelado then
   begin
   if length(edtCodProduto2.Text)=0 then
      begin
      beep;
      MessageDlg('C�digo do Produto n�o pode estar vazio!',mtError,[mbOK],0);
      edtCodProduto2.SetFocus;
      end
   else
      begin
      reg:=DMInloco.tblProdutos.GetBookmark;
      if DMInloco.tblProdutos.FindKey([edtCodProduto2.Text]) then
         begin
         beep;
         MessageDlg('Produto j� cadastrado!',mtError,[mbOK],0);
         DMinloco.tblProdutos.GotoBookmark(reg);
         DMinloco.tblProdutos.FreeBookmark(reg);
         edtCodProduto2.SetFocus;
         end
      else
         begin
         DMinloco.tblProdutos.GotoBookmark(reg);
         DMinloco.tblProdutos.FreeBookmark(reg);
         DMInloco.tblProdutos.Edit;
         DMInloco.tblProdutosCod_Produto.AsString:=edtCodProduto2.Text;
         edtCodProduto2.Text:='';
         edtCodProduto2.Visible:=False;
         end;
      end;
   end;
end;

procedure TfrmCadProdutos.edtCodProduto2KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TfrmCadProdutos.edtQuantAtualKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadProdutos.edtQuantMaxKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadProdutos.edtQuantMinKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadProdutos.edtPrecoPromocaoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadProdutos.edtPrecoVendaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

end.
