uses    math;
const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        l       :       byte;
        end;
var     g,f     :       text;
        n,kq       :       longint;
        d       :       array[1..200028] of longint;
        a       :       array[1..100001] of bg;
        b,c     :       array[1..200001] of bg;
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
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         readln(f,a[i].x,a[i].y);
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t].x;
        repeat
                while b[i].x<x do inc(i);
                while b[j].x>x do dec(j);
                if i<=j then
                        begin
                                tg:=b[i];
                                b[i]:=b[j];
                                b[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do
         begin
          b[i].x:=a[i].x;
          b[i].y:=i;
          b[i].l:=1;
          b[i+n].x:=a[i].y;
          b[i+n].y:=i;
          b[i+n].l:=2;
         end;
         randomize;
         QS(1,2*n);
         j:=1;
         i:=1;
        if b[i].l=1 then a[b[i].y].x:=j
           else a[b[i].y].y:=j;
           c[1].x:=j;
           c[1].y:=b[1].y;
           c[1].l:=b[1].l;
         for i:=2 to n*2 do
          begin
           if b[i].x<>b[i-1].x then inc(j);
           if b[i].l=1 then a[b[i].y].x:=j
           else a[b[i].y].y:=j;
           c[i].x:=j;
           c[i].y:=b[i].y;
           c[i].l:=b[i].l;
          end;
end;
procedure       xuly;
var     i,j,t     :       longint;
begin
        kq:=1;
        for i:=1 to 2*n do
         begin
          if c[i].l=1 then
           begin
            t:=d[c[i].x];
            kq:=max(kq,t+1);
            d[a[c[i].y].y]:=max(d[a[c[i].y].y],t+1);
           end;
          end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
























