uses    math;
const   finp    =       '';
        fout    =       '';
        maxx    =       trunc(1e18);
var     g,f     :       text;
        d       :       array[0..2001,0..2001] of int64;
        a       :       array[1..2000] of int64;
        kq      :       int64;
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
var     i,j:    longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,j     :       longint;
        t       :       int64;
begin
        for i:=1 to n do
         d[i,i]:=a[i]*n;
        for i:=2 to n do
         begin
          for j:=1 to n-i+1 do
           d[j,j+i-1]:=max(d[j,j+i-2]+a[j+i-1]*(n-i+1),d[j+1,j+i-1]+a[j]*(n-i+1));
          end;
          writeln(g,d[1,n]);
end;
begin
        mo;
        doc;
        xuly;
        dong
end.
