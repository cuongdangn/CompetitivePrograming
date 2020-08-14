uses    math;
const   finp    =       'LT.INP';
        fout    =       'LT.OUT';
var     g,f     :       text;
        d       :       array[-1..10000] of int64;
        m,n     :       longint;
        a       :       array[0..10000] of longint;
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
var     u,v,i,t   :       longint;
begin
        readln(f,m,n);
        readln(f,t);
        for i:=1 to t do
                begin
                        readln(f,v,u);
                        a[v]:=max(a[v],u);
                end;
end;
procedure       xuly;
var     i       :longint;
begin
        d[1]:=a[1];
        for i:=2 to 10000 do
                begin
                    d[i]:=d[i-1]+a[i];
                    d[i]:=min(d[i],d[i-2]+max(a[i],a[i-1]));
                    d[i]:=min(d[i],d[i-3]+max(max(a[i],a[i-1]),a[i-2]));
                end;
        writeln(g,d[10000]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.