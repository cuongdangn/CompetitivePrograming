uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        eps     =       1e-12;
type    po      =       record
        x,y     :       longint;
        go,dd   :       extended;
        end;
var     g,f     :       text;
        a       :       array[1..200] of po;
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
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
          readln(f,a[i].x,a[i].y);
end;
function        kc(a,b:po):extended;
var     tg      :       extended;
begin
        tg:=sqrt(sqr(a.x-b.x)+sqr(a.y-b.y));
        exit(tg);
end;
function        ccw(a,b,c:po):longint;
var     t,x1,x2,y1,y2:   int64;
begin
        x1:=b.x-a.x;
        y1:=b.y-a.y;
        x2:=c.x-b.x;
        y2:=c.y-b.y;
        t:=x1*y2-x2*y1;
        if t=0 then  exit(0);
        if t<0 then exit(-1)
        else exit(1);
end;
procedure       swap(var a,b:po);
var     tg      :       po;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       QS(l,h:longint);
var     t,i,j     :       longint;
        x1,x2     :       extended;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x1:=a[t].go;
        x2:=a[t].dd;
        repeat
         while (a[i].go>x1)or((abs(a[i].go-x1)<=eps)and(a[i].dd<x2)) do inc(i);
         while (a[j].go<x1)or((abs(a[j].go-x1)<=eps)and(a[j].dd>x2)) do dec(j);
         if i<=j then
          begin
           swap(a[i],a[j]);
           inc(i);dec(j);
          end;
         until i>j;
         if i<h then QS(i,h);
         if j>l then QS(l,j);
end;
procedure       inita;
var     i       :       longint;
begin
        for i:=2 to n do
         begin
          a[i].dd:=kc(a[1],a[i]);
          a[i].go:=(a[i].x-a[1].x)/a[i].dd;
         end;
end;

procedure       bl;
var     i,j,dem,tg     :       longint;
        dd      :       extended;
        st      :       array[1..200] of longint;
begin

        for i:=2 to n do
          if (a[i].y<a[1].y) or ((a[i].y=a[1].y) and (a[i].x<a[1].x)) then
           swap(a[i],a[1]);
           inita;
        randomize;
        QS(2,n);

        /////
        st[1]:=1;
        st[2]:=2;
        dem:=2;
        a[n+1]:=a[1];
        for i:=3 to n do
         begin
         while  (dem>1)and(ccw(a[st[dem-1]],a[st[dem]],a[i])<0) do dec(dem);
         inc(dem);
         st[dem]:=i;
         end;
         ///
         if dem>2 then
         while ccw(a[st[dem-1]],a[st[dem]],a[n+1])<0 do dec(dem);
         /////
         dd:=0;
         for i:=1 to dem-1 do
          for j:=i+1 to dem do
          if dd<kc(a[st[i]],a[st[j]]) then
          dd:=kc(a[st[i]],a[st[j]]);
          writeln(g,dd/2:0:6);
end;

begin
        mo;
        doc;
        bl;
        dong;
end.
