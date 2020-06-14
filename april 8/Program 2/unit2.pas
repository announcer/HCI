unit Unit2;

interface

uses
  sysutils;

procedure OpenInput (filepath:string ; var x:real; var y : real);
procedure SaveInput (filepath:string ; x:string; y :string);
function znak(x,y:real):real ;


implementation



function znak(x,y:real):real ;
begin
    result:=(abs(x)-abs(y))/(1+abs(x*y));


end;

procedure OpenInput (filepath:string ; var x:real; var y : real);
var s,s1 : string;
  f:text;
begin

   AssignFile(f,filepath);
   Reset(f);
   Readln(f,s);
   Readln(f,s1);
   x:=StrToFloat(s);
   y:=StrToFloat(s1);
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


