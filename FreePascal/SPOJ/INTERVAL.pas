const   finp    =       'INTERVAL.INP';
        fout    =       'INTERVAL.OUT';
var     g,f     :       text;
        l,r     :       qword;
        a,b     :       longint;
        kq,t1      :       qword;
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
function        CS1(a:qword):byte;
var     t,sl:qword;
        i:longint;

begin
        sl:=trunc(ln(a))+1;
        t1:=1;
        for i:=1 to sl-1 do t1:=t1*10;
        t:=a div t1;
end;
function        min(a,b:qword):qword;
begin
        if a>b then exit(b)
        else exit(a);
end;
procedure       xuly;
var     i,d:longint;
begin
        readln(f,l,r);
        d:=CS1(l);
        kq:=0;

        writeln(g,kq);
end;
begin
        mo;
        xuly;
        dong;
end.
