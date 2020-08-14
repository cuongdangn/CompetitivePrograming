uses    math;
const   finp    =       'COIN.INP';
        fout    =       'COIN.OUT';
var     g,f     :       text;
        n,w,v   :       longint;
        d,tra       :       array[0..150,0..150] of int64;
        a,b   :       array[1..20] of longint;
        kq      :     array[1..20] of longint;
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
var     i       :       longint;
begin
        read(f,n,v,w);
        for i:=1 to n do
                        readln(f,a[i],b[i]);
end;
procedure       QHD;
var     i,j,k   :       longint;
begin
       for j:=0 to v do
       for k:=0 to w do
                d[j,k]:=maxlongint;
       d[0,0]:=0;
       for i:=1 to n do
                        d[a[i],b[i]]:=1;

        for j:=1 to v do
                for k:=1 to w do
                        for i:=1 to n do
                                     if (j>=a[i])and(k>=b[i]) then
                                     if d[j,k]>=d[j-a[i],k-b[i]]+1 then
                                     begin
                                        d[j,k]:=d[j-a[i],k-b[i]]+1;
                                        tra[j,k]:=i;
                                     end;
        if d[v,w]=maxlongint then
        begin
        write(0);
        dong;
        halt;
        end;
        writeln(g,d[v,w]);
end;
procedure       trace;
var     j,k,i     :        nlongint;
begin
        j:=v;
        k:=w;
        while tra[j,k]>0 do
                begin
                        i:=tra[j,k];
                        inc(kq[tra[j,k]]);
                        j:=j-a[i];
                        k:=k-b[i];
                end;
        for i:=1 to n do write(g,kq[i],' ' );
end;
begin
        mo;
        doc;
        QHD;
        trace;
        dong;
end.
