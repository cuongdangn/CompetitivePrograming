const   finp    =       'TSP.INP';
        fout    =       'TSP.OUT';
type    diem    =       record
        x,y,kc  :       double;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[0..1010] of diem;

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
function        ktra(a,b:diem):boolean;
begin
        if a.x*b.y=a.y*b.x then exit(false)
        else exit(true);
end;
function        kc(a,b:diem):double;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
procedure             xuly1;
var     i,j,k     :       longint;
        tg1,tg2   :       diem;
begin
        a[0].x:=maxlongint;
        a[0].y:=maxlongint;
        a[n+1].x:=-a[0].x;
        a[n+1].y:=-a[0].y;
        k:=0;
        for i:=1 to n do
                if (a[i].y<a[k].y)or((a[i].y=a[k].y)and(a[i].x<a[k].x)) then k:=i;
        tg1:=a[k];
        k:=n+1;
        for i:=1 to n do
                if (a[i].y>a[k].y)or((a[i].y=a[k].y)and(a[i].x>a[k].x)) then k:=i;
        tg2:=a[k];
        writeln(g,kc(tg1,tg2):0:3);
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
        x,tg    :       diem;
begin
        i:=l;
        j:=h;
        x:=a[random(h-l+1)+l];
        repeat
                while a[i].kc<x.kc do inc(i);
                while a[j].kc>x.kc do dec(j);
                if i<=j then
                        begin
                                swap(a[i],a[j]);
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly2(luu:longint);
var     i,j     :       longint;
        kq      :       double;
begin
        swap(a[n],a[luu]);
       for i:=2 to n-1 do
                if (a[i].y<a[1].y)or((a[i].y=a[1].y)and(a[i].x<a[1].x)) then swap(a[1],a[i]);
       for i:=2 to n-1 do
          a[i].kc:=kc(a[i],a[1]);
       randomize;
       QS(2,n-1);
       kq:=kc(a[1],a[n-1])+kc(a[1],a[n]);
       if kq>kc(a[1],a[n-1])+kc(a[n-1],a[n]) then kq:=kc(a[1],a[n-1])+kc(a[n-1],a[n]);
       for i:=2 to n-2 do
       if kq>kc(a[1],a[i-1])+kc(a[i-1],a[n])+kc(a[i],a[n])+kc(a[i],a[n-1])  then kq:=kc(a[1],a[i-1])+kc(a[i-1],a[n])+kc(a[i],a[n])+kc(a[i],a[n-1]);
       writeln(g,kq:0:3);
end;
procedure       xuly;
var     i,j,luu,m     :       longint;
        tg      :     array[1..3] of diem;
begin
        luu:=0;
        for i:=1 to n do
         begin
                m:=0;
                for j:=1 to n do
                 if j<>i then
                        begin
                                inc(m);
                                tg[m].x:=a[j].x-a[i].x;
                                tg[m].y:=a[j].y-a[i].y;
                                if m=3 then break;
                        end;
                if (m=3)and ktra(tg[1],tg[2]) and ktra(tg[1],tg[3]) and ktra(tg[2],tg[3]) then
                        begin
                                luu:=i;
                                break;
                        end;
         end;
         ///////////////////////////
         if luu=0 then xuly1
         else xuly2(luu);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.