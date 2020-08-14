const   finp    =       'DNC.INP';
        fout    =       'TS.OUT';
type
        bg      =       record
        gt,cs   :       longint;
        end;
        arr     =       array[1..3000] of bg;
var     g,f     :       text;
        b,c,a,d,sl   :     arr;
        t      :       array[1..3000,1..3000] of byte;
        n,m     :       longint;
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
procedure       QS(l,h:longint;var a:arr);
var     i,j,x        :       longint;
        tg      :    bg;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].gt;
        repeat
                while a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h,a);
        if j>l then QS(l,j,a);
end;
procedure       doc;
var     i,j       :longint;
begin
        readln(f,m,n);
        for i:=1 to n do
        begin
        read(f,c[i].gt);
        c[i].cs:=i;
        a[i].cs:=i;
        sl[i].cs:=i;
        end;
        readln(f);
        for i:=1 to m do
                begin
                      b[i].cs:=i;
                      d[i].cs:=i;
                      while not seekeoln(f) do
                        begin
                                read(f,j);
                                t[i,j]:=1;
                                inc(a[j].gt);
                                inc(b[i].gt);
                        end;
                        readln(f);
                end;
end;
procedure       xuly;
var     i,j     :       longint;
begin

        QS(1,n,a);
        QS(1,m,b);
        for i:=1 to n do
                begin
                        for j:=1 to m do
                         if t[b[j].cs,a[i].cs]=1 then
                                if (c[a[i].cs].gt>0)and(d[b[j].cs].gt=0) then
                                begin
                                   dec(c[a[i].cs].gt);
                                   inc(sl[a[i].cs].gt);
                                   d[b[j].cs].gt:=a[i].cs;
                                   if c[a[i].cs].gt=0 then break;
                                end;
                end;
        QS(1,n,sl);
        for i:=n downto 1 do
                begin
                        write(g,sl[i].gt,' ');
                        for j:=1 to m do
                        if d[j].gt=sl[i].cs then write(g,d[j].cs,' ');
                        writeln(g);
                end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

