//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadPedidos = class(TForm)
    lblCodPedido: TLabel;
    lblDataPedido: TLabel;
    lblFornecedor: TLabel;
    lblDataRecebimento: TLabel;
    lblValorTotal: TLabel;
    grdDetPedidos: TDBGrid;
    lblFormaPagto: TLabel;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    cmbFornecedor: TDBLookupComboBox;
    edtFormaPagto: TDBEdit;
    edtDataPedido: TDBEdit;
    edtDataRecebimento: TDBEdit;
    txtCodPedido: TDBText;
    rdgClassPedidos: TRadioGroup;
    btnImprimir: TSpeedButton;
    Bevel1: TBevel;
    btnProdutos: TGroupBox;
    lblProduto: TLabel;
    edtProduto: TEdit;
    dbgProdutos: TDBGrid;
    rdgClassProdutos: TRadioGroup;
    lblQuantidade: TLabel;
    lblIpi: TLabel;
    lblValorUnitario: TLabel;
    btnIncluirProd: TBitBtn;
    btnExcluirProd: TBitBtn;
    txtValorTotal: TDBText;
    edtQuantidade: TEdit;
    edtIpi: TEdit;
    edtValorUnitario: TEdit;
    btnVoltar: TSpeedButton;
    btnFinalizar: TBitBtn;
    Button1: TButton;
    PrintDialog: TPrintDialog;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFormaPagtoExit(Sender: TObject);
    procedure rdgClassProdutosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtProdutoChange(Sender: TObject);
    procedure dbgProdutosCellClick(Column: TColumn);
    procedure btnIncluirProdClick(Sender: TObject);
    procedure btnExcluirProdClick(Sender: TObject);
    procedure grdDetPedidosCellClick(Column: TColumn);
    procedure edtDataPedidoExit(Sender: TObject);
    procedure btnFinalizarExit(Sender: TObject);
    procedure rdgClassPedidosClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtIpiKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPedidos: TfrmCadPedidos;
  Confirmado: Boolean = False;
  Edicao: Boolean = False;
  Pedido: Boolean = False;

implementation

uses untDMInloco, untPrincipal, untLocPedidos, untPedidosPendentes,
  untCadProdutos, untRptPedidos1;

{$R *.DFM}

procedure Escrita;
begin
frmCadPedidos.btnPrimeiro.Enabled:=False;
frmCadPedidos.btnAnterior.Enabled:=False;
frmCadPedidos.btnProximo.Enabled:=False;
frmCadPedidos.btnUltimo.Enabled:=False;
frmCadPedidos.btnLocalizar.Enabled:=False;
frmCadPedidos.btnEditar.Enabled:=False;
frmCadPedidos.btnExcluir.Enabled:=False;
frmCadPedidos.btnIncluir.Enabled:=False;
frmCadPedidos.btnImprimir.Enabled:=False;
frmCadPedidos.btnSair.Enabled:=False;
frmCadPedidos.btnConfirmar.Enabled:=True;
frmCadPedidos.btnCancelar.Enabled:=True;
frmCadPedidos.rdgClassPedidos.Enabled:=False;
frmCadPedidos.edtDataPedido.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadPedidos.btnPrimeiro.Enabled:=True;
frmCadPedidos.btnAnterior.Enabled:=True;
frmCadPedidos.btnProximo.Enabled:=True;
frmCadPedidos.btnUltimo.Enabled:=True;
frmCadPedidos.btnLocalizar.Enabled:=True;
frmCadPedidos.btnEditar.Enabled:=True;
frmCadPedidos.btnExcluir.Enabled:=True;
frmCadPedidos.btnIncluir.Enabled:=True;
frmCadPedidos.btnImprimir.Enabled:=True;
frmCadPedidos.btnConfirmar.Enabled:=False;
frmCadPedidos.btnCancelar.Enabled:=False;
frmCadPedidos.btnSair.Enabled:=True;
frmCadPedidos.rdgClassPedidos.Enabled:=True;
frmCadPedidos.rdgClassPedidos.SetFocus;
end;

