const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,k     :       longint;
        a,b     :       array[1..100000] of longint;
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
procedure       QS(l,h:longint);
var     i,j,x,tg:longint;
begin
        i:=l;
        j:=h;
        x:=b[(l+h) div 2];
        repeat
                while b[i]<x do inc(i);
                while b[j]>x do dec(j);
                if i<= j then
                        begin
                                tg:=b[i];
                                b[i]:=b[j];
                                b[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
if j>l then QS(l,j);
if i<h then QS(i,h);
end;
function       kt(t:longint):boolean;
var     i,j     :       longint;
begin
        for i:=1 to t do b[i]:=a[i];
        Qs(1,t);
        j:=0;
        for i:=1 to t do
                if b[i]<=j+1 then
                        begin
                        j:=j+b[i];
                        if j>=k then exit(true);
                        end
                else
                        exit(false);
                exit(false);
end;

procedure       tknp;
var     dau,cuoi,giua,kq:longint;
begin
        kq:=-1;
        dau:=1;
        cuoi:=n;
        repeat
                giua:=(dau+cuoi)div 2;
                if kt(giua) then
                        begin
                                kq:=giua;
                                cuoi:=giua-1;
                        end
                else dau:=giua+1;
        until   cuoi<dau;
        writeln(g,kq);
end;

procedure       doc;
var     i,t,j       :       longint;
begin
        readln(f,t);
        for i:=1 to t do
                begin
                        readln(f,n,k);
                        for j:=1 to n do read(f,a[j]);
                        readln(f);
                        tknp;
                end;
end;
begin
        mo;
        doc;
        dong;
end.

