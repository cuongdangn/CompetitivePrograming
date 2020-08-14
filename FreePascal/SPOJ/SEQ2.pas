uses    math;
const   finp    =       'SEQ2.INP';
        fout    =       'SEQ2.OUT';
var     g,f     :       text;
        d       :       array[0..3001,0..3001] of longint;
        a       :       array[1..3001] of longint;
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
var     i,k,j,kq       :longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        kq:=-1;
        for i:=1 to n do
        for k:=n-i downto 1 do
                begin
                        j:=i+k;
                        if a[i]<a[j] then d[i,j]:=d[i-1,j+1]+1
                        else d[i,j]:=max(d[i-1,j],d[i,j+1]);
                        kq:=max(kq,d[i,j]);
                end;

        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
