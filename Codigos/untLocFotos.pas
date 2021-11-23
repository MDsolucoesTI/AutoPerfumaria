//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untLocFotos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, FileCtrl;

type
  TfrmLocFotos = class(TForm)
    cmbLocalizar: TDriveComboBox;
    cmbTipoArquivo: TFilterComboBox;
    lstArquivos: TFileListBox;
    lstPastas: TDirectoryListBox;
    lblLocalizar: TLabel;
    lblArquivos: TLabel;
    lblTipoArquivo: TLabel;
    edtArquivo: TEdit;
    lblPastas: TLabel;
    lblNomeArquivo: TLabel;
    btnOk: TButton;
    btnCancelar: TButton;
    imgGrupo: TImage;
    lblImagem: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    procedure btnCancelarClick(Sender: TObject);
    procedure lstArquivosClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lstPastasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocFotos: TfrmLocFotos;

implementation

uses untPropriedades;

{$R *.DFM}

procedure TfrmLocFotos.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmLocFotos.lstArquivosClick(Sender: TObject);
begin
imgGrupo.Picture.LoadFromFile(lstArquivos.FileName);
end;

procedure TfrmLocFotos.btnOkClick(Sender: TObject);
begin
frmPropriedades.imgGrupo.Picture.LoadFromFile(lstArquivos.FileName);
Close;
end;

procedure TfrmLocFotos.lstPastasClick(Sender: TObject);
begin
imgGrupo.Picture := nil ;
end;

procedure TfrmLocFotos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
