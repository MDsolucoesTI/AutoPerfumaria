//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmLocPedidos = class(TForm)
    lblProcurar: TLabel;
    edtPedido: TEdit;
    dbgPedidos: TDBGrid;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    rdgPesquisa: TRadioGroup;
    cmbFornecedores: TDBLookupComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPedidoChange(Sender: TObject);
    procedure rdgPesquisaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbFornecedoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocPedidos: TfrmLocPedidos;

implementation

uses untDMInloco, untCadRecebimento, untPrincipal, untCadPedidos;

{$R *.DFM}

procedure TfrmLocPedidos.FormShow(Sender: TObject);
begin
DMInloco.tblPedidos.IndexName:='iCod_Fornecedor';
reg:=DMInloco.tblPedidos.GetBookmark;
cmbFornecedores.SetFocus;
end;

procedure TfrmLocPedidos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if not Recebimento then
case frmCadPedidos.rdgClassPedidos.ItemIndex of
   0:DMInloco.tblPedidos.IndexName:='';
   1:DMInloco.tblPedidos.IndexName:='iCod_Fornecedor';
   end
else
   DMInloco.tblPedidos.IndexName:='';
DMInloco.tblPedidos.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocPedidos.edtPedidoChange(Sender: TObject);
begin
DMInloco.tblPedidos.FindNearest([edtPedido.Text]);
end;

procedure TfrmLocPedidos.cmbFornecedoresClick(Sender: TObject);
begin
if not DMInloco.tblPedidos.FindKey([DMInloco.tblFornecedoresCod_Fornecedor])
   then
   begin
   beep;
   MessageDlg('N�o h� pedido cadastrado desse fornecedor!',mtInformation,
    [mbOK],0);
   cmbFornecedores.SetFocus;
   end;
end;

procedure TfrmLocPedidos.rdgPesquisaClick(Sender: TObject);
begin
case rdgPesquisa.ItemIndex of
   0: begin
      DMInloco.tblPedidos.IndexName:= '';
      edtPedido.Visible:=True;
      cmbFornecedores.Visible:=False;
      edtPedido.SetFocus;
      end;
   1: begin
      DMInloco.tblPedidos.IndexName:= 'iCod_Fornecedor';
      edtPedido.Visible:=False;
      cmbFornecedores.Visible:=True;
      cmbFornecedores.SetFocus;
      end;
   end;
end;

procedure TfrmLocPedidos.btnOkClick(Sender: TObject);
begin
if Recebimento then
   begin
   frmCadRecebimento.btnPrimeiro.Enabled:=True;
   frmCadRecebimento.btnAnterior.Enabled:=True;
   frmCadRecebimento.btnProximo.Enabled:=True;
   frmCadRecebimento.btnUltimo.Enabled:=True;
   end
else
   begin
   frmCadPedidos.btnPrimeiro.Enabled:=True;
   frmCadPedidos.btnAnterior.Enabled:=True;
   frmCadPedidos.btnProximo.Enabled:=True;
   frmCadPedidos.btnUltimo.Enabled:=True;
   end;
Close;
end;

procedure TfrmLocPedidos.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblPedidos.GotoBookmark(reg);
Close;
end;

end.
