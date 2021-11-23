//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadRecebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, Grids, DBGrids;

  procedure SomenteLeitura;

type
  TfrmCadRecebimento = class(TForm)
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnSemPed: TSpeedButton;
    btnComPed: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    lblCodPedido: TLabel;
    lblDataPedido: TLabel;
    lblDataRecebimento: TLabel;
    lblFornecedor: TLabel;
    lblFormaPagto: TLabel;
    txtCodPedido: TDBText;
    edtDataRecebimento: TDBEdit;
    edtFormaPagto: TDBEdit;
    dbgDetPedido: TDBGrid;
    lblValorTotal: TLabel;
    txtValorTotal: TDBText;
    btnPainel: TPanel;
    GroupBox1: TGroupBox;
    rdgClassProdutos: TRadioGroup;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblIpi: TLabel;
    lblValorUnitario: TLabel;
    edtProduto: TEdit;
    dbgProdutos: TDBGrid;
    edtQuantidade: TEdit;
    edtIpi: TEdit;
    edtValorUnitario: TEdit;
    btnIncluirProd: TBitBtn;
    btnExcluirProd: TBitBtn;
    Bevel1: TBevel;
    edtFornecedor: TDBLookupComboBox;
    btnImprimir: TSpeedButton;
    btnFinalizar: TBitBtn;
    Button1: TButton;
    edtDataPedido: TDBEdit;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnSemPedClick(Sender: TObject);
    procedure btnIncluirProdClick(Sender: TObject);
    procedure btnExcluirProdClick(Sender: TObject);
    procedure dbgDetPedidoCellClick(Column: TColumn);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnComPedClick(Sender: TObject);
    procedure edtDataRecebimentoExit(Sender: TObject);
    procedure edtDataRecebimentoChange(Sender: TObject);
    procedure dbgProdutosCellClick(Column: TColumn);
    procedure btnFinalizarExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtIpiKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRecebimento: TfrmCadRecebimento;
  Confirmado,ComPedido:Boolean;
  Recebimento:Boolean=False;

implementation

uses untDMInloco, untLocPedidos, untPrincipal, untCadCtasPagar,
  untCadProdutos, untRptRecebimentos;

{$R *.DFM}

procedure Escrita;
begin
frmCadRecebimento.btnPrimeiro.Enabled:=False;
frmCadRecebimento.btnAnterior.Enabled:=False;
frmCadRecebimento.btnProximo.Enabled:=False;
frmCadRecebimento.btnUltimo.Enabled:=False;
frmCadRecebimento.btnLocalizar.Enabled:=False;
frmCadRecebimento.btnComPed.Enabled:=False;
frmCadRecebimento.btnSemPed.Enabled:=False;
frmCadRecebimento.btnImprimir.Enabled:=False;
frmCadRecebimento.btnConfirmar.Enabled:=True;
frmCadRecebimento.btnCancelar.Enabled:=True;
frmCadRecebimento.btnSair.Enabled:=False;
end;

procedure SomenteLeitura;
begin
frmCadRecebimento.btnPrimeiro.Enabled:=True;
frmCadRecebimento.btnAnterior.Enabled:=True;
frmCadRecebimento.btnProximo.Enabled:=True;
frmCadRecebimento.btnUltimo.Enabled:=True;
frmCadRecebimento.btnLocalizar.Enabled:=True;
frmCadRecebimento.btnComPed.Enabled:=True;
frmCadRecebimento.btnSemPed.Enabled:=True;
frmCadRecebimento.btnImprimir.Enabled:=True;
frmCadRecebimento.btnConfirmar.Enabled:=False;
frmCadRecebimento.btnCancelar.Enabled:=False;
frmCadRecebimento.btnSair.Enabled:=True;
frmCadRecebimento.dbgDetPedido.SetFocus;
end;

procedure TfrmCadRecebimento.FormShow(Sender: TObject);
begin
SomenteLeitura;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
edtDataPedido.ReadOnly:=True;
edtFornecedor.ReadOnly:=True;
edtFormaPagto.ReadOnly:=True;
dbgDetPedido.ReadOnly:=True;
frmCadRecebimento.Width:=401;
Recebimento:=True;
DMInloco.tblPedidos.IndexName:='';
DMInloco.tblPedidos.Open;
DMInloco.tblPedidos.Last;
DMInloco.tblDetPedidos.Open;
DMInloco.tblProdutos.Open;
DMInloco.tblFornecedores.IndexName:='Descr_Fornecedor';
DMInloco.tblFornecedores.Open;
end;

