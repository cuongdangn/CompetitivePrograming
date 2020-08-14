const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y,cs  :       longint;
        end;
var     g,f     :       text;
        d,bit   :       array[0..30001] of longint;
        a       :       array[0..30001] of bg;
        n       :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
function max(a,b:longint):longint;
begin
 if a>b then exit(a);
 exit(b);
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
        for i:=1 to n do readln(f,a[i].x,a[i].y);
        for i:=1 to n do a[i].cs:=i;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t,y      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].y;
        y:=a[t].x;
        repeat
                while (a[i].y>x)or((a[i].y=x)and(a[i].x>y)) do inc(i);
                while (a[j].y<x)or((a[j].y=x)and(a[j].x<y)) do dec(j);
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
procedure       up(i,x:longint);
begin
        while i<=30000 do
         begin
          bit[i]:=max(bit[i],x);
          i:=i+i and(-i);
         end;
end;
function        get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
          tg:=max(tg,bit[i]);
          i:=i-i and (-i);
         end;
         exit(tg);
end;

procedure       xuly;
var     i,j     :       longint;
begin
        randomize;
        QS(1,n);
        d[a[1].cs]:=1;
        up(a[1].x,1);
        for i:=2 to n do
         begin
             d[a[i].cs]:=get(a[i].x-1)+1;
             up(a[i].x,d[a[i].cs]);
         end;
        for i:=1 to n do
         writeln(g,d[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

