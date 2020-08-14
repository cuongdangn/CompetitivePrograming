uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        kq      :       int64;
        n,m     :       longint;
        d1,d2,d3,d4     :       array[0..1009,0..1009] of int64;
        a       :array[1..1000,1..1000] of int64;
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
        readln(f,m,n);
        for i:=1 to m do
         for j:=1 to n do read(f,a[i,j]);
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          d1[i,j]:=max(d1[i-1,j],d1[i,j-1])+a[i,j];
        for i:=m downto 1 do
         for j:=n downto 1 do
          d2[i,j]:=max(d2[i,j+1],d2[i+1,j])+a[i,j];
        for i:=m downto 1 do
         for j:=1 to n do
           d3[i,j]:=max(d3[i,j-1],d3[i+1,j])+a[i,j];
         for i:=1 to m do
          for j:=n downto 1 do
           d4[i,j]:=max(d4[i-1,j],d4[i,j+1])+a[i,j];
end;
procedure       xuly;
var     i,j     :       longint;
begin
        init;
        for i:=2 to m-1 do
         for j:=2 to n-1 do
         begin
                kq:=max(kq,d1[i-1,j]+d2[i+1,j]+d3[i,j-1]+d4[i,j+1]);
                kq:=max(kq,d1[i,j-1]+d2[i,j+1]+d3[i+1,j]+d4[i-1,j]);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.