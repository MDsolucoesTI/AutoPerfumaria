//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untConsultarVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Mask, DBCtrls, ComCtrls;

type
  TfrmConsultarVendas = class(TForm)
    pgcCtaReceber: TPageControl;
    pgcVenda: TTabSheet;
    pgcCliente: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    pnlCliente: TPanel;
    Label9: TLabel;
    DBText9: TDBText;
    Label10: TLabel;
    DBText10: TDBText;
    Label12: TLabel;
    DBText12: TDBText;
    Label11: TLabel;
    DBText11: TDBText;
    Label13: TLabel;
    DBText13: TDBText;
    Label14: TLabel;
    DBText14: TDBText;
    Label17: TLabel;
    DBText16: TDBText;
    Label15: TLabel;
    DBText15: TDBText;
    Label18: TLabel;
    DBText17: TDBText;
    DBText1: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarVendas: TfrmConsultarVendas;

implementation

uses untDMInloco;

{$R *.DFM}

procedure TfrmConsultarVendas.FormShow(Sender: TObject);
begin
if DMInloco.tblCtaReceberCod_Cliente.IsNull then
   pnlCliente.Visible:=False
else
   pnlCliente.Visible:=True;
pgcCtaReceber.ActivePage:=pgcVenda;
end;

procedure TfrmConsultarVendas.FormClose(Sender: TObject;var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
