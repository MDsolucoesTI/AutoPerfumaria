//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCorFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ColorGrd, StdCtrls;

type
  TfrmCorFundo = class(TForm)
    ColorGrid1: TColorGrid;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorFundo: TfrmCorFundo;

implementation

{$R *.DFM}

procedure TfrmCorFundo.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
