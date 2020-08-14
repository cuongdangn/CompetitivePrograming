const   finp    =       'WEDDING.INP';
        fout    =       'WEDDING.OUT';
type    arr     =       array[1..100000] of longint;
var     g,f        :       text;
        a,b     :       array[1..100000] of longint;
        m,n,kq :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       doc;
var     i,j       :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
        readln(f);
        for i:=1 to m do read(f,b[i]);

end;
procedure          QS(l,h       :       longint;var a:arr);
var     x,i,j        :    longint;
        tg      :    longint;
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
function          check(x:longint):boolean;
var     d,c,kq,i         :     longint;
begin
        kq:=0;
        c:=m-x+1;
        d:=1;
        for i:=1 to n do
                if (b[d]<a[i])and(a[i]<b[c]) then
                begin
                        inc(kq);
                        inc(d);
                        inc(c);
                        if d>=m-x+1 then break;
                end;
        if kq>=x then exit(true);
        exit(false);
end;


function       xuly:longint;
var     i,j,mid       :longint;
begin
    i:=1;
    j:=n;
    xuly:=0;
    while i<=j do
        begin
               mid:=(i+j) div 2;
               if check(mid) then
                begin
                     xuly:=mid;
                     i:=mid+1;
                end
                else j:=mid-1;
        end;
end;
procedure       xuly1;
begin
        QS(1,n,a);
        QS(1,m,b);
        writeln(g,xuly);
end;
begin
        mo;
        doc;
        xuly1;
        close(f);
        close(g);
end.
