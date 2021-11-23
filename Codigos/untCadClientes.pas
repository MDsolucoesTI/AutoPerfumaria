//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/1998
// Sistema...........: Sistema de Automação de Perfumaria
// Analistas.........: Denny Paulista Azevedo Filho
// Desenvolvedores...: Denny Paulista Azevedo Filho
// Copyright.........: Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TfrmCadClientes = class(TForm)
    lblCodCliente: TLabel;
    lblCliente: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUf: TLabel;
    lblCep: TLabel;
    lblTelCom: TLabel;
    lblTelRes: TLabel;
    lblCpf: TLabel;
    lblRg: TLabel;
    lblDataNiver: TLabel;
    lblProfissao: TLabel;
    btnProfissoes: TButton;
    btnPainel: TPanel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnTabela: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    edtCliente: TDBEdit;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    edtCidade: TDBEdit;
    edtUf: TDBEdit;
    edtCep: TDBEdit;
    edtTelRes: TDBEdit;
    edtTelCom: TDBEdit;
    edtCpf: TDBEdit;
    edtRg: TDBEdit;
    edtDataNiver: TDBEdit;
    cmbProfissao: TDBLookupComboBox;
    txtCodCliente: TDBText;
    Bevel1: TBevel;
    rdgClassClientes: TRadioGroup;
    rdgSexo: TDBRadioGroup;
    btnVoltar: TSpeedButton;
    dbgClientes: TDBGrid;
    procedure btnProfissoesClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure rdgClassClientesClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnTabelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtDataNiverExit(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;
  CadClientes: Boolean = False;

implementation

uses untCadProfissoes, untDMInloco, untLocClientes, untVendas;

{$R *.DFM}

procedure Escrita;
begin
frmCadClientes.btnPrimeiro.Enabled:=False;
frmCadClientes.btnAnterior.Enabled:=False;
frmCadClientes.btnProximo.Enabled:=False;
frmCadClientes.btnUltimo.Enabled:=False;
frmCadClientes.btnTabela.Enabled:=False;
frmCadClientes.btnVoltar.Enabled:=False;
frmCadClientes.btnLocalizar.Enabled:=False;
frmCadClientes.btnEditar.Enabled:=False;
frmCadClientes.btnExcluir.Enabled:=False;
frmCadClientes.btnIncluir.Enabled:=False;
frmCadClientes.btnSair.Enabled:=False;
frmCadClientes.btnConfirmar.Enabled:=True;
frmCadClientes.btnCancelar.Enabled:=True;
frmCadClientes.rdgClassClientes.Enabled:=False;
frmCadClientes.edtCliente.SetFocus;
end;

procedure SomenteLeitura;
begin
frmCadClientes.btnPrimeiro.Enabled:=True;
frmCadClientes.btnAnterior.Enabled:=True;
frmCadClientes.btnProximo.Enabled:=True;
frmCadClientes.btnUltimo.Enabled:=True;
frmCadClientes.btnConfirmar.Enabled:=False;
frmCadClientes.btnCancelar.Enabled:=False;
frmCadClientes.btnTabela.Enabled:=True;
frmCadClientes.btnVoltar.Enabled:=True;
frmCadClientes.btnLocalizar.Enabled:=True;
frmCadClientes.btnEditar.Enabled:=True;
frmCadClientes.btnExcluir.Enabled:=True;
frmCadClientes.btnIncluir.Enabled:=True;
frmCadClientes.btnSair.Enabled:=True;
frmCadClientes.rdgClassClientes.Enabled:=True;
frmCadClientes.rdgClassClientes.SetFocus;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
var
   Codigo,i:integer;
begin
DMInloco.tblClientes.IndexName := '';
rdgClassClientes.ItemIndex:=0;
if Venda then
   begin
   dbgClientes.Visible:=False;
   Escrita;
   DMInloco.tblClientes.Last;
   codigo:=DMInloco.tblClientesCod_Cliente.AsInteger;
   DMInloco.tblClientes.First;
   for i:=1 to codigo do
      begin
      if DMInloco.tblClientesCod_Cliente.AsInteger<>i then
         begin
         codigo:=i-1;
         break;
         end;
      DMInloco.tblClientes.Next;
      end;
   DMInloco.tblClientes.Append;
   DMInloco.tblClientesCod_Cliente.AsInteger:=codigo+1;
   end
else
   begin
   DMInloco.tblClientes.Open;
   DMInloco.tblClientes.First;
   SomenteLeitura;
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
DMInloco.tblCliProfissoes.IndexName:='Descr_Profissao';
DMInloco.tblCliProfissoes.Open;
CadClientes:=True;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject;var Action: TCloseAction);
begin
DMInloco.tblClientes.IndexName:='';
DMInloco.tblCliProfissoes.IndexName:='';
if not Venda then
   DMInloco.tblClientes.Close;
