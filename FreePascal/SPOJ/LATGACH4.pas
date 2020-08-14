const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[0..1000000] of int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       kt;
var     i:longint;
begin
        a[1]:=1;
        a[0]:=1;
        for i:=2 to 1000000 do
        a[i]:=(a[i-1]+a[i-2]) mod 111539786;
end;
function       tinh(x:int64):int64;
var           tg,z,y:int64;
begin
        if x<=1000000 then exit(a[x])
        else
                begin
                     if x mod 2 =1 then
                     begin
                     tg:=x div 2;
                     y:=tinh(tg)   mod 111539786;
                     z:=tinh(tg-1) mod 111539786;
                     exit((2*z mod 111539786+y mod 111539786)*y mod 111539786);
                     end
                     else
                     begin
                         tg:=(x+1) div 2;
                         y:=tinh(tg)   mod 111539786;
                         z:=tinh(tg-1) mod 111539786;
                         exit((sqr(z) mod 111539786+sqr(y) mod 111539786) mod 111539786);
                     end;
                end;

end;
procedure       doc;
var     t,x       :       int64;i:longint;
begin
         readln(f,t);
         for i:=1 to t do
                begin
                  readln(f,x);
                  if x<=1000000 then writeln(g,a[x])
                  else
                  begin
                  x:=tinh(x) mod 111539786;
                  writeln(g,x);
                  end;
                end;
end;
begin
        mo;
        kt;
        doc;
        dong;
end.


