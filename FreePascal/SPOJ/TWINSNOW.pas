const   finp    =       '';
        fout    =       '';
type    arr     =       array[1..6] of longint;
var     g,f     :       text;
        a       :       array[1..100000] of arr;
        n       :       longint;
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
procedure       doc;
var     i,j       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         begin
           for j:=1 to 6 do read(f,a[i,j]);
           readln(f);
         end;
end;
function       lonhon(a,b      :       arr):boolean;
var     i      :        longint;
begin
        for i:=1 to 6 do
         if a[i]>b[i] then exit(true);
         exit(false);
end;
procedure       xoay(var a:arr);
var     i,t,j       :       longint;
        tg      :arr;
begin
        tg:=a;
        for i:=1 to 5 do
         begin
          t:=tg[1];
          for j:=1 to 5 do tg[i]:=tg[i+1];
          tg[6]:=t;
          if