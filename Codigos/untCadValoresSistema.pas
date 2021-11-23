//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadValoresSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TfrmCadValoresSistema = class(TForm)
    Panel1: TPanel;
    btnAlterar: TSpeedButton;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edtHENormal: TDBEdit;
    edtHEExcedente: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadValoresSistema: TfrmCadValoresSistema;

implementation

uses untDMInloco;

{$R *.DFM}

procedure SomenteLeitura;
begin
frmCadValoresSistema.btnAlterar.Enabled:=True;
frmCadValoresSistema.btnOk.Enabled:=False;
frmCadValoresSistema.btnCancelar.Enabled:=False;
frmCadValoresSistema.btnSair.Enabled:=True;
frmCadValoresSistema.Panel1.SetFocus;
end;

procedure TfrmCadValoresSistema.FormShow(Sender: TObject);
begin
DMInloco.tblValoresSistema.Open;
DMInloco.tblValoresSistema.First;
SomenteLeitura;
end;

procedure TfrmCadValoresSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMInloco.tblValoresSistema.Close;
Action:=caFree;
end;

procedure TfrmCadValoresSistema.btnAlterarClick(Sender: TObject);
begin
btnAlterar.Enabled:=False;
btnOk.Enabled:=True;
btnCancelar.Enabled:=True;
btnSair.Enabled:=False;
DMInloco.tblValoresSistema.Edit;
edtHENormal.SetFocus;
end;

procedure TfrmCadValoresSistema.btnOkClick(Sender: TObject);
begin
if DMInloco.tblValoresSistemaValor_HENormais.IsNull then
   DMInloco.tblValoresSistemaValor_HENormais.Value:=0;
if DMInloco.tblValoresSistemaValor_HEExcedentes.IsNull then
   DMInloco.tblValoresSistemaValor_HEExcedentes.Value:=0;
DMInloco.tblValoresSistema.Post;
SomenteLeitura;
end;

procedure TfrmCadValoresSistema.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblValoresSistema.Cancel;
SomenteLeitura;
end;

procedure TfrmCadValoresSistema.btnSairClick(Sender: TObject);
begin
Close;
end;

end.