procedure TfrmCadPedidos.FormShow(Sender: TObject);
begin
if Consulta then
   begin
   frmCadPedidos.Caption:='Detalhes do Pedido Pendente';
   btnPrimeiro.Visible:=False;
   btnAnterior.Visible:=False;
   btnProximo.Visible:=False;
   btnUltimo.Visible:=False;
   btnLocalizar.Visible:=False;
   btnEditar.Visible:=False;
   btnExcluir.Visible:=False;
   btnIncluir.Visible:=False;
   btnImprimir.Visible:=False;
   btnConfirmar.Visible:=False;
   btnCancelar.Visible:=False;
   btnSair.Visible:=False;
   btnVoltar.Visible:=True;
   rdgClassPedidos.Visible:=False;
   end
else
   begin
   frmCadPedidos.Caption:='Cadastro de Pedidos';
   DMInloco.tblPedidos.IndexName:='';
   DMInloco.tblPedidos.Open;
   DMInloco.tblPedidos.Last;
   SomenteLeitura;
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   btnVoltar.Visible:=False;
   Pedido:=True;
   end;
DMInloco.tblDetPedidos.Open;
DMInloco.tblProdutos.Open;
DMInloco.tblFornecedores.Open;
DMInloco.tblFornecedores.IndexName:='Descr_Fornecedor';
frmCadPedidos.Width:=401;
end;

procedure TfrmCadPedidos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if Consulta then
   begin
   btnPrimeiro.Visible:=True;
   btnAnterior.Visible:=True;
   btnProximo.Visible:=True;
   btnUltimo.Visible:=True;
   btnLocalizar.Visible:=True;
   btnEditar.Visible:=True;
   btnExcluir.Visible:=True;
   btnIncluir.Visible:=True;
   btnImprimir.Visible:=True;
   btnConfirmar.Visible:=True;
   btnCancelar.Visible:=True;
   btnSair.Visible:=True;
   rdgClassPedidos.Visible:=True;
   end
else
   begin
   DMInloco.tblPedidos.IndexName:='';
   DMInloco.tblPedidos.Close;
   end;
Pedido:=False;
DMInloco.tblProdutos.IndexName:='';
DMInloco.tblFornecedores.IndexName:='';
DMInloco.tblDetPedidos.Close;
DMInloco.tblProdutos.Close;
DMInloco.tblFornecedores.Close;
Action:=caFree;
end;

procedure TfrmCadPedidos.edtFormaPagtoExit(Sender: TObject);
begin
if Confirmado then
   edtProduto.SetFocus
else
   edtDataPedido.SetFocus;
end;

procedure TfrmCadPedidos.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblPedidos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadPedidos.btnAnteriorClick(Sender: TObject);
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

procedure TfrmCadPedidos.btnProximoClick(Sender: TObject);
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

procedure TfrmCadPedidos.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblPedidos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadPedidos.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocPedidos, frmLocPedidos);
frmLocPedidos.ShowModal;
end;

procedure TfrmCadPedidos.btnEditarClick(Sender: TObject);
begin
if DMInloco.tblPedidosData_Recebimento.Value=Null then
   begin
   Escrita;
   Edicao:=True;
   DMInloco.tblPedidos.Edit;
   cmbFornecedor.SetFocus;
   end
else
   begin
   beep;
   MessageDlg('Pedido recebido, n�o pode ser alterado!',mtError,[mbOK],0);
   rdgClassPedidos.SetFocus;
   end;
end;

procedure TfrmCadPedidos.btnExcluirClick(Sender: TObject);
var
   Confirma,Codigo:integer;
