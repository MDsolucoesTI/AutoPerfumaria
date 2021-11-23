//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRecebto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TfrmCadRecebtos = class(TForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox4: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox5: TGroupBox;
    DBGrid5: TDBGrid;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    lblDataRecebimento: TLabel;
    lblValor: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRecebtos: TfrmCadRecebtos;

implementation

uses untDMInloco;

{$R *.DFM}





end.
