uses    math;
const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        w       :       int64;
        end;
var     g,f     :       text;
        bit     :       array[1..100010] of int64;
        a,b       :       array[1..100010] of bg;
        n       :       longint;
        d       :       bg;
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
        readln(f,d.x,d.y,n);
        for i:=1 to n do
          readln(f,b[i].x,b[i].y,b[i].w);
end;
procedure       QS1(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t].y;
        repeat
                while b[i].y<x do inc(i);
                while b[j].y>x do dec(j);
                if i<=j then
                        begin
                                tg:=b[i];
                                b[i]:=b[j];
                                b[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS1(i,h);
        if j>l then QS1(l,j);
end;
procedure       QS2(l,h  :       longint);
var     i,j,x,t,y      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].x;
        y:=a[t].y;
        repeat
                while (a[i].x<x)or((a[i].x=x)and(a[i].y<y)) do inc(i);
                while (a[j].x>x)or((a[j].x=x)and(a[j].y>y)) do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS2(i,h);
        if j>l then QS2(l,j);
end;

procedure       init;
var     i,k     :       longint;
begin
        randomize;
        QS1(1,n);
        k:=1;
        a[1].y:=1;
        a[1].x:=b[1].x;
        a[1].w:=b[1].w;
        for i:=2 to n do
         begin
          if b[i].y<>b[i-1].y then inc(k);
          a[i]:=b[i];
          a[i].y:=k;
         end;
        QS2(1,n);
end;
function        get(i:longint):int64;
var     tg      :       int64;
begin
        tg:=0;
        while i>0 do
         begin
                tg:=max(tg,bit[i]);
                i:=i-i and (-i);
         end;
         exit(tg);
end;
procedure       up(i:longint;x:int64);
begin
        while i<=n do
         begin
          bit[i]:=max(bit[i],x);
          i:=i+i and (-i);
         end;
end;
procedure       xuly;
var     i,j     :       longint;
        kq      :       int64;
begin
        init;
        for i:=1 to n do
         begin
          j:=get(a[i].y);
          up(a[i].y,j+a[i].w);
         end;
         kq:=get(n+1);
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