begin
if DMInloco.tblPedidosData_Recebimento.Value=Null then
   begin
   Confirma:=Application.MessageBox('Deseja excluir esse Pedido?',
   'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      Codigo:=DMInloco.tblPedidosCod_Pedido.AsInteger;
      DMInloco.tblDetPedidos.First;
      While DMInloco.tblDetPedidos.FindKey([Codigo]) do
            DMInloco.tblDetPedidos.Delete;
      DMInloco.tblPedidos.Delete;
      end;
   end
else
   begin
   beep;
   MessageDlg('Pedido recebido, n�o pode ser excluido!',mtError,[mbOK],0);
   rdgClassPedidos.SetFocus;
   end;
end;

procedure TfrmCadPedidos.btnIncluirClick(Sender: TObject);
var
codigo:integer;
begin
Escrita;
DMInloco.tblPedidos.IndexName := '';
DMInloco.tblPedidos.Last;
codigo:=DMInloco.tblPedidosCod_Pedido.AsInteger;
DMInloco.tblPedidos.Append;
DMInloco.tblPedidosCod_Pedido.Value:=codigo+1;
DMInloco.tblPedidosData_Pedido.Value:=date;
DMInloco.tblPedidosNum_Itens.Value:=0;
cmbFornecedor.SetFocus;
end;

procedure TfrmCadPedidos.btnConfirmarClick(Sender: TObject);
begin
if length(edtDataPedido.Text)=0 then
   begin
   beep;
   MessageDlg('Data do Pedido n�o pode estar vazia!',mtError,[mbOK],0);
   edtDataPedido.SetFocus;
   end
else if length(cmbFornecedor.Text)=0 then
   begin
   beep;
   MessageDlg('Fornecedor n�o pode estar vazio!',mtError,[mbOK],0);
   cmbFornecedor.SetFocus;
   end
else
   begin
   DMInloco.tblPedidosData_Previsao.Value:=
   DMInloco.tblPedidosData_Pedido.Value+
   DMInloco.tblFornecedoresPrazo_Entrega.Value;
   DMInloco.tblPedidos.Post;
   Confirmado:=True;
   btnConfirmar.Enabled:=False;
   if edicao then btnCancelar.Enabled:=False;
   frmCadPedidos.Width:=640;
   frmCadPedidos.Left:=round((frmPrincipal.Width-frmCadPedidos.Width)/2);
   DMInloco.tblProdutos.IndexName:= 'Descr_Prod';
   edtProduto.SetFocus;
   end;
end;

procedure TfrmCadPedidos.btnCancelarClick(Sender: TObject);
var
   Confirma:integer;
begin
if not Confirmado then
   begin
   DMInloco.tblPedidos.Cancel;
   SomenteLeitura;
   end
else
   begin
   Confirma:=Application.MessageBox('Deseja realmente Cancelar esse Pedido?',
   'Aten��o!',mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      DMInloco.tblDetPedidos.First;
      While not DMInloco.tblDetPedidos.EOF do
         begin
         DMInloco.tblProdutos.Locate('Cod_Produto',
         DMInloco.tblDetPedidosCod_Produto.Value,[]);
         DMInloco.tblProdutos.Edit;
         DMInloco.tblProdutosPedido.Value:=
         DMInloco.tblProdutosPedido.Value-1;
         DMInloco.tblProdutos.Post;
         DMInloco.tblDetPedidos.Delete;
         DMInloco.tblDetPedidos.Next;
         end;
      DMInloco.tblPedidos.Delete;
      frmCadPedidos.Width:=408;
      frmCadPedidos.Position:=poScreenCenter;
      SomenteLeitura;
      end;
   end;
end;

procedure TfrmCadPedidos.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadPedidos.rdgClassProdutosClick(Sender: TObject);
begin
case rdgClassProdutos.ItemIndex of
   0: begin
      DMInloco.tblProdutos.IndexName:= '';
      lblProduto.Caption:='C�digo do Produto';
      end;
   1: begin
      DMInloco.tblProdutos.IndexName:= 'Descr_Prod';
      lblProduto.Caption:='Descri��o do Produto';
      end;
   end;
edtProduto.SetFocus;
end;

procedure TfrmCadPedidos.edtProdutoChange(Sender: TObject);
begin
DMInloco.tblProdutos.FindNearest([edtProduto.Text]);
end;

procedure TfrmCadPedidos.dbgProdutosCellClick(Column: TColumn);
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

procedure TfrmCadPedidos.btnIncluirProdClick(Sender: TObject);
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
   MessageDlg('Quantidade Pedida n�o pode estar vazia!',mtError,[mbOK],0);
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
         DMInloco.tblProdutos.Edit;
         DMInloco.tblProdutosPedido.Value:=
         DMInloco.tblProdutosPedido.Value+1;
         DMInloco.tblProdutos.Post;
         DMInloco.tblDetPedidos.Append;
         DMInloco.tblDetPedidosCod_Pedido:=
         DMInloco.tblPedidosCod_Pedido;
         DMInloco.tblDetPedidosCod_Produto.Value:=
         DMInloco.tblProdutosCod_Produto.Value;
         DMInloco.tblDetPedidosControle.Value:=1;
         DMInloco.tblDetPedidosQuant_Pedida.Value:=
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

procedure TfrmCadPedidos.btnExcluirProdClick(Sender: TObject);
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

procedure TfrmCadPedidos.btnFinalizarClick(Sender: TObject);
var
   Confirma: integer;
begin
if DMInloco.tblPedidosNum_Itens.AsInteger=0 then
   begin
   Confirma:=Application.MessageBox
             ('Pedido est� vazio, essa opera��o ir� exclu�-lo. Continuar?',
             'Aten��o!',mb_YesNo+mb_IconQuestion+mb_DefButton2);
   if Confirma=IDYES then
      begin
      DMInloco.tblPedidos.Delete;
      SomenteLeitura;
      frmCadPedidos.Width:=401;
      frmCadPedidos.Position:=poScreenCenter;
      Confirmado:=False;
      btnProximo.Enabled:=False;
      btnUltimo.Enabled:=False;
      end;
   end
else
   begin
   frmCadPedidos.Width:=401;
   frmCadPedidos.Position:=poScreenCenter;
   Confirmado:=False;
   SomenteLeitura;
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadPedidos.grdDetPedidosCellClick(Column: TColumn);
begin
btnExcluirProd.Enabled:=True;
end;

procedure TfrmCadPedidos.edtDataPedidoExit(Sender: TObject);
begin
if not DMInloco.tblPedidosData_Pedido.IsNull then
   begin
   if (StrToDate(edtDataPedido.Text)>date) then
      begin
      Application.MessageBox('Data inv�lida!','Aten��o!',
      mb_OK+mb_IconInformation);
      edtDataPedido.SetFocus;
      end;
   end;
end;

procedure TfrmCadPedidos.btnFinalizarExit(Sender: TObject);
begin
edtProduto.SetFocus;
end;

procedure TfrmCadPedidos.rdgClassPedidosClick(Sender: TObject);
begin
case rdgClassPedidos.ItemIndex of
   0:DMInloco.tblPedidos.IndexName:='';
   1:DMInloco.tblPedidos.IndexName:='iCod_Fornecedor';
   end;
end;

procedure TfrmCadPedidos.btnVoltarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadPedidos.Button1Click(Sender: TObject);
begin
Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
frmCadProdutos.ShowModal;
case rdgClassProdutos.ItemIndex of
   0: DMInloco.tblProdutos.IndexName := '';
   1: DMInloco.tblProdutos.IndexName := 'Descr_Prod';
   end;
DMInloco.tblProdutos.First;
end;

procedure TfrmCadPedidos.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadPedidos.btnImprimirClick(Sender: TObject);
var
   Codigo:integer;
begin
Codigo:=DMInloco.tblPedidosCod_Pedido.Value;
DMInloco.tblPedidos.Filter:='Cod_Pedido='+IntToStr(Codigo);
DMInloco.tblPedidos.Filtered:=True;
{if PrintDialog.Execute then
   begin
   Application.CreateForm(TrptPedidos1, rptPedidos1);
   rptPedidos1.relPedidos.PrinterSettings.Copies:=PrintDialog.Copies;
   rptPedidos1.relPedidos.Print;
   end;}
Application.CreateForm(TrptPedidos1, rptPedidos1);
rptPedidos1.relPedidos.Preview;
DMInloco.tblPedidos.Filtered:=False;
DMinloco.tblPedidos.FindKey([Codigo]);
end;

procedure TfrmCadPedidos.edtIpiKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadPedidos.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9', ',', #8]) then
   begin
   key:=#0;
   beep;
   end;
end;

procedure TfrmCadPedidos.edtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
   begin
   Key:=#0;
   Perform (CM_DialogKey,VK_TAB,0);
   end;
end;

end.
