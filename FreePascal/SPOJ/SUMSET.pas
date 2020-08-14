const   finp            =       'DNC.INP';
        fout            =       '';
var     g,f     :       text;
        n,m     :       longint;
        kq      :       int64;
        a       :       array[1..5000000] of longint;
        s       :       array[0..5000000] of longint;
        du      :       array[0..1000000] of longint;
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
var     i       :longint;
        j       :      longint;
begin
        readln(f,n,m);
        for i:=1 to n do
                begin
                        read(f,j);
                        s[i]:=s[i-1]+j;
                        s[i]:=s[i] mod m;
                end;
        du[0]:=1;
        for i:=1 to n do
                inc(du[s[i]]);
        for i:=0 to m-1 do
                        kq:=kq+(du[i]*(du[i]-1))div 2;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
