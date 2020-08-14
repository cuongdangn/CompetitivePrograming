const   finp    =       '';
        fout    =       '';
type    mang    =       array[1..2000] of char;
var     g,f     :       text;
        a,b     :       mang;
        d       :       array[0..2000,0..2000] of longint;
        l1,l2,k :       longint;
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
begin
        while not seekeoln(f) do
        begin
                inc(l1);
                read(f,a[l1]);
        end;
        readln(f);
        while not seekeoln(f) do
        begin
                inc(l2);
                read(f,b[l2]);
        end;
        readln(f,k);
end;
function        min(i,j:longint):longint;
var     x,y     :       longint;
begin
     if 2*k  > abs(ord(a[i])-ord(b[j])) then x:=d[i-1,j-1]+abs(ord(a[i])-ord(b[j]))
     else x:=d[i-1,j-1]+2*k;
     if d[i-1,j]>d[i,j-1] then y:=d[i,j-1]+k else y:=d[i-1,j]+k;
     min:=(-abs(y-x)+x+y) div 2;
end;
procedure       QHD;
var     i,j     :       longint;
begin

         for i:=1 to l2 do
          begin
          d[0,i]:=k*i;
          end;
         for i:=1 to l1 do
          begin
                d[i,0]:=k*i;
          end;
          for i:=1 to l1 do
          for j:=1 to l2 do
           begin
            d[i,j]:=min(i,j);
           end;
          writeln(g,d[l1,l2]);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.
