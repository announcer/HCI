unit unit_brain;

interface

uses
  sysutils, Classes;


type

  Calculation = record
    num1, num2: real;
    result: real;

  end;

procedure OpenInput (filepath:string ; var x:real; var y : real; var error: boolean);
procedure SaveInput (filepath:string ; x:string; y :string);
function calc_result( x, y: real): real;

implementation



function calc_result(x,y: real): real ;
begin
    result:=(abs(x)-abs(y))/(1+abs(x*y));


end;

procedure OpenInput (filepath:string ; var x:real; var y : real; var error: boolean);
var s,s1 : string;
  f:text;
begin

   AssignFile(f,filepath);
   Reset(f);
   Readln(f,s);
   Readln(f,s1);
   if TryStrToFloat(s,x) or TryStrToFloat(s,y) = false then error:= true
   else
   begin
      x:=StrToFloat(s);
      y:=StrToFloat(s1);
   end;
   closeFile(f);
end;

procedure SaveInput (filepath:string ; x:string; y :string);
var
  f:text;
begin
     AssignFile(f,filepath);
     Rewrite(f);
     Writeln(f,x);
     Writeln(f,y);
     CloseFile(f);
end;











end.