DMInloco.tblCliProfissoes.Close;
CadClientes:=False;
Action:=caFree;
end;

procedure TfrmCadClientes.rdgClassClientesClick(Sender: TObject);
begin
   Case rdgClassClientes.ItemIndex of
      0: DMInloco.tblClientes.IndexName := '';
      1: DMInloco.tblClientes.IndexName := 'Descr_Cliente';
      2: DMInloco.tblClientes.IndexName := 'Profissao_Cliente';
   end;
   SomenteLeitura;
end;

procedure TfrmCadClientes.btnProfissoesClick(Sender: TObject);
begin
Application.CreateForm(TfrmCadProfissoes, frmCadProfissoes);
if frmCadProfissoes.rdgClassProfissoes.ItemIndex=0 then
   DMInloco.tblCliProfissoes.IndexName:='';
frmCadProfissoes.ShowModal;
end;

procedure TfrmCadClientes.btnPrimeiroClick(Sender: TObject);
begin
DMInloco.tblClientes.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadClientes.btnAnteriorClick(Sender: TObject);
begin
DMInloco.tblClientes.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
if DMInloco.tblClientes.BOF then
   begin
   btnPrimeiro.Enabled:=False;
   btnAnterior.Enabled:=False;
   end;
end;

procedure TfrmCadClientes.btnProximoClick(Sender: TObject);
begin
DMInloco.tblClientes.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
if DMInloco.tblClientes.EOF then
   begin
   btnProximo.Enabled:=False;
   btnUltimo.Enabled:=False;
   end;
end;

procedure TfrmCadClientes.btnUltimoClick(Sender: TObject);
begin
DMInloco.tblClientes.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadClientes.btnTabelaClick(Sender: TObject);
begin
dbgClientes.Visible:=True;
end;

procedure TfrmCadClientes.btnVoltarClick(Sender: TObject);
begin
dbgClientes.Visible:=False;
end;

procedure TfrmCadClientes.btnLocalizarClick(Sender: TObject);
begin
Application.CreateForm(TfrmLocClientes, frmLocClientes);
frmLocClientes.ShowModal;
end;

procedure TfrmCadClientes.btnEditarClick(Sender: TObject);
begin
dbgClientes.Visible:=False;
Escrita;
DMInloco.tblClientes.Edit;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
var
   Confirma:integer;
begin
Confirma:=Application.MessageBox('Deseja excluir esse Cliente?',
'Exclus�o de Registro',mb_YesNo+mb_IconQuestion+mb_DefButton2);
if Confirma=IDYES then
   DMInloco.tblClientes.Delete;
end;

procedure TfrmCadClientes.btnIncluirClick(Sender: TObject);
var
i,codigo:integer;
begin
dbgClientes.Visible:=False;
Escrita;
DMInloco.tblClientes.IndexName := '';
DMInloco.tblClientes.Last;
codigo:=DMInloco.tblClientesCod_Cliente.AsInteger;
DMInloco.tblClientes.First;
for i:=1 to codigo do
   begin
   if DMInloco.tblClientesCod_Cliente.AsInteger<>i then
      begin
      codigo:=i-1;
      break;
      end;
   DMInloco.tblClientes.Next;
   end;
DMInloco.tblClientes.Append;
DMInloco.tblClientesCod_Cliente.AsInteger:=codigo+1;
end;

procedure TfrmCadClientes.btnConfirmarClick(Sender: TObject);
begin
if length(edtCliente.Text)=0 then
   begin
   beep;
   MessageDlg('Nome do Cliente n�o pode estar vazio!',mtError,[mbOK],0);
   edtCliente.SetFocus;
   end
else if length(edtEndereco.Text)=0 then
   begin
   beep;
   MessageDlg('Endere�o n�o pode estar vazio!',mtError,[mbOK],0);
   edtEndereco.SetFocus;
   end
