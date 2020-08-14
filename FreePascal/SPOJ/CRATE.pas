const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
type    bg      =       record
        x,y,cs  :       longint;
        end;
var     g,f     :       text;
        a       :       array[1..300000] of bg;
        d,kq       :       array[1..300000] of longint;
        t       :       array[0..100000] of longint;
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
procedure       doc;
var     i:      longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        readln(f,a[i].x,a[i].y);
                        a[i].cs:=i;
                end;
end;
procedure       QS(l,h:longint);
var     i,j,x1,y1   :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x1:=a[(l+h)div 2].x;
        y1:=a[(l+h)div 2].y;
        repeat
                while (a[i].x<x1)or((a[i].x=x1)and(a[i].y<y1))do inc(i);
                while (a[j].x>x1)or((a[j].x=x1)and(a[j].y>y1))do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
procedure       update(i:longint);
begin
        while i<=maxn do
                begin
                        t[i]:=t[i]+1;
                        i:=i+i and (-i);
                end;
end;
function       getsum(i:longint):longint;
var     sum:longint;
begin
        sum:=0;
        while i>0 do
                begin
                        sum:=sum+t[i];
                        i:=i-(i and (-i));
                end;
        exit(sum);
end;

procedure       xuly;
var     i       :longint;
begin
        QS(1,n);
        d[a[1].cs]:=a[1].cs;
        for i:=2 to n do
                begin
                        if (a[i].x=a[i-1].x)and(a[i].y=a[i-1].y) then
                        d[a[i].cs]:=d[a[i-1].cs]
                        else d[a[i].cs]:=a[i].cs;
                end;
        for i:=1 to n do
                begin
                if d[a[i].cs]=a[i].cs then
                    kq[a[i].cs]:=getsum(a[i].y);
                    update(a[i].y);
                end;
        for i:=1 to n do writeln(g,kq[d[i]]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