procedure TfrmCadRecebimento.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblPedidos.IndexName:='';
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblFornecedores.IndexName:='';
DMInloco.tblPedidos.Close;
DMInloco.tblDetPedidos.Close;
DMInloco.tblProdutos.Close;
DMInloco.tblFornecedores.Close;
Recebimento:=False;
Action:=caFree;
end;

procedure TfrmCadRecebimento.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblPedidos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadRecebimento.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblPedidos.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblPedidos.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadRecebimento.btnProximoClick(Sender: TObject);
begin
DMInloco.tblPedidos.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblPedidos.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadRecebimento.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblPedidos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadRecebimento.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocPedidos, frmLocPedidos);
frmLocPedidos.ShowModal;
end;

procedure TfrmCadRecebimento.btnComPedClick(Sender: TObject);
begin
Escrita;
DMInloco.tblDetPedidos.First;
frmCadRecebimento.Cursor:=crHourGlass;
While not DMInloco.tblDetPedidos.EOF do
   begin
   if not DMInloco.tblDetPedidosQuant_Recebida.IsNull then
      begin
      DMInloco.tblProdutos.Locate('Cod_Produto',
       DMInloco.tblDetPedidosCod_Produto.Value,[]);
      DMInloco.tblProdutos.Edit;
      DMInloco.tblProdutosQuant_Atual.Value:=
       DMInloco.tblProdutosQuant_Atual.Value-
       DMInloco.tblDetPedidosQuant_Recebida.Value;
      DMInloco.tblProdutos.Post;
      end
   else
      begin
      DMInloco.tblDetPedidos.Edit;
      DMInloco.tblDetPedidosQuant_Recebida.Value:=
       DMInloco.tblDetPedidosQuant_Pedida.Value;
      DMInloco.tblDetPedidos.Post;
      end;
   DMInloco.tblDetPedidos.Next;
   end;
frmCadRecebimento.Cursor:=crDefault;
DMInloco.tblDetPedidos.First;
ComPedido:=True;
dbgDetPedido.ReadOnly:=False;
DMInloco.tblPedidos.Edit;
DMInloco.dscDetPedidos.AutoEdit:=True;
edtDataRecebimento.SetFocus;
end;

procedure TfrmCadRecebimento.btnSemPedClick(Sender: TObject);
var
   Codigo:integer;
begin
Escrita;
ComPedido:=False;
edtFornecedor.ReadOnly:=False;
edtFormaPagto.ReadOnly:=False;
DMInloco.tblPedidos.IndexName := '';
DMInloco.tblPedidos.Last;
codigo:=DMInloco.tblPedidosCod_Pedido.AsInteger;
DMInloco.tblPedidos.Append;
DMInloco.tblPedidosCod_Pedido.AsInteger:=codigo+1;
DMInloco.tblPedidosData_Pedido.AsDateTime:=Date;
DMInloco.tblPedidosData_Recebimento.AsDateTime:=Date;
DMInloco.tblPedidosNum_Itens.AsInteger:=0;
edtFornecedor.SetFocus;
end;

procedure TfrmCadRecebimento.btnConfirmarClick(Sender: TObject);
begin
if length(edtDataRecebimento.Text)=0 then
   begin
   beep;
   MessageDlg('Data do Recebimento n�o pode estar vazia!',mtError,[mbOK],0);
   edtDataRecebimento.SetFocus;
   end
else if length(edtFornecedor.Text)=0 then
   begin
   beep;
   MessageDlg('Fornecedor n�o pode estar vazio!',mtError,[mbOK],0);
   edtFornecedor.SetFocus;
   end