else if length(edtBairro.Text)=0 then
   begin
   beep;
   MessageDlg('Bairro n�o pode estar vazio!',mtError,[mbOK],0);
   edtBairro.SetFocus;
   end
else if length(edtCidade.Text)=0 then
   begin
   beep;
   MessageDlg('Cidade n�o pode estar vazia!',mtError,[mbOK],0);
   edtCidade.SetFocus;
   end
else if rdgSexo.ItemIndex=-1 then
   begin
   beep;
   MessageDlg('Sexo do cliente deve ser definido!',mtError,[mbOK],0);
   rdgSexo.SetFocus;
   end
else
   begin
   DMInloco.tblClientes.Post;
   if Venda then
      Close
   else
      begin
      Case rdgClassClientes.ItemIndex of
         1: DMInloco.tblClientes.IndexName := 'Descr_Cliente';
         2: DMInloco.tblClientes.IndexName := 'Profissao_Cliente';
         end;
      SomenteLeitura;
      if btnTabela.Down then dbgClientes.Visible:=True;
      end;
   end;
end;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
DMInloco.tblClientes.Cancel;
if Venda then
   Close
else
   begin
   Case rdgClassClientes.ItemIndex of
      1: DMInloco.tblClientes.IndexName := 'Descr_Cliente';
      2: DMInloco.tblClientes.IndexName := 'Profissao_Cliente';
      end;
   SomenteLeitura;
   if btnTabela.Down then dbgClientes.Visible:=True;
   end;
end;

procedure TfrmCadClientes.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadClientes.edtDataNiverExit(Sender: TObject);
var
  dia,mes:integer;
  erro:Boolean;
begin
erro:=False;
if (copy(edtDataNiver.Text,1,2)=' ') xor
   (copy(edtDataNiver.Text,4,2)=' ') then
   erro:=True
else if edtDataNiver.Text<>'  /  ' then
   begin
   dia:=StrToInt(copy(edtDataNiver.Text,1,2));
   mes:=StrToInt(copy(edtDataNiver.Text,4,2));
   if (mes>12) or (mes<=0) then
      erro:=True
   else if (dia>31) or (dia<=0) then
      erro:=True
   else case mes of
        4,6,9,11: if dia>30 then erro:=True;
        2: if dia>29 then erro:=True;
        end;
   end;
if erro then
   begin
   beep;
   MessageDlg('Data Inv�lida!',mtError,[mbOK],0);
   edtDataNiver.SetFocus;
   end;
end;

procedure TfrmCadClientes.edtCpfExit(Sender: TObject);
var
   i,code:integer;
   D2:Array[1..9] of integer;
   DF4, DF5, DF6, Resto, PriDig, SegDig: Integer;
   Texto, PriDig2, SegDig2: String;
begin
Texto:='';
Texto:=copy(edtCpf.Text,1,3);
Texto:=Texto+copy(edtCpf.Text,5,3);
Texto:=Texto+copy(edtCpf.Text,9,3);
Texto:=Texto+copy(edtCpf.Text,13,2);
if Texto<>'           ' then    
   begin
   For i:=1 to 9 do Val(Texto[i],D2[i],Code);
   DF4:=10*D2[1]+9*D2[2]+8*D2[3]+7*D2[4]+6*D2[5]+5*D2[6]+4*D2[7]+3*D2[8]+2*D2[9];
   DF5:=DF4 div 11;
   DF6:=DF5*11;
   Resto:=DF4-DF6;
   if (resto=0) or (resto=1) then
      PriDig:=0
   else
      PriDig:=11-Resto;
   DF4:=11*D2[1]+10*D2[2]+9*D2[3]+8*D2[4]+7*D2[5]+6*D2[6]+5*D2[7]+4*D2[8]+
        3*D2[9]+2*PriDig;
   DF5:=DF4 div 11;
   DF6:=DF5*11;
   Resto:=DF4-DF6;
   if (resto=0) or (resto=1) then
      SegDig:=0
   else
      SegDig:=11-Resto;
   Str(PriDig,PriDig2);
   Str(SegDig,SegDig2);
   if not (PriDig2=Texto[10]) or not (SegDig2=Texto[11]) then
      begin
      beep;
      MessageDlg('CPF inv�lido!',mtError,[mbOK],0);
      edtCpf.SetFocus;
      end;
   end;
end;

end.
