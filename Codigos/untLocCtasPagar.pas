//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocCtasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmLocCtasPagar = class(TForm)
    lblProcurar: TLabel;
    edtCtaPagar: TEdit;
    dbgCtasPagar: TDBGrid;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    rdgPesquisa: TRadioGroup;
    cmbFornecedores: TDBLookupComboBox;
    procedure rdgPesquisaClick(Sender: TObject);
    procedure cmbFornecedoresClick(Sender: TObject);
    procedure edtCtaPagarChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCtasPagar: TfrmLocCtasPagar;

implementation

uses untDMInloco, untPrincipal, untCadCtasPagar;

{$R *.DFM}

procedure TfrmLocCtasPagar.FormShow(Sender: TObject);
begin
DMInloco.tblCtaPagar.IndexName:='Cod_Fornecedor';
reg:=DMInloco.tblCtaPagar.GetBookmark;
cmbFornecedores.SetFocus;
end;

procedure TfrmLocCtasPagar.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblCtaPagar.IndexName:='';
DMInloco.tblCtaPagar.FreeBookmark(reg);
Action:=caFree;
end;

procedure TfrmLocCtasPagar.rdgPesquisaClick(Sender: TObject);
begin
case rdgPesquisa.ItemIndex of
   0: begin
      DMInloco.tblCtaPagar.IndexName:= '';
      edtCtaPagar.Visible:=True;
      cmbFornecedores.Visible:=False;
      edtCtaPagar.SetFocus;
      end;
   1: begin
      DMInloco.tblCtaPagar.IndexName:= 'Cod_Fornecedor';
      edtCtaPagar.Visible:=False;
      cmbFornecedores.Visible:=True;
      cmbFornecedores.SetFocus;
      end;
   end;
end;

procedure TfrmLocCtasPagar.cmbFornecedoresClick(Sender: TObject);
begin
if not DMInloco.tblCtaPagar.FindKey([DMInloco.tblFornecedoresCod_Fornecedor])
   then
   begin
   beep;
   MessageDlg('N�o h� conta a pagar desse fornecedor!',mtInformation,
    [mbOK],0);
   cmbFornecedores.SetFocus;
   end;
end;

procedure TfrmLocCtasPagar.edtCtaPagarChange(Sender: TObject);
begin
DMInloco.tblCtaPagar.FindNearest([edtCtaPagar.Text]);
end;

procedure TfrmLocCtasPagar.btnOkClick(Sender: TObject);
begin
frmCadCtasPagar.btnPrimeiro.Enabled:=True;
frmCadCtasPagar.btnAnterior.Enabled:=True;
frmCadCtasPagar.btnProximo.Enabled:=True;
frmCadCtasPagar.btnUltimo.Enabled:=True;
Close;
end;

procedure TfrmLocCtasPagar.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblCtaPagar.GotoBookmark(reg);
Close;
end;

end.