else
   begin
   DMInloco.tblPedidos.Post;
   if ComPedido then
      begin
      frmCadRecebimento.Cursor:=crHourGlass;
      SomenteLeitura;
      dbgDetPedido.ReadOnly:=True;
      DMInloco.dscDetPedidos.AutoEdit:=False;
      DMInloco.tblPedidos.Edit;
      DMInloco.tblPedidosValor_Total.Value:=0;
      DMInloco.tblPedidos.Post;
      DMInloco.tblDetPedidos.First;
      While not DMInloco.tblDetPedidos.EOF do
         begin
         DMInloco.tblPedidos.Edit;
         DMInloco.tblPedidosValor_Total.Value:=
          DMInloco.tblPedidosValor_Total.Value+
          DMInloco.tblDetPedidosValor_Total.Value;
         DMInloco.tblPedidos.Post;
         if DMInloco.tblDetPedidosQuant_Recebida.IsNull then
            begin
            DMInloco.tblDetPedidos.Edit;
            DMInloco.tblDetPedidosQuant_Recebida.Value
               :=DMInloco.tblDetPedidosQuant_Pedida.Value;
            DMInloco.tblDetPedidos.Post;
            end;
         DMInloco.tblProdutos.Locate('Cod_Produto',
         DMInloco.tblDetPedidosCod_Produto.Value,[]);
         DMInloco.tblProdutos.Edit;
         DMInloco.tblProdutosPedido.Value:=
         DMInloco.tblProdutosPedido.Value-1;
         if DMInloco.tblDetPedidosQuant_Recebida.Value>0 then
            begin
            DMInloco.tblProdutosQuant_Atual.Value:=
             DMInloco.tblProdutosQuant_Atual.Value+
             DMInloco.tblDetPedidosQuant_Recebida.Value;
            DMInloco.tblProdutosData_Ultima_Compra.Value:=
            DMInloco.tblPedidosData_Recebimento.Value;
            DMInloco.tblProdutosForn_Ultima_Compra.Value:=
            DMInloco.tblPedidosCod_Fornecedor.Value;
            DMInloco.tblProdutosQuant_Ultima_Compra.Value:=
            DMInloco.tblDetPedidosQuant_Recebida.Value;
            DMInloco.tblProdutosPreco_Ultima_Compra.Value:=
            DMInloco.tblDetPedidosValor_Total.Value/
            DMInloco.tblDetPedidosQuant_Recebida.Value;
            end;
         DMInloco.tblProdutos.Post;
         DMInloco.tblDetPedidos.Next;
         end;
      frmCadRecebimento.Cursor:=crDefault;
      end
   else
      begin
      Confirmado:=True;
      edtFornecedor.ReadOnly:=True;
      edtFormaPagto.ReadOnly:=True;
      btnConfirmar.Enabled:=False;
      frmCadRecebimento.Width:=640;
      frmCadRecebimento.Left:=round((frmPrincipal.Width-frmCadRecebimento.Width)/2);
      DMInloco.tblProdutos.IndexName:= 'Descr_Prod';
      edtProduto.SetFocus;
      end;
   Application.CreateForm(TfrmCadCtasPagar, frmCadCtasPagar);
   frmCadCtasPagar.ShowModal;
   btnPainel.SetFocus;
   end;
end;

procedure TfrmCadRecebimento.btnCancelarClick(Sender: TObject);
var
   Confirma:integer;
