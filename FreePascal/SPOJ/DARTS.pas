{$MODE OBJFPC}
uses    math;
const   finp    =       'DARTS.INP';
        fout    =       'DARTS.OUT';
var     g,f:    text;
        b       :       array[1..1010] of longint;
        a       :       array[1..1100000] of longint;
        n,k,kq       :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n,k);
        for i:=1 to n do
               begin
                readln(f,b[i]);
                if b[i]<=k then kq:=max(kq,b[i]);
               end;
        a[n+1]:=0;
        inc(n);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       init;
var     i,j,m     :       longint;
begin
        m:=0;
        for i:=1 to n do
            for j:=1 to n do
                begin
                    inc(m);
                    a[m]:=b[i]+b[j];
                    if a[m]<=k then
                    kq:=max(kq,a[m]);
                end;
            n:=m;
end;
procedure       QS(l,h:longint);
var     i,j,x,tg       :       longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                     begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);
                        dec(j);
                     end;
        until        i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
function       chat(x:longint):longint;
var     l,h,m,luu    :        longint;
begin
        l:=1;
        h:=n;
        luu:=-1;
        while l<=h do
              begin
                m:=(l+h) div 2;
                if a[m]<=x then
                       begin
                        luu:=a[m];
                        l:=m+1;
                       end
                else h:=m-1;
              end;
        exit(luu);
end;
procedure       xuly;
var     i,j:longint;
begin
        for i:=1 to n do
                begin
                     if a[i]<k then
                        begin
                                j:=chat(k-a[i]);
                                if j>0 then
                                                kq:=max(kq,j+a[i]);
                        end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        init;
        QS(1,n);
        xuly;
        dong;
end.
