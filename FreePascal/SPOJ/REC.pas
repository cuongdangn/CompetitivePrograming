uses    math;
const   finp    =       'REC.INP';
        fout    =       'REC.OUT';
type    duong   =       record
        l       :       double;
        x,y     :       int64;
        cs1,cs2 :       longint;
        end;
        bg      =       record
        x,y     :       int64;
        end;
var     g,f     :       text;
        kq      :       int64;
        a       :       array[1..1500] of bg;
        dt      :       array[1..1124251] of duong;
        n,m     :       longint;
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
var     i,j,t      :       longint;
        tg,x      :        duong;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=dt[t];
        repeat
                while (dt[i].x<x.x)or((dt[i].x=x.x)and(dt[i].y<x.y))or((dt[i].x=x.x)and(dt[i].y=x.y)and(dt[i].l<x.l)) do inc(i);
                while (dt[j].x>x.x)or((dt[j].x=x.x)and(dt[j].y>x.y))or((dt[j].x=x.x)and(dt[j].y=x.y)and(dt[j].l>x.l)) do dec(j);
                if i<=j then
                        begin
                                tg:=dt[i];
                                dt[i]:=dt[j];
                                dt[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function        kc(a,b:bg):int64;
begin
        exit((sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
function        tinhs(a1,b1:duong):int64;
var      s      :       int64;
        i,j,k   :       longint;
begin
        i:=a1.cs1;
        j:=a1.cs2;
        k:=b1.cs1;
        s:=abs((a[i].x-a[k].x)*(a[i].y+a[k].y)+(a[k].x-a[j].x)*(a[k].y+a[j].y)+(a[j].x-a[i].x)*(a[j].y+A[i].y));
        exit(s);
end;
procedure       init;
var     i,j,k1,k2     :       longint;
begin
        for i:=1 to n-1 do
         for j:=i+1 to n do
          begin
           inc(m);
           dt[m].l:=kc(a[i],a[j]);
           dt[m].cs1:=i;
           dt[m].cs2:=j;
           dt[m].x:=(a[i].x+a[j].x);
           dt[m].y:=(a[i].y+a[j].y);
          end;
        randomize;
        QS(1,m);
        i:=1;
        while i<m do
         begin
           j:=i;
           while (j<m)and(dt[j].x=dt[j+1].x)and(dt[j].y=dt[j+1].y)and(dt[j].l=dt[j+1].l) do inc(j);
           for k1:=i to j-1 do
            for k2:=k1+1 to j do
             kq:=max(kq,tinhs(dt[k1],dt[k2]));
            i:=j+1;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        init;
        dong;
end.