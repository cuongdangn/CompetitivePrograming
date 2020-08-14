procedure       QS(l,h  :       longint);
var     i,j,x      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2];
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
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;