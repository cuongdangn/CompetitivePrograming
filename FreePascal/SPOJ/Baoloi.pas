const   finp    =       'baoloi.inp';
        fout    =       '';
        eps     =       1e-12;
type    diem    =       record
        x,y     :       extended;
        end;
        dd      =       record
        l,goc   :       extended;
        cs      :       longint;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..100000] of diem;
        luu     :       array[1..100000] of longint;
        b       :       array[1..100000] of dd;
        m       :       longint;
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
         read(f,a[i].x,a[i].y);
end;
function        kc(a,b:diem):extended;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
function        ccw(a,b,c:diem):longint;
var     x1,y1,x2,y2,t     :       extended;
begin
        x1:=b.x-a.x;
        y1:=b.y-a.y;
        x2:=c.x-b.x;
        y2:=c.y-b.y;
        t:=x1*y2-x2*y1;
        if abs(t)<=eps then exit(0);
        if t<0 then exit(-1);
        exit(1);
end;
procedure       swap(var a,b:diem);
var     tg      :       diem;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x,tg    :       dd;
begin
        i:=l;
        j:=h;
        x:=b[random(h-l+1)+l];
        repeat
                while (b[i].goc>x.goc)or((abs(b[i].goc-x.goc)<=eps)and(x.l>b[i].l)) do inc(i);
                while (b[j].goc<x.goc)or((abs(b[j].goc-x.goc)<=eps)and(x.l<b[j].l)) do dec(j);
                if i<=j then
                 begin
                        tg:=b[i];
                        b[i]:=b[j];
                        b[j]:=tg;
                        inc(i);dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       baoloi;
var     i,j     :       longint;
begin
        for i:=2 to n do
         if (a[i].y<a[1].y)or((abs(a[i].y-a[1].y)<=eps)and(a[i].x<a[1].x)) then swap(a[1],a[i]);
        ///
        for i:=2 to n do
         begin
                b[i-1].l:=kc(a[1],a[i]);
                b[i-1].cs:=i;
                b[i-1].goc:=(a[i].x-a[1].x)/b[i-1].l;
         end;
         randomize;
         QS(1,n-1);
         luu[1]:=1;
         luu[2]:=b[1].cs;
         m:=2;
         for i:=2 to n-1 do
          begin
           while (m>=2)and(ccw(a[luu[m-1]],a[luu[m]],a[b[i].cs])<=0) do dec(m);
           inc(m);
           luu[m]:=b[i].cs;
          end;
         for i:=1 to m do
          writeln(g,a[luu[i]].x,' ',a[luu[i]].y);
end;
begin
        mo;
        doc;
        baoloi;
        dong;
end.
