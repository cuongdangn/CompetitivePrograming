const   finp    =       ';
        fout    =       '';
var     g,f     :       text;
        a,st,sl :       array[0..500000]of longint;
        n       :       longint;
        kq      :       int64;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,a[i]);
end;
procedure       xuly;
var     dau,i     :       longint;

begin
        dau:=1;
        st[1]:=a[1];
        sl[1]:=1;
        for i:=2 to n do
         begin
                while (a[i]>st[dau])and(dau>0) do
                begin
                        kq:=kq+sl[dau];
                        dec(dau);
                end;
                if (a[i]=st[dau])and(dau>1) then inc(kq);
                if (dau>0)and(a[i]=st[dau]) then
                begin
                        sl[dau]:=sl[dau]+1;
                         kq:=kq+sl[dau]-1;
                end
                else
                begin
                        inc(dau);
                        if dau>1 then inc(kq);
                        st[dau]:=a[i];
                        sl[dau]:=1;
                end
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


