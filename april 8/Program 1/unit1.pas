unit Unit1;

{$mode objfpc}{$H+}

interface



uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, Unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Add: TButton;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Mult: TButton;
    Diff: TButton;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    Num1: TEdit;
    Num2: TEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    procedure AddClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MultClick(Sender: TObject);
    procedure DiffClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Num1Change(Sender: TObject);
    procedure Num1Enter(Sender: TObject);
    procedure Num1Exit(Sender: TObject);
    procedure Num2Enter(Sender: TObject);
    procedure Num2Exit(Sender: TObject);
    procedure calculate (zn:char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.calculate (zn:char);
var result,n1,n2: real;
    
begin
if TryStrToFloat(Num1.Text, n1) and TryStrToFloat(Num2.Text, n2) = true then
begin
result:=znak(zn,StrToFloat(Form1.Num1.Text), StrToFloat(Form1.Num2.Text));

Form1.Memo1.Lines.Add('Первое число: ' + Form1.Num1.Text);
    Form1.Memo1.Lines.Add('Второе число: ' + Form1.Num2.Text);
    case zn of
    '+': Form1.Memo1.Lines.Add('Операция: Сложение');
    '-': Form1.Memo1.Lines.Add('Операция: Вычитание');
    '*': Form1.Memo1.Lines.Add('Операция: Умножение');
    end;
    Form1.Memo1.Lines.Add('Результат: ' + FloatToStr(Result));
    Form1.Memo1.Lines.Add('---------------------------------------');
end
else
ShowMessage('Неккоректный ввод чисел');
end;


procedure TForm1.AddClick(Sender: TObject);
begin

 calculate('+');

end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if SaveDialog2.Execute then
  Memo1.Lines.SaveToFile(SaveDialog2.FileName);

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  ShowMessage('Скубиев.Н | ИВТ-19-2 '+#13#10+'Задача №1 из задачника');
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var FileN: string; x,y : real;
begin
if OpenDialog1.Execute then
begin

   FileN := OpenDialog1.FileName;

   try
    OpenInput(FileN,x,y);
    Num1.Text:=FloatToStr(x);
    Num2.Text:=FloatToStr(y);

   except

    ShowMessage('Не удалось открыть файл');
    exit;

   end;
end;

end;


procedure TForm1.MenuItem6Click(Sender: TObject);
var FileN: string;
    x,y : real;
begin
  if SaveDialog1.Execute then
  begin
    FileN := SaveDialog1.FileName;
    x:= StrToFloat(Num1.Text);
    y:= StrToFloat(Num2.Text);

    SaveInput(FileN,x,y);
  end;


end;

procedure TForm1.MultClick(Sender: TObject);
begin

  calculate('*');
end;

procedure TForm1.DiffClick(Sender: TObject);
begin
  calculate('-');

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;



procedure TForm1.Memo1Change(Sender: TObject);

begin


end;


procedure TForm1.Num1Change(Sender: TObject);
begin

end;

procedure TForm1.Num1Enter(Sender: TObject);
begin
  Num1.Color:= clWhite
end;

procedure TForm1.Num1Exit(Sender: TObject);
begin
  Num1.Color:= clSilver
end;

procedure TForm1.Num2Enter(Sender: TObject);
begin
  Num2.Color:= clWhite
end;

procedure TForm1.Num2Exit(Sender: TObject);
begin
  Num2.Color:= clSilver
end;

end.

