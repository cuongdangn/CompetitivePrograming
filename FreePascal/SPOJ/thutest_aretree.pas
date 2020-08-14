const   finp    =       'DNC.INP';
        fout    =       '';
type    bg      =       record
        x,y     :       extended;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..1001] of bg;
        tongx,tongy:    array[0..1001] of extended;
        kq      :       extended;
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
        x       :       extended;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].x;
        repeat
                while a[i].x<x do inc(i);
                while a[j].x>x do dec(j);
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
function        tinh(a,b,c:bg):extended;
begin
        exit(abs((a.x-b.x)*(a.y+b.y)+(b.x-c.x)*(b.y+c.y)+(c.x-a.x)*(c.y+a.y)));
end;
procedure       xuly;
var     i,j,k     :       longint;
begin
         for i:=1 to n-2 do
          for j:=i+1 to n-1 do
           for k:=j+1 to n do
             kq:=kq+tinh(a[i],a[j],a[k]);

         kq:=kq/2;
         writeln(g,kq:0:1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
