const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
type    mang    =       array[0..50001] of longint;
        node    =       record
        x,y     :       longint;
        end;
var     n,m,k,nheap   :       longint;
        a,b     :       mang;
        hi      :       array[1..50001] of node;
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
procedure       QS(l,h:longint;var      t:mang);
var     tg,x,i,j        :       longint;
begin
        i:=l;
        j:=h;
        x:=t[(l+h) div 2];
        repeat
                while   t[i]<x do inc(i);
                while   t[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=t[i];
                                t[i]:=t[j];
                                t[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>J;
if i<h then QS(i,h,t);
if j>l then QS(l,j,t);
end;
procedure       doc;
var     i:longint;
begin
        readln(f,m,n,k);
        for i:=1 to m do readln(f,a[i]);

        for i:=1 to n do readln(f,b[i]);
end;
function        tinh(i,j:longint):longint;
begin
        tinh:=a[i]+b[j];
end;
procedure       capnhat;
var     cha,con,x:longint;
        v       :       node;
begin
        v:=hi[1];
        x:=tinh(hi[1].x,hi[1].y);
        cha:=1;
        while cha*2<=nheap do
                begin
                        con:=cha*2;
                        if (con<nheap)and(tinh(hi[con].x,hi[con].y)>tinh(hi[con+1].x,hi[con+1].y)) then con:=con+1;
                        if tinh(hi[con].x,hi[con].y)>=x then break;
                        hi[cha]:=hi[con];
                        cha:=con;
                end;
        hi[cha]:=v;
end;
procedure       xuly;
var     i       :       longint;
begin
        QS(1,m,a);
        QS(1,n,b);
        for i:=1 to n do
                begin
                        hi[i].x:=1;
                        hi[i].y:=i;
                end;
                nheap:=n;
        for i:=1 to k do
                begin
                    writeln(g,tinh(hi[1].x,hi[1].y));
                    if hi[1].x<n then hi[1].x:=hi[1].x+1
                    else
                        begin
                                hi[1]:=hi[nheap];
                                dec(nheap);
                        end;
                    capnhat;
                end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

