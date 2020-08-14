Uses    Math;
Var     m,n,i,j,tmp                      : longint;
        Res                                  : longint;
Function Splay(x,y: longint): longint;//x>=y
var     dem     :       longint;
Begin
   dem:=-1;
   Repeat
      tmp:=x mod y;
      Inc(dem,x div y);
      x:=y;
      y:=tmp;
   Until y=0;
   If x<>1 then Exit(maxlongint);
   exit(dem);
End;
Procedure Process;
var     j   :   longint;
Begin
   readln(m);
   For j:=1 to m do
      begin
         ReadLn(n);
         Res:=maxlongint;
         For i:=1 to n do Res:=Min(Res,Splay(n,i));
         WriteLn(Res);
      end;
End;
begin
   Process;
end.
