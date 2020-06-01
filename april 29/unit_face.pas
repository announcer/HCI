unit unit_face;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, Buttons, Grids, unit_brain;

type

  { TForm1 }

  TForm1 = class(TForm)
    Add: TButton;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Num1: TEdit;
    Num2: TEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    StringGrid1: TStringGrid;
    procedure AddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Num1Change(Sender: TObject);
    procedure Num1Enter(Sender: TObject);
    procedure Num1Exit(Sender: TObject);
    procedure Num2Change(Sender: TObject);
    procedure Num2Enter(Sender: TObject);
    procedure Num2Exit(Sender: TObject);
    procedure Save();

  private

  public

  end;

var
  Form1: TForm1;
  n1, n2, res: real;

  calculations: array [1..128] of Calculation;
  last_ind: integer;

implementation



{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin
  last_ind := 0;
end;



procedure TForm1.Save();
var
  f:text;
  i, k: integer;
  FileN: string;
 begin
 if SaveDialog2.Execute then
 begin
    FileN := SaveDialog2.FileName;
    AssignFile(f,FileN);
    Rewrite(f);
    with StringGrid1 do
    begin
       for i:= 1 to RowCount - 1 do
             begin
             k:= 1;
             writeln(f, 'Первое число: ' + Cells[k, i]);
             writeln(f, 'Второе число: ' + Cells[k+1, i]);
             writeln(f, 'Реультат: ' + Cells[k+2, i]);
             writeln(f,'------------------------------------');
             end;
     end;
     CloseFile(f);
end;

end;

procedure TForm1.AddClick(Sender: TObject);                                            

var
  last_calc : Calculation;
begin

  if TryStrToFloat (Num1.Text, n1) and TryStrToFloat (Num2.Text, n2) = true then
  begin

  res:= calc_result(n1,n2);

  last_calc.num1:= n1;
  last_calc.num2:= n2;
  last_calc.result:= res;

  inc(last_ind);

  calculations[last_ind]:= last_calc;

  StringGrid1.RowCount:= last_ind + 1;

  StringGrid1.Cells[1, last_ind]:= FloatToStr(n1);
  StringGrid1.Cells[2, last_ind]:= FloatToStr(n2);
  StringGrid1.Cells[3, last_ind]:= FloatToStr(res)



  end
  else
  ShowMessage('Неккоректный ввод чисел');
  end;





procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);

begin


end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   ShowMessage('Скубиев.Н | ИВТ-19-2 '+#13#10+'Задача №2 из задачника');

end;

procedure TForm1.MenuItem5Click(Sender: TObject);
 var
   FileN,s,s1: string;


 begin
   if SaveDialog1.Execute then
   begin
     FileN := SaveDialog1.FileName;
     s:=FloatToStr(n1);
     s1:=FloatToStr(n2);
     SaveInput(FileN,s,s1);
   end;


 end;

procedure TForm1.MenuItem6Click(Sender: TObject);
 begin
     Save();
 end;




procedure TForm1.MenuItem7Click(Sender: TObject);
 var
   FileN: string; x,y : real;
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

procedure TForm1.Num2Change(Sender: TObject);
begin

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












end.

