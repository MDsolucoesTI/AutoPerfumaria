//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocClientes = class(TForm)
    edtProcurar: TEdit;
    DBGrid1: TDBGrid;
    lblProcurar: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocClientes: TfrmLocClientes;

implementation

uses untDMInloco, untCadClientes, untPrincipal, untVendas;

{$R *.DFM}

procedure TfrmLocClientes.FormShow(Sender: TObject);
begin
DMInloco.tblClientes.IndexName:='Descr_Cliente';
reg:=DMInloco.tblClientes.GetBookmark;
edtProcurar.SetFocus;
end;

procedure TfrmLocClientes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if not venda then
   Case frmCadClientes.rdgClassClientes.ItemIndex of
      0: DMInloco.tblClientes.IndexName := '';
      2: DMInloco.tblClientes.IndexName := '';
      { Fazer classificacao por profisao}
      end;
DMInloco.tblClientes.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocClientes.edtProcurarChange(Sender: TObject);
begin
DMInloco.tblClientes.FindNearest([edtProcurar.Text]);
end;

procedure TfrmLocClientes.btnOkClick(Sender: TObject);
var
   reg:TBookMark;
begin
if Venda then
   begin
   reg:=DMInloco.tblCtaReceber.GetBookmark;
   DMInloco.tblCtaReceber.First;
   While not DMInloco.tblCtaReceber.EOF do
      begin
      DMInloco.tblCtaReceber.Edit;
      DMInloco.tblCtaReceberCod_Cliente.Value:=
      DMInloco.tblClientesCod_Cliente.Value;
      DMInloco.tblCtaReceber.Post;
      DMInloco.tblCtaReceber.Next;
      end;
   DMInloco.tblCtaReceber.GotoBookmark(reg);
   DMInloco.tblCtaReceber.FreeBookmark(reg);
   DMInloco.tblCtaReceber.Edit;
   end
else
   begin
   frmCadClientes.btnPrimeiro.Enabled:=True;
   frmCadClientes.btnAnterior.Enabled:=True;
   frmCadClientes.btnProximo.Enabled:=True;
   frmCadClientes.btnUltimo.Enabled:=True;
   end;
end;

procedure TfrmLocClientes.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblClientes.GotoBookmark(reg);
Close;
end;

end.
