uses    math;
const   finp    =       'SCSEQ.inp';
        fout    =       'SCSEQ.out';
var     g,f     :       text;
        a       :       array[-1..300001] of longint;
        s,n     :       longint;
        t,t1       :       int64;
        d       :  array[-1..300001,0..1] of int64;
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
procedure      doc;
var     i      :longint;
begin
        readln(f,n,s);
        for i:=1 to n do
        begin
                read(f,a[i]);
                t:=t+a[i];
        end;
        for i:=1 to n do a[i]:=-2*a[i]-s;
end;
procedure       QHD;
var     i:longint;
begin

        d[1,0]:=-maxlongint*100000;
        d[1,1]:=a[1];
        for i:=2 to n do
        begin
        d[i,0]:=max(d[i-1,0],d[i-1,1]);
        d[i,1]:=max(d[i-1,1]+a[i],a[i]);
        end;
        t1:=max(d[n,0],d[n,1]);
        writeln(g,t+t1);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.