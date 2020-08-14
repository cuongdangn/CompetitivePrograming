uses    math;
const   finp    =       'SUBARR.inp';
        fout    =       'SUBARR.OUT';
        maxn    =       100000;
var     g,f     :       text;
        n,k     :       longint;
        a,t,fx       :       array[-10..4*maxn+10]        of longint;
        kq      :    int64;
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
var     i       :longint;
begin
        readln(f,n,k);
        for i:=1 to n do
        begin
                read(f,a[i]);
                t[i]:=i;
        end;
end;
procedure       swap(var i,j:longint);
var     tg:longint;
begin
        tg:=i;
        i:=j;
        j:=tg;
end;
procedure       QS(l,h:longint);
var     i,j,x,y   :       longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2];
        y:=t[(l+h)div 2];
        repeat
                while (x>a[i])or((x=a[i])and(t[i]<y)) do inc(i);
                while (x<a[j])or((x=a[j])and(t[j]>y)) do dec(j);
                if i<=j then
                        begin
                                swap(a[i],a[j]);
                                swap(t[i],t[j]);
                                inc(i);
                                dec(j);

                        end;
        until           i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i       :       longint;
begin
        QS(1,n);
        for i:=k to n do
                if a[i]=a[i-k+1] then
                        fx[t[i]]:=t[i-k+1];
        for i:=1 to n do
         fx[i]:=max(fx[i],fx[i-1]);

         for i:=1 to n do kq:=kq+fx[i];
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