begin
if ComPedido then
   begin
   Confirma:=Application.MessageBox('Deseja cancelar esse Recebimento?',
            'Cancelar recebimento',mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      SomenteLeitura;
      dbgDetPedido.ReadOnly:=True;
      DMInloco.tblPedidosData_Recebimento.Clear;
      DMInloco.tblPedidos.Post;
      DMInloco.dscDetPedidos.AutoEdit:=False;
      DMInloco.tblDetPedidos.First;
         While not DMInloco.tblDetPedidos.EOF do
            begin
            DMInloco.tblDetPedidos.Edit;
            DMInloco.tblDetPedidosQuant_Recebida.Clear;
            DMInloco.tblDetPedidos.Post;
            DMInloco.tblDetPedidos.Next;
            end;
      end;
   end
else
   begin
   if not Confirmado then
      begin
      DMInloco.tblPedidos.Cancel;
      SomenteLeitura;
      btnProximo.Enabled:=False;
      btnUltimo.Enabled:=False;
      edtFornecedor.ReadOnly:=True;
      edtFormaPagto.ReadOnly:=True;
      end
   else
      begin
      Confirma:=Application.MessageBox('Deseja cancelar esse Recebimento?',
                'Cancelar recebimento',mb_YesNo+mb_IconQuestion+mb_DefButton2);
      if Confirma=IDYES then
         begin
         Confirmado:=False;
         edtFornecedor.ReadOnly:=True;
         edtFormaPagto.ReadOnly:=True;
         frmCadRecebimento.Width:=478;
         frmCadRecebimento.Position:=poScreenCenter;
         DMInloco.tblDetPedidos.First;
         While not DMInloco.tblDetPedidos.EOF do
            DMInloco.tblDetPedidos.Delete;
         DMInloco.tblPedidos.Delete;
         SomenteLeitura;
         btnProximo.Enabled:=False;
         btnUltimo.Enabled:=False;
         end;
      end;
   end;
{Case rdgClassPedidos.ItemIndex of
   1: DMInloco.tblPedidos.IndexName := 'Descr_Fornecedor';
end;}
end;

procedure TfrmCadRecebimento.btnIncluirProdClick(Sender: TObject);
var
   Confirma,Controle:Integer;
   Reg: TBookMark;
   Cadastrar:Boolean;
begin
reg:=DMInloco.tblProdutos.GetBookmark;
if (length(edtQuantidade.Text)=0) or
   (StrToInt(edtQuantidade.Text)=0) then
   begin
   beep;
   MessageDlg('Quantidade Recebida n�o pode estar vazia!',mtError,[mbOK],0);
   edtQuantidade.SetFocus;
   end
else if (length(edtValorUnitario.Text)=0) or
        (StrToFloat(edtValorUnitario.Text)=0) then
   begin
   beep;
   MessageDlg('Valor unit�rio n�o pode estar vazio!',mtError,[mbOK],0);
   edtValorUnitario.SetFocus;
   end
else
   begin
   if DMInloco.tblDetPedidos.Locate
   ('Cod_Produto',DMInloco.tblProdutosCod_Produto.Value,[]) then
      begin
      if DMInloco.tblDetPedidosValor_Unitario.Value=
         StrToFloat(edtValorUnitario.Text) then
         begin
         Confirma:=Application.MessageBox('Produto j� cadastrado nesse pedido.'+
         #13+'Deseja somar esta quantidade com a j� pedida?',
         'Aten��o!',mb_YesNo+mb_IconQuestion+mb_DefButton2);
         if Confirma=IDYES then
            begin
            DMInloco.tblPedidos.Edit;
            DMInloco.tblPedidosValor_Total.Value:=
            DMInloco.tblPedidosValor_Total.Value-
            DMInloco.tblDetPedidosValor_Total.Value;
            DMInloco.tblPedidos.Post;
            DMInloco.tblDetPedidos.Edit;
            DMInloco.tblDetPedidosQuant_Pedida.Value:=
            DMInloco.tblDetPedidosQuant_Pedida.Value+
            StrToInt(edtQuantidade.Text);
            DMInloco.tblDetPedidosQuant_Recebida.Value:=
            DMInloco.tblDetPedidosQuant_Recebida.Value+
            StrToInt(edtQuantidade.Text);
            DMInloco.tblDetPedidos.Post;
            DMInloco.tblPedidos.Edit;
            DMInloco.tblPedidosValor_Total.Value:=
            DMInloco.tblPedidosValor_Total.Value+
            DMInloco.tblDetPedidosValor_Total.Value;
            DMInloco.tblPedidos.Post;
            end;
         end
      else
         begin
         controle:=2;
         While DMInloco.tblDetPedidos.FindKey
         ([DMInloco.tblPedidosCod_Pedido.Value,
         DMInloco.tblProdutosCod_Produto.Value,controle]) do
            Controle:=Controle+1;
         DMInloco.tblDetPedidos.Append;
         DMInloco.tblDetPedidosCod_Pedido:=
         DMInloco.tblPedidosCod_Pedido;
         DMInloco.tblDetPedidosCod_Produto.Value:=
         DMInloco.tblProdutosCod_Produto.Value;
         DMInloco.tblDetPedidosControle.Value:=controle;
         DMInloco.tblDetPedidosQuant_Pedida.Value:=
         StrToInt(edtQuantidade.Text);
         DMInloco.tblDetPedidosQuant_Recebida.Value:=
         StrToInt(edtQuantidade.Text);
         if length(edtIpi.Text)<>0 then
            DMInloco.tblDetPedidosIPI.Value:=
            StrToFloat(edtIpi.Text)
         else
            DMInloco.tblDetPedidosIPI.Value:=0;
         DMInloco.tblDetPedidosValor_Unitario.Value:=
         StrToFloat(edtValorUnitario.Text);
         DMInloco.tblDetPedidos.Post;
         DMInloco.tblPedidos.Edit;
         DMInloco.tblPedidosNum_Itens.AsInteger:=
         DMInloco.tblPedidosNum_Itens.AsInteger+1;
         DMInloco.tblPedidosValor_Total.Value:=
         DMInloco.tblPedidosValor_Total.Value+
         DMInloco.tblDetPedidosValor_Total.Value;
         DMInloco.tblPedidos.Post;
         end;
      end
   else
      begin
      Cadastrar:=False;
      if DMInloco.tblProdutosPedido.Value>0 then
         begin
         Confirma:=Application.MessageBox
         ('Esse produto j� possui pedido(s) pendente(s).'+#13+
         'Deseja pedi-lo novamente?',
         'Aten��o!',mb_YesNo+mb_IconQuestion+mb_DefButton2);
         if Confirma=IDYES then
            Cadastrar:=True;
         end
      else
         Cadastrar:=True;
      if Cadastrar then
         begin
         DMInloco.tblDetPedidos.Append;
         DMInloco.tblDetPedidosCod_Pedido.Value:=
         DMInloco.tblPedidosCod_Pedido.Value;
         DMInloco.tblDetPedidosCod_Produto.AsString:=
         DMInloco.tblProdutosCod_Produto.AsString;
         DMInloco.tblDetPedidosControle.Value:=1;
         DMInloco.tblDetPedidosQuant_Pedida.AsInteger:=
         StrToInt(edtQuantidade.Text);
         DMInloco.tblDetPedidosQuant_Recebida.AsInteger:=
         StrToInt(edtQuantidade.Text);
         if length(edtIpi.Text)<>0 then
            DMInloco.tblDetPedidosIPI.Value:=
            StrToFloat(edtIpi.Text)
         else
            DMInloco.tblDetPedidosIPI.Value:=0;
         DMInloco.tblDetPedidosValor_Unitario.Value:=
         StrToFloat(edtValorUnitario.Text);
         DMInloco.tblDetPedidos.Post;
         DMInloco.tblPedidos.Edit;
         DMInloco.tblPedidosNum_Itens.AsInteger:=
         DMInloco.tblPedidosNum_Itens.AsInteger+1;
         DMInloco.tblPedidosValor_Total.Value:=
          DMInloco.tblPedidosValor_Total.Value+
          DMInloco.tblDetPedidosValor_Total.Value;
         DMInloco.tblPedidos.Post;
         end;
      end;
   edtProduto.Text:='';
   edtQuantidade.Text:='';
   edtIpi.Text:='';
   edtValorUnitario.Text:='';
   edtProduto.SetFocus;
   DMInloco.tblProdutos.GotoBookmark(reg);
   DMInloco.tblProdutos.FreeBookmark(reg);
   end;
end;

procedure TfrmCadRecebimento.btnExcluirProdClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja realmente excluir esse Item?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   begin
   DMInloco.tblPedidos.Edit;
   DMInloco.tblPedidosNum_Itens.AsInteger:=
     DMInloco.tblPedidosNum_Itens.AsInteger-1;
   DMInloco.tblPedidosValor_Total.Value:=
    DMInloco.tblPedidosValor_Total.Value-
    DMInloco.tblDetPedidosValor_Total.Value;
   DMInloco.tblPedidos.Post;
   DMInloco.tblDetPedidos.Delete;
   end;
btnExcluirProd.Enabled:=False;
end;

procedure TfrmCadRecebimento.dbgDetPedidoCellClick(Column: TColumn);
begin
btnExcluirProd.Enabled:=True;
end;

procedure TfrmCadRecebimento.btnFinalizarClick(Sender: TObject);
var
   Confirma: integer;
begin
if DMInloco.tblPedidosNum_Itens.AsInteger=0 then
   begin
   Confirma:=Application.MessageBox
             ('Recebimento est� vazio, essa opera��o ir� exclu�-lo. Continuar?',
             'Aten��o!',mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      DMInloco.tblPedidos.Delete;
      {Case rdgClassPedidos.ItemIndex of
         1: DMInloco.tblPedidos.IndexName := 'Descr_Fornecedor';
         end;}
      frmCadRecebimento.Width:=401;
      frmCadRecebimento.Position:=poScreenCenter;
      Confirmado:=False;
      SomenteLeitura;
      btnProximo.Enabled:=False;
      btnUltimo.Enabled:=False;
      end;
   end
else
   begin
   frmCadRecebimento.Width:=478;
   frmCadRecebimento.Position:=poScreenCenter;
   Confirmado:=False;
   SomenteLeitura;
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   DMInloco.tblDetPedidos.First;
   While not DMInloco.tblDetPedidos.EOF do
      begin
      DMInloco.tblProdutos.Locate('Cod_Produto',
       DMInloco.tblDetPedidosCod_Produto.Value,[]);
      DMInloco.tblProdutos.Edit;
      DMInloco.tblProdutosQuant_Atual.Value:=
       DMInloco.tblProdutosQuant_Atual.Value+
       DMInloco.tblDetPedidosQuant_Recebida.Value;
      DMInloco.tblProdutosData_Ultima_Compra.Value:=
      DMInloco.tblPedidosData_Recebimento.Value;
      DMInloco.tblProdutosForn_Ultima_Compra.Value:=
      DMInloco.tblPedidosCod_Fornecedor.Value;
      DMInloco.tblProdutosQuant_Ultima_Compra.Value:=
      DMInloco.tblDetPedidosQuant_Recebida.Value;
      DMInloco.tblProdutosPreco_Ultima_Compra.Value:=
      DMInloco.tblDetPedidosValor_Total.Value/
      DMInloco.tblDetPedidosQuant_Recebida.Value;
      DMInloco.tblProdutos.Post;
      DMInloco.tblDetPedidos.Next;
      end;
   frmCadCtasPagar.ShowModal;
   end;
end;

procedure TfrmCadRecebimento.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadRecebimento.edtDataRecebimentoExit(Sender: TObject);
begin
if not DMInloco.tblPedidosData_Recebimento.IsNull then
   begin
   if (StrToDate(edtDataRecebimento.Text)>date) or
      (StrToDate(edtDataRecebimento.Text)<StrToDate(edtDataPedido.Text)) then
      begin
      Application.MessageBox('Data inv�lida!','Aten��o!',
      mb_OK+mb_IconInformation);
      edtDataRecebimento.SetFocus;
      end;
   end;
end;

procedure TfrmCadRecebimento.edtDataRecebimentoChange(Sender: TObject);
begin
if not ComPedido then
   edtDataPedido.Text:=edtDataRecebimento.Text;
end;

procedure TfrmCadRecebimento.dbgProdutosCellClick(Column: TColumn);
begin
edtProduto.Text:=DMInloco.tblProdutosProduto.AsString;
if DMInloco.tblProdutosQuant_Atual.Value <
   DMInloco.tblProdutosQuant_Min.Value then
   edtQuantidade.Text:=IntToStr(DMInloco.tblProdutosQuant_Max.Value-
   DMInloco.tblProdutosQuant_Atual.Value)
else
   edtQuantidade.Text:='0';
edtIpi.Text:='';
edtValorUnitario.Text:='';
edtValorUnitario.SetFocus;
end;

procedure TfrmCadRecebimento.btnFinalizarExit(Sender: TObject);
begin
edtProduto.SetFocus;
end;

procedure TfrmCadRecebimento.Button1Click(Sender: TObject);
begin
Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
frmCadProdutos.ShowModal;
case rdgClassProdutos.ItemIndex of
   0: DMInloco.tblProdutos.IndexName := '';
   1: DMInloco.tblProdutos.IndexName := 'Descr_Prod';
   end;
DMInloco.tblProdutos.First;
end;

procedure TfrmCadRecebimento.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadRecebimento.btnImprimirClick(Sender: TObject);
var
   Codigo:integer;
begin
if DMInloco.tblPedidosData_Recebimento.IsNull then
   begin
   beep;
   MessageDlg('Pedido ainda n�o foi Recebido!',mtError,[mbOK],0);
   end
else
   begin
   DMInloco.tblProdCategoria.Open;
   DMInloco.tblProdCategoria.IndexName:='';
   Codigo:=DMInloco.tblPedidosCod_Pedido.Value;
   DMInloco.tblPedidos.Filter:='Cod_Pedido='+IntToStr(Codigo);
   DMInloco.tblPedidos.Filtered:=True;
   {if PrintDialog.Execute then
      begin
      Application.CreateForm(TrptRecebimentos, rptRecebimentos);
      rptRecebimentos.relPedidos.PrinterSettings.Copies:=PrintDialog.Copies;
      rptRecebimentos.relPedidos.Print;
      end;}
   Application.CreateForm(TrptRecebimentos, rptRecebimentos);
   rptRecebimentos.relPedidos.Preview;
   DMInloco.tblPedidos.Filtered:=False;
   DMinloco.tblPedidos.FindKey([Codigo]);
   DMInloco.tblProdCategoria.Close;
   end;
end;

procedure TfrmCadRecebimento.edtIpiKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadRecebimento.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadRecebimento.edtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TfrmCadRecebimento.edtProdutoChange(Sender: TObject);
begin
DMInloco.tblProdutos.FindNearest([edtProduto.Text]);
end;


end.
