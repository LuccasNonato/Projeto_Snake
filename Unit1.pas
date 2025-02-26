unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TBuraco = class
  private
    FProfundidade: Integer;
    FSubida: Integer;
    FDescida: Integer;
    FPosicao: Integer;
    FContadorSubidas: Integer;

  public

    constructor Create(profundidade, subida, descida: Integer);

    function Profundidade(Value: Integer): Integer; overload;
    function Profundidade: Integer; overload;

    function Subida(Value: Integer): Integer; overload;
    function Subida: Integer; overload;

    function Descida(Value: Integer): Integer; overload;
    function Descida: Integer; overload;

    function Posicao(Value: Integer): Integer; overload;
    function Posicao: Integer; overload;

    function ContadorSubidas(Value: Integer): Integer; overload;
    function ContadorSubidas: Integer; overload;

    procedure MinhocaSubida;
    procedure MinhocaDescida;
    function ChegouMetade: Boolean;
    function SaiuDoBuraco: Boolean;
  end;

  TForm1 = class(TForm)
    EditProfundidade: TEdit;
    EditSubida: TEdit;
    EditDescida: TEdit;
    Button1: TButton;
    MemoLog: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TBuraco }

constructor TBuraco.Create(profundidade, subida, descida: Integer);
begin
  FProfundidade := profundidade;
  FSubida := subida;
  FDescida := descida;
  FPosicao := 0;
  FContadorSubidas := 0;
end;

function TBuraco.Profundidade(Value: Integer): Integer;
begin
  FProfundidade := Value;
  Result := FProfundidade;
end;

function TBuraco.Profundidade: Integer;
begin
  Result := FProfundidade;
end;

function TBuraco.Subida(Value: Integer): Integer;
begin
  FSubida := Value;
  Result := FSubida;
end;

function TBuraco.Subida: Integer;
begin
  Result := FSubida;
end;

function TBuraco.Descida(Value: Integer): Integer;
begin
  FDescida := Value;
  Result := FDescida;
end;

function TBuraco.Descida: Integer;
begin
  Result := FDescida;
end;

function TBuraco.Posicao(Value: Integer): Integer;
begin
  FPosicao := Value;
  Result := FPosicao;
end;

function TBuraco.Posicao: Integer;
begin
  Result := FPosicao;
end;

function TBuraco.ContadorSubidas(Value: Integer): Integer;
begin
  FContadorSubidas := Value;
  Result := FContadorSubidas;
end;

function TBuraco.ContadorSubidas: Integer;
begin
  Result := FContadorSubidas;
end;

procedure TBuraco.MinhocaSubida;
begin
  FPosicao := FPosicao + FSubida;
  FContadorSubidas := FContadorSubidas + 1;
end;

procedure TBuraco.MinhocaDescida;
begin
  FPosicao := FPosicao - FDescida;
end;

function TBuraco.ChegouMetade: Boolean;
begin
  Result := FPosicao >= (FProfundidade/2);
end;

function TBuraco.SaiuDoBuraco: Boolean;
begin
  Result := FPosicao >= FProfundidade;
end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  Buraco: TBuraco;
begin


  MemoLog.Text := '';

  Buraco := TBuraco.Create(
    StrToInt(EditProfundidade.Text),
    StrToInt(EditSubida.Text),
    StrToInt(EditDescida.Text)
  );

  if Buraco.Descida >= Buraco.Subida then
  begin
   ShowMessage('Com a descida maior que a subida a minhoca nunca sairá do buraco ');
   exit;
  end;

  if (Buraco.Profundidade <= 0)
     or (Buraco.Subida <= 0)
     or (Buraco.Descida <= 0) then
  begin
   ShowMessage('Profundidade Não pode ser 0');
   exit;
  end;


  try
    while not Buraco.SaiuDoBuraco do
    begin
      Buraco.MinhocaSubida;

       MemoLog.Lines.Add('Subida: Posição = ' + IntToStr(Buraco.Posicao) + ', Subidas realizadas = ' + IntToStr(Buraco.ContadorSubidas));

      if Buraco.ChegouMetade and not Buraco.SaiuDoBuraco then
      begin
        Form1.Color := clYellow;
        MemoLog.Lines.Add('Atingiu a metade do buraco!');
      end;

      if Buraco.SaiuDoBuraco then
      begin
        Form1.Color := clGreen;
         MemoLog.Lines.Add('A minhoca saiu do buraco! Subidas realizadas = ' + IntToStr(Buraco.ContadorSubidas));
        ShowMessage('A minhoca saiu do buraco! Subidas: ' + IntToStr(Buraco.ContadorSubidas));
        Break;
      end;

      Buraco.MinhocaDescida;

      MemoLog.Lines.Add('Descida: Posição = ' + IntToStr(Buraco.Posicao));
      MemoLog.Lines.Add('-------------------------');

      Sleep(1000);
    end;
  finally
    Buraco.Free;
  end;
end;

end.
