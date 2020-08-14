const   finp    =       'SEQ2SC.inp';
        fout    =       'SEQ2SC.out';
type    arr     =       array[0..50000001] of int64;
        arr2    =       array[0..1001] of longint;
var     g,f     :       text;
        p,q     :       arr;
        a,b       :       arr2;
        n,m     :       int64;
        dem     :       longint;
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
var     i,j       :       longint;
        t       : int64;
begin
        readln(f,m,n);
        for i:=1 to m do read(f,a[i]);
        for i:=1 to n do read(f,b[i]);
        for i:=1 to m do
                begin
                        t:=0;
                        for j:=i to m do
                                begin
                                        t:=t+a[j];
                                        inc(dem);
                                        p[dem]:=t;
                                end;
                end;
                m:=dem;
        dem:=0;
        for i:=1 to n do
                begin
                        t:=0;
                                for j:=i to n do
                                        begin
                                                t:=t+b[j];
                                                inc(dem);
                                                q[dem]:=t;
                                        end;
                end;
                n:=dem;
end;
procedure       QS(l,h  :       longint;var     a:arr);
var     i,j   :       longint;
        tg,x  :       int64;
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
        until           i>j;
        if i<h then QS(i,h,a);
        if j>l then QS(l,j,a);
end;
function        tinh(var        p,q:arr;m,n:longint):int64;
var     i,j,j1     :       longint;
        kq      :  int64;
begin
        kq:=0;
        j1:=1;
        q[n+1]:=1000000000000000000;
        for i:=1 to m do
                for j:=j1 to n+1 do
                        if p[i]<=q[j] then
                                begin
                                        kq:=kq+j-1;
                                        j1:=j;
                                        break;
                                end;
        exit(kq);
end;
procedure       xuly;
var     kq1,kq2:int64;
begin
        QS(1,m,p);QS(1,n,q);
        kq1:=tinh(q,p,n,m);
        kq2:=tinh(p,q,m,n);
        write(g,kq1,' ',n*m-kq1-kq2,' ',kq2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
