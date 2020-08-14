const   finp    =       'codef.inp';
        fout    =       '';
type    bg      =       record
        gt      :       longint;
        cs      :       longint;
        end;
var     g,f     :       text;
        n,m     :       longint;
        kq      :       int64;
        a,st       :       array[1..500] of longint;
        b       :       array[1..1010] of longint;
        sl      :       array[1..1010] of bg;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
        for i:=1 to m do read(f,b[i]);
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=sl[t].gt;
        repeat
                while sl[i].gt>x do inc(i);
                while sl[j].gt<x do dec(j);
                if i<=j then
                        begin
                                tg:=sl[i];
                                sl[i]:=sl[j];
                                sl[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       QS1(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
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
        if i<h then QS1(i,h);
        if j>l then QS1(l,j);
end;

procedure       xuly;
var     i,j,t     :       longint;
begin
        for i:=1 to n do st[i]:=i;
        for i:=1 to m do
         begin
                t:=st[b[i]];
                for j:=b[i] downto 2 do
                begin
                 if j<>b[i] then inc(sl[st[j]].gt);
                 st[j]:=st[j-1];
                end;
                if b[i]<>1 then inc(sl[st[1]].gt);
                 st[1]:=t;
         end;
         for i:=1 to n do sl[i].cs:=i;
         randomize;
         QS(1,n);
         QS1(1,n);
         j:=1;
         for i:=1 to n do
          if sl[i].gt>0 then begin kq:=kq+sl[i].gt*a[j];inc(j); end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.