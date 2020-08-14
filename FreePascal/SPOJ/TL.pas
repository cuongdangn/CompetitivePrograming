uses    math;
var     a       :       array[1..101] of longint;
        i,n,m,mina,maxa,minb,kq       :       longint;
begin
        readln(n,m);
        minb:=maxlongint;
        mina:=minb;
        maxa:=-mina;
        for i:=1 to n do
               begin
                read(a[i]);
                mina:=min(mina,a[i]);
                maxa:=max(maxa,a[i]);
               end;

        for i:=1 to m do
                begin
                read(a[i]);
                minb:=min(minb,a[i])
                end;
        kq:=max(mina*2,maxa);
        if kq<minb then
                        write(kq)
        else write(-1);
end.

