const   finp    =       'robot.inp';
        fout    =       'robot.out';
type    arr     =       array[1..100001] of longint;
var     g,f     :       text;
        n,kq1,kq2       :       int64;
        x,y     :       array[1..100001] of longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
function        min(a,b:int64):int64;
begin
        if a>b then exit(b)
        else exit(a);
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
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i:longint;
begin
        readln(f,n);
        for i:=1 to  n do
                readln(f,x[i],y[i]);

end;
procedure       xuly;
var    i,t:longint;
begin
        QS(1,n,x);
        QS(1,n,y);
        t:=x[n div 2+1];
        for i:=1 to n do kq1:=kq1+abs(t-x[i])+abs(y[i]-i);
        t:=y[n div 2+1];
        for i:=1 to n do kq2:=kq2+abs(t-y[i])+abs(x[i]-i);
        writeln(g,min(kq1,kq2));
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
