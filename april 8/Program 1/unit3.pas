unit Unit3;

interface

uses
  sysutils;

procedure OpenInput (filepath:string ; var x:real; var y : real);
procedure SaveInput (filepath:string ; x:real; y :real);
function znak(zn:char; x,y:real):real ;


implementation



function znak(zn:char; x,y:real):real ;
begin
    case zn of
    '+': Result:=x + y;
    '-': Result:=x - y;
    '*': Result:=x * y;
    end;


end;

procedure OpenInput (filepath:string ; var x : real; var y : real);
var s,s1 : string;
  f: text;
begin

   AssignFile(f,filepath);
   Reset(f);
   Readln(f,s);
   Readln(f,s1);
   x:=StrToFloat(s);
   y:=StrToFloat(s1);
   closeFile(f);
end;

procedure SaveInput (filepath:string ; x : real; y : real);
var
  f: text;
  s,s1: string;
begin
     s:= FloatToStr(x);
     s1:= FloatToStr(y);
     AssignFile(f,filepath);
     Rewrite(f);
     Writeln(f,s);
     Writeln(f,s1);
     CloseFile(f);
end;

end.

