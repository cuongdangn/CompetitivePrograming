const   finp    =       'DNC.INP';
        fout    =       '';
type    bg      =       record
        x,y     :       extended;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..1001] of bg;
        tongx,tongy:    array[0..1001] of extended;
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
                while (a[i].x<x)or((a[i].x=x)and(a[i].y>y)) do inc(i);
                while (a[j].x>x)or((a[j].x=x)and(a[j].y<y)) do dec(j);
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

procedure       xuly;
var     i,j,k     :       longint;
begin
        randomize;
        QS(1,n);
        for i:=1 to n do
        begin
         tongx[i]:=tongx[i-1]+a[i].x;
         tongy[i]:=tongy[i-1]+a[i].y;
        end;
        for i:=3 to n do
         for j:=i-1 downto 2 do
          begin
           dem:=0;
           for k:=j-1 downto 1 do write(g,(a[k].y*(a[i].x-a[j].x)+a[k].x*(a[j].y-a[i].y)+(a[j].x*a[i].y-a[i].x*a[j].y)):0:0,' ');
           writeln(g);
           kq:=kq+abs(dem);
          end;
          //writeln(dem);
         kq:=kq/2;
         writeln(g,kq:0:1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
