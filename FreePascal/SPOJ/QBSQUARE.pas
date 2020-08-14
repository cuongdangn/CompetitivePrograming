uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,kq     :       longint;
        a,d     :       array[0..1000,0..1000] of longint;
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
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do
         begin
          for j:=1 to m do read(f,a[i,j]);
          readln(f);
         end;
end;
procedure       QHD;
var     i,j     :       longint;
begin
        for i:=1 to n do
         d[i,0]:=1;
         for j:=1 to m do
          d[0,j]:=1;
          for i:=1 to n do
           for j:=1 to m do
            begin
             if (a[i,j]=a[i-1,j-1])and(a[i,j]=a[i-1,j]) and(a[i,j]=a[i,j-1]) then
              d[i,j]:=min(d[i-1,j-1],min(d[i,j-1],d[i-1,j]))+1
              else d[i,j]:=1;
             kq:=max(kq,d[i,j]);
            end;
            writeln(g,kq);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.
