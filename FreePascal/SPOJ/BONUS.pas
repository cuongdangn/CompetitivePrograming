uses    math;
const   finp    =       'BONUS.INP';
        fout    =       'BONUS.OUT';
var     g,f     :       text;
        a       :       array[0..1001,0..1001] of integer;
        d       :       array[0..1001,0..1001] of longint;
        n,k,kq     :       longint;
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
        readln(f,n,k);
        for i:=1 to n do
         begin
         for j:=1 to n do read(f,a[i,j]);
         readln(f);
         end;
end;
procedure       ktao;
var     i,j     :       longint;
begin
        for i:=1 to n do
        for j:=1 to n do
                d[i,j]:=d[i-1,j]+d[i,j-1]+a[i,j]-d[i-1,j-1];
end;
procedure       xuly;
var     i,j,i1,j1     :       longint;
begin
        kq:=-1;
        ktao;
        for i:=1 to n do
                for j:=1 to n do
                  begin
                        i1:=i+k-1;
                        j1:=j+k-1;
                        if (i1<=n)and(i1>0) then
                         if (j1<=n)and(j1>0) then
                                        kq:=max(kq,d[i1,j1]-d[i1,j-1]-d[i-1,j1]+d[i-1,j-1]);
                  end;
                writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.