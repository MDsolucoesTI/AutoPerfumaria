//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelControleHorario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, DBCtrls, Mask, ExtCtrls;

type
  TfrmRelControleHorario = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblHNormais: TLabel;
    lblHENormais: TLabel;
    lblHEExcedentes: TLabel;
    lblValorHE1: TLabel;
    lblValorHE2: TLabel;
    lblQuantidade: TLabel;
    lblValores: TLabel;
    Label15: TLabel;
    lblHTrab: TLabel;
    lblValorHETotal: TLabel;
    btnPainel: TPanel;
    btnConsulta: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    Label2: TLabel;
    edtData1: TMaskEdit;
    Label3: TLabel;
    edtData2: TMaskEdit;
    cmbFuncionario: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cmbFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelControleHorario: TfrmRelControleHorario;

implementation

uses untDMInloco;

{$R *.DFM}

procedure SomaValores(var Hora1: String ; const Hora2: String);
var
   HoraInt,HoraInt1,HoraInt2,Minutos,Min1,Min2:integer;
begin
Min1:=StrToInt(Copy(Hora1,length(Hora1)-1,2));
Min2:=StrToInt(Copy(Hora2,length(Hora2)-1,2));
HoraInt1:=StrToInt(Copy(Hora1,1,length(Hora1)-3));
HoraInt2:=StrToInt(Copy(Hora2,1,length(Hora1)-3));
Minutos:=Min1+Min2;
HoraInt:=HoraInt1+HoraInt2;
if Minutos>=60 then
   begin
   HoraInt:=HoraInt+1;
   Minutos:=Minutos-60;
   end;
if Length(IntToStr(HoraInt))=1 then
   Hora1:='0'+IntToStr(HoraInt)+':'
else
   Hora1:=IntToStr(HoraInt)+':';
if Length(IntToStr(Minutos))=1 then
   Hora1:=Hora1+'0'+IntToStr(Minutos)
else
   Hora1:=Hora1+IntToStr(Minutos);
end;

procedure MostraValores;
var
   HNormais,HENormais,HEExcedentes,HTrab:String;
begin
HNormais:='00:00';
HENormais:='00:00';
HEExcedentes:='00:00';
HTrab:='00:00';
DMInloco.tblFuncHorarios.First;
While not DMInloco.tblFuncHorarios.EOF do
   begin
   SomaValores(HNormais,copy(DMInloco.tblFuncHorariosHoras_Normais.AsString,1,5));
   SomaValores(HENormais,copy(DMInloco.tblFuncHorariosHoras_Extras1.AsString,1,5));
   SomaValores(HEExcedentes,copy(DMInloco.tblFuncHorariosHoras_Extras2.AsString,1,5));
   DMInloco.tblFuncHorarios.Next;
   end;
SomaValores(HTrab,HENormais);
SomaValores(HTrab,HEExcedentes);
frmRelControleHorario.lblHNormais.Caption:=HNormais;
frmRelControleHorario.lblHENormais.Caption:=HENormais;
frmRelControleHorario.lblHEExcedentes.Caption:=HEExcedentes;
frmRelControleHorario.lblHTrab.Caption:=HTrab;
HENormais:=FloatToStrF
((StrToInt(copy(HENormais,1,length(HENormais)-3))*
DMInloco.tblFuncionariosValor_HENormal.Value+
StrToInt(copy(HENormais,length(HENormais)-1,2))*
DMInloco.tblFuncionariosValor_HENormal.Value/60),ffFixed,5,2);
HEExcedentes:=FloatToStrF
((StrToInt(copy(HEExcedentes,1,length(HEExcedentes)-3))*
DMInloco.tblFuncionariosValor_HEExcedente.Value+
StrToInt(copy(HEExcedentes,length(HEExcedentes)-1,2))*
DMInloco.tblFuncionariosValor_HEExcedente.Value/60),ffFixed,5,2);
HTrab:=FloatToStrF(StrToFloat(HENormais)+StrToFloat(HEExcedentes),ffFixed,5,2);
frmRelControleHorario.lblValorHE1.Caption:=HENormais;
frmRelControleHorario.lblValorHE2.Caption:=HEExcedentes;
frmRelControleHorario.lblValorHETotal.Caption:=HTrab;
end;

procedure TfrmRelControleHorario.FormShow(Sender: TObject);
var
   mes:string;
begin
mes:=DateToStr(date);
mes:=copy(mes,4,5);
//mes:=copy(mes,4,7);
DMInloco.tblFuncionarios.Open;
DMInloco.tblFuncHorarios.Open;
DMInloco.tblFuncionarios.First;
DMInloco.tblFuncHorarios.Filter:='Data>='+#39+'01/'+mes+#39;
DMInloco.tblFuncHorarios.Filtered:=True;
MostraValores;
DMInloco.tblFuncHorarios.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
edtData1.Text:='01/'+mes;
cmbFuncionario.SetFocus;
end;

procedure TfrmRelControleHorario.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblFuncHorarios.Filtered:=False;
DMInloco.tblFuncionarios.Close;
DMInloco.tblFuncHorarios.Close;
Action:=caFree;
end;

procedure TfrmRelControleHorario.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmRelControleHorario.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblFuncHorarios.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmRelControleHorario.btnProximoClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblFuncHorarios.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmRelControleHorario.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmRelControleHorario.btnConsultaClick(Sender: TObject);
begin
DMInloco.tblFuncHorarios.Filtered:=False;
if edtData1.Text='  /  /  ' then
   if edtData2.Text='  /  /  ' then
      DMInloco.tblFuncHorarios.Filter:=''
   else
      DMInloco.tblFuncHorarios.Filter:=
      'Data<='+#39+edtData2.Text+#39
else
   if edtData2.Text='  /  /  ' then
      DMInloco.tblFuncHorarios.Filter:=
      'Data>='+#39+edtData1.Text+#39
   else
      DMInloco.tblFuncHorarios.Filter:=
      '(Data>='+#39+edtData1.Text+#39+
      ') and (Data<='+#39+edtData2.Text+#39+')';
DMInloco.tblFuncHorarios.Filtered:=True;
MostraValores;
DMInloco.tblFuncHorarios.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
cmbFuncionario.SetFocus;
end;

procedure TfrmRelControleHorario.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRelControleHorario.cmbFuncionarioClick(Sender: TObject);
begin
MostraValores;
end;

end.
