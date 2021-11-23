//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untDepositoCartoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TfrmDepositoCartoes = class(TForm)
    GroupBox1: TGroupBox;
    dbgCartoes: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblDataDeposito: TLabel;
    edtDataDeposito: TDBEdit;
    btnSair: TBitBtn;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgCartoesCellClick(Column: TColumn);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDepositoCartoes: TfrmDepositoCartoes;

implementation

uses untDMInloco;

{$R *.DFM}

procedure SomenteLeitura;
begin
   frmDepositoCartoes.lblDataDeposito.Visible:=False;
   frmDepositoCartoes.edtDataDeposito.Visible:=False;
   frmDepositoCartoes.btnOk.Visible:=False;
   frmDepositoCartoes.btnCancelar.Visible:=False;
   frmDepositoCartoes.btnSair.Enabled:=True;
   frmDepositoCartoes.dbgCartoes.Enabled:=True;
   frmDepositoCartoes.dbgCartoes.SetFocus;
end;

procedure TfrmDepositoCartoes.FormShow(Sender: TObject);
begin
DMInloco.tblCtaReceber.MasterFields:='';
DMInloco.tblCtaReceber.Filter:='Cod_Forma_Pagto=3 and Data_Deposito_Cartao=Null';
DMInloco.tblCtaReceber.Open;
DMInloco.tblCtaReceber.Filtered:=True;
end;

procedure TfrmDepositoCartoes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblCtaReceber.MasterFields:='Data_Venda;Cod_Venda';
DMInloco.tblCtaReceber.Close;
DMInloco.tblCtaReceber.Filtered:=False;
Action:=caFree;
end;

procedure TfrmDepositoCartoes.dbgCartoesCellClick(Column: TColumn);
begin
lblDataDeposito.Visible:=True;
edtDataDeposito.Visible:=True;
btnOk.Visible:=True;
btnCancelar.Visible:=True;
btnSair.Enabled:=False;
dbgCartoes.Enabled:=False;
DMInloco.tblCtaReceber.Edit;
DMInloco.tblCtaReceberData_Deposito_Cartao.Value:=Date;
edtDataDeposito.SetFocus;
end;

procedure TfrmDepositoCartoes.btnOkClick(Sender: TObject);
begin
SomenteLeitura;
DMInloco.tblCartoesCredito.Open;
DMInloco.tblCartoesCredito.IndexName:='';
DMInloco.tblCtaReceberData_Vencimento.Value:=
DMInloco.tblCtaReceberData_Deposito_Cartao.Value+
DMInloco.tblCartoesCredito.Lookup('Cod_Cartao',
DMInloco.tblCtaReceberCod_Cartao.Value,'Tempo_Recebimento');
DMInloco.tblCtaReceber.Post;
DMInloco.tblCartoesCredito.Close;
end;

procedure TfrmDepositoCartoes.btnCancelarClick(Sender: TObject);
begin
SomenteLeitura;
DMInloco.tblCtaReceber.Cancel;
end;

procedure TfrmDepositoCartoes.btnSairClick(Sender: TObject);
begin
Close;
end;

end.
