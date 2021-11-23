//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TfrmRelVendas = class(TForm)
    Label1: TLabel;
    btnPainel: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    edtData: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

uses untDMInloco, untRptVendas;

{$R *.DFM}

procedure TfrmRelVendas.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmRelVendas.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRelVendas.FormShow(Sender: TObject);
begin
DMInloco.tblDetVendas.Open;
edtData.Text:=DateToStr(date);
edtData.SetFocus;
end;

procedure TfrmRelVendas.btnImprimirClick(Sender: TObject);
begin
if edtData.Text='  /  /    ' then
   begin
   beep;
   MessageDlg('Data desejada deve ser especificada!',mtError,[mbOK],0);
   edtData.SetFocus;
   end
else
   begin
   DMInloco.tblDetVendas.Filter:='Data_Venda='+#39+edtData.Text+#39;
   DMInloco.tblDetVendas.Filtered:=True;
   DMInloco.tblDetVendas.MasterFields:='';
   DMInloco.tblDetVendas.MasterSource:=Nil;
   DMInloco.tblDetVendas.Open;
   if DMInloco.tblDetVendas.IsEmpty then
      begin
      beep;
      MessageDlg('N�o h� dados para serem impressos!',mtError,[mbOK],0);
      edtData.SetFocus;
      end
   else
      begin
      Application.CreateForm(TrptVendas, rptVendas);
      DMInloco.tblProdCategoria.Open;
      DMInloco.tblProdCategoria.IndexName:='Descr_Categoria';
      DMInloco.tblProdutos.MasterSource:=DMInloco.dscProdCategoria;
      DMInloco.tblProdutos.MasterFields:='Cod_Categoria';
      DMInloco.tblProdutos.IndexName:='Categoria_Prod';
      DMInloco.tblProdutos.Open;
      DMInloco.tblDetVendas.IndexFieldNames:='Cod_Produto';
      DMInloco.tblDetVendas.MasterSource:=DMInloco.dscProdutos;
      DMInloco.tblDetVendas.MasterFields:='Cod_Produto';
      rptVendas.relVendas.Preview;
      DMInloco.tblProdCategoria.IndexName:='';
      DMInloco.tblProdCategoria.Close;
      DMInloco.tblProdutos.MasterSource:=Nil;
      DMInloco.tblProdutos.MasterFields:='';
      DMInloco.tblProdutos.IndexName:='';
      DMInloco.tblProdutos.Close;
      DMInloco.tblDetVendas.MasterFields:='';
      DMInloco.tblDetVendas.IndexName:='';
      DMInloco.tblDetVendas.IndexFieldNames:='Data_Venda;Cod_Venda';
      end;
   DMInloco.tblDetVendas.MasterSource:=DMInloco.dscVendas;
   DMInloco.tblDetVendas.MasterFields:='Data_Venda;Cod_Venda';
   DMInloco.tblDetVendas.Filtered:=False;
   DMInloco.tblDetVendas.Close;
   end;
end;

end.
