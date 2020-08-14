uses    math;
const   finp    =       'TIMK.INP';
        fout    =       'TIMK.OUT';
var     g,f     :       text;
        p      :       array[1..100000000] of byte;
        nt,pt     :       array[1..100000000] of longint;
        dem,m,n    :       longint;
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
procedure       sang(n:longint);
var     i     :        longint;
        j     :        int64;
begin
        for i:=2 to trunc(sqrt(n)) do
                if p[i]=0 then
                begin
                        j:=i*i;
                        while  j<=n do
                                begin
                                        p[j]:=1;
                                        j:=j+int64(i);
                                end;
                end;
        dem:=0;
       for i:=2 to n do
        if p[i]=0 then
                begin
                        inc(dem);
                        nt[dem]:=i;
                end;
end;
procedure       pti(m:longint);
var     i:longint;
begin
        for i:=1 to dem do
                if m<1 then break
                else
                if m mod nt[i]=0 then
                        begin
                             while (m mod nt[i]=0)and(m>0) do
                                begin
                                        inc(pt[i]);
                                        m:=m div nt[i];
                                end;
                        end;
end;
function        tinh(n,p:longint):longint;
var     i:longint;
        kq      :       longint;
begin
        kq:=0;
        i:=p;
        while n div i>0 do
                begin
                       kq:=kq+n div i;
                       i:=i*p;
                end;
        exit(kq);
end;

procedure       xuly;
var     t,kq,i       :       longint;
begin
        sang(1000000);
        pti(m);
        kq      :=       maxlongint;
        for i:=1 to dem do
                if pt[i]>0 then
                begin
                        t:=tinh(n,nt[i]);
                        if t<pt[i] then
                                begin
                                         writeln(g,0);
                                         dong;
                                         halt;
                                end
                        else
                                kq:=min(t div pt[i],kq);
                end;
        writeln(g,kq);
end;
begin
        mo;
        readln(f,n,m);
        xuly;
        dong;
end.

