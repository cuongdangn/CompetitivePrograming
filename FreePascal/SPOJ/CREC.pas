const   finp    =       'CREC.INP';
        fout    =       'CREC.OUT';
type    bg      =       record
        gt,cs   :       int64;
        end;
var     g,f     :       text;
        a       :       array[1..30000] of bg;
        n       :       longint;
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
var     i,j   :       longint;
        tg      :       bg;
        x       :       int64;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2].gt;
        repeat
                while   a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until          i>J;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       doc;
var     i       :       longint;
        kq      :       int64;
begin
        kq:=0;
        while not seekeof(f) do
                begin
                        inc(n);
                        readln(f,a[n].gt);
                        a[n].cs:=n;
                end;
        QS(1,n);
        i:=1;
        while i<n do
        begin
              kq:=a[i].gt*a[i+1].gt+kq;
              i:=i+2;
        end;
        writeln(g,kq);
        i:=1;
         while i<n do
        begin
              writeln(g,a[i].cs,' ',a[i+1].cs);
              i:=i+2;
        end;
end;
begin
        mo;
        doc;
        dong;
end.
