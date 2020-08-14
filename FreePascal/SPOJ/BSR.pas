const   finp    =       'BSR.inp';
        fout    =       'BSR.out';
var     g,f     :       text;
        a       :       array[0..501,0..501] of int64;
        dem     :       array[0..8] of int64;
        b       :       array[0..501] of int64;
        m,n     :       longint;
        kq      :       int64;
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
var     i,j     :       integer;
begin
        readln(f,n,m);
        for  i:=1 to n do
                begin
                        for j:=1 to m do
                        begin
                        read(f,a[i,j]);
                        a[i,j]:=a[i,j-1]+a[i,j];
                        end;
                        readln(f);
                end;
end;
procedure       kt(i,j:integer);
var     k:integer;
begin
        for k:=1 to n do
                b[k]:=a[k,j]-a[k,i-1];
        for k:=0 to 8 do dem[k]:=0;
end;
function        tinh(i,j:integer):int64;
var     kq1,t:int64;
begin
        kt(i,j);
        dem[0]:=1;
        t:=0;     kq1:=0;
        for i:=1 to n do
                begin
                        t:=t+b[i];
                        kq1:=kq1+dem[t mod 9];
                        inc(dem[t mod 9]);
                end;
        exit(kq1);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to m do
                for j:=i to m do
                        kq:=kq+tinh(i,j);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
