uses    math;
const   finp    =       'PIG.INP';
        fout    =       'PIG.OUT';
      maxn    =       10002;
var     g,f     :       text;
        d       :       array[1..10002] of longint;
        n       :       longint;
        c,t       :       array[1..maxn] of longint;
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
function   get(u:longint):longint;
var     sum:    longint;
begin
        sum:=0;
        while u>0 do
                begin
                        sum:=max(sum,t[u]);
                        u:=u-u and (-u);
                end;
        exit(sum);
end;
procedure       update(i,v:longint);
begin
        while i<maxn do
                begin
                        t[i]:=max(t[i],v);
                        i:=i+i and (-i);
                end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,tg        :       longint;
begin
        i:=l;
        j:=h;
        x:=c[(l+h) div 2];
        repeat
                while c[i]>x do inc(i);
                while c[j]<x do dec(j);
                if i<=j then
                        begin
                                tg:=c[i];
                                c[i]:=c[j];
                                c[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
procedure       doc;
var     i,j,bd     :       longint;
        kq,res,t1      :       longint;
begin
        kq:=-1;
        readln(f,n);
        for i:=1 to n do
                begin

                        read(f,bd);
                        for j:=1 to bd do
                                read(f,c[j]);

                        QS(1,bd);
                        c[bd+1]:=-1;
                        for j:=1 to bd do
                         if c[j]<>c[j+1] then
                                begin
                                        t1:=get(c[j])+c[j];
                                        kq:=max(kq,t1);
                                        update(c[j],t1);
                                end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
