const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       extended;
        end;
var     g,f     :       text;
        n,m     :       longint;
        a,atg   :       array[1..1001] of bg;
        b       :       array[1..1001] of extended;
        tongx,tongy:    extended;
        kq,dem      :       extended;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         readln(f,a[i].x,a[i].y);
end;
procedure       QS1(l,h  :       longint);
var     i,j,t      :       longint;
        tg      :       bg;
        x,y,tg1       :       extended;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=b[t];
        repeat
                while (b[i]>x) do inc(i);
                while (b[j]<x) do dec(j);
                if i<=j then
                        begin
                                tg:=atg[i];
                                atg[i]:=atg[j];
                                atg[j]:=tg;
                                tg1:=b[i];
                                b[i]:=b[j];
                                b[j]:=tg1;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS1(i,h);
        if j>l then QS1(l,j);
end;
procedure       QS(l,h  :       longint);
var     i,j,t      :       longint;
        tg      :       bg;
        x,y       :       extended;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].x;
        y:=a[t].y;
        repeat
                while (a[i].y<y)or((a[i].y=y)and(a[i].x>x)) do inc(i);
                while (a[j].y>y)or((a[j].y=y)and(a[j].x<x)) do dec(j);
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
function        kc(a,b:bg):extended;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
procedure       xuly;
var     i,j     :       longint;
begin
        randomize;
        QS(1,n);
        for i:=1 to n-2 do
         begin
          m:=0;
          for j:=i to n do
           begin
            inc(m);
            atg[m]:=a[j];
           end;
          //////
          for j:=2 to m do
            b[j]:=(atg[j].x-atg[1].x)/kc(atg[j],atg[1]);
          QS1(2,m);
          tongx:=0;
          tongy:=0;
          for j:=2 to m do
           begin
            tongx:=tongx+atg[j].x;
            tongy:=tongy+atg[j].y;
           end;
          for j:=2 to m-1 do
           begin
            tongy:=tongy-atg[j].y;
            tongx:=tongx-atg[j].x;
            kq:=kq+abs(tongy*(a[i].x-atg[j].x)+tongx*(atg[j].y-a[i].y)+(m-j)*(atg[j].x*a[i].y-a[i].x*atg[j].y));
           end;
         end;
         kq:=kq/2;
         writeln(g,kq:0:1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.





