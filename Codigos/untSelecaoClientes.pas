//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untSelecaoClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, DBCtrls, ExtCtrls;

type
  TfrmSelecaoClientes = class(TForm)
    Bevel1: TBevel;
    rdgSexo: TRadioGroup;
    rdgProfissao: TRadioGroup;
    rdgNiver: TRadioGroup;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    cmbProfissoes: TDBLookupComboBox;
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
  frmSelecaoClientes: TfrmSelecaoClientes;

implementation

uses untDMInloco, untRptCliEtiquetas;

{$R *.DFM}

procedure TfrmSelecaoClientes.btnOkClick(Sender: TObject);
begin
DMInloco.tblClientes.Open;
DMInloco.tblClientes.IndexName:='Descr_Cliente';
DMInloco.tblClientes.Filter:='';
Case rdgSexo.ItemIndex of
   1:DMInloco.tblClientes.Filter:='Sexo='+#39+'F'+#39;
   2:DMInloco.tblClientes.Filter:='Sexo='+#39+'M'+#39;
   end;
if rdgProfissao.ItemIndex=1 then
   if DMInloco.tblClientes.Filter='' then
      DMInloco.tblClientes.Filter:='Cod_Profissao='+
      DMInloco.tblCliProfissoesCod_Profissao.AsString
   else
      DMInloco.tblClientes.Filter:=DMInloco.tblClientes.Filter+
      ' and Cod_Profissao='+DMInloco.tblCliProfissoesCod_Profissao.AsString;
if rdgNiver.ItemIndex=1 then niver:=true;
DMInloco.tblClientes.Filtered:=True;
rptCliEtiquetas.Preview;
DMInloco.tblClientes.Filtered:=False;
DMInloco.tblClientes.IndexName:='';
DMInloco.tblClientes.Close;
niver:=False;
Close;
end;

procedure TfrmSelecaoClientes.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmSelecaoClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMInloco.tblCliProfissoes.IndexName:='';
DMInloco.tblCliProfissoes.Close;
Action:=caFree;
end;

procedure TfrmSelecaoClientes.FormShow(Sender: TObject);
begin
DMInloco.tblCliProfissoes.Open;
DMInloco.tblCliProfissoes.IndexName:='Descr_Profissao';
end;

end.
