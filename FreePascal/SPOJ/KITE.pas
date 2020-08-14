const   finp    =       'KITE.INP';
        fout    =       'KITE.OUT';
type    bg      =       record
        gt,cs   :       longint;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..100001] of bg;
        kq,b,bit       :       array[1..100001] of longint;
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
        for i:=1 to n do
         begin
          read(f,a[i].gt);
          a[i].cs:=i;
         end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].gt;
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
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function        get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
          tg:=tg+bit[i];
          i:=i- i and (-i);
         end;
        exit(tg);
end;
procedure        up(i:longint);
begin
        while i<=n do
         begin
          bit[i]:=bit[i]+1;
          i:=i+i and (-i);
         end;
end;

procedure       xuly;
var     i,j     :       longint;
begin
        randomize;
        QS(1,n);
        j:=1;
        b[a[1].cs]:=j;
        for i:=2 to n do
         begin
          if a[i].gt<>a[i-1].gt then inc(j);
          b[a[i].cs]:=j;
         end;
        //;
        kq[1]:=1;
        up(b[1]);
        for i:=2 to n do
         begin
          j:=get(b[i]);
          kq[i]:=i-j;
          up(b[i]);
         end;
        for i:=1 to n do writeln(g,kq[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.