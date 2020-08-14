const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
type    bg      =       record
        dt,d,r,c,cs:longint;
        end;
var     g,f     :       text;
        n       :       longint;
        a,kq       :       array[0..5000] of bg;
        dd,luu   :       array[0..5000] of longint;
procedure       mo      ;
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
var     i,j,max,min:longint;
        tg      :       array[1..3] of integer;
begin
        readln(f,n);
        for i:=1 to n do
          begin
                max:=0;
                min:=maxint;
                readln(f,tg[1],tg[2],tg[3]);
                for j:=1 to 3 do
                        begin
                                if tg[j]>max then max:=tg[j];
                                if tg[j]<min then min:=tg[j];
                        end;
                a[i].cs:=i;
                a[i].c  :=min;
                a[i].d:=max;
                a[i].r:=(tg[1]+tg[2]+tg[3])-max-min;
                a[i].dt:=a[i].d*a[i].r;
          end;
end;
procedure       QS(l,h:longint);
var     i,j,x:longint;
        tg:     bg;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].dt;
        repeat
                while a[i].dt>x do inc(i);
                while a[j].dt<x do dec(j);
                if i<=j then
                begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);dec(j);
                end;
        until   i>j;
if i<h then qs(i,h);
if j>l then qs(l,j);
end;
procedure       QHD;
var     i,j     :       longint;
begin
        dd[0]:=0;   luu[0]:=0;luu[1]:=0;
        for i:=1 to n do
         begin
                dd[i]:=0;
         for j:=0 to i-1 do
          if (a[j].r>=a[i].r)and(a[j].d>=a[i].d) then
          if dd[j]+a[i].c>dd[i] then
          begin
                dd[i]:=dd[j]+a[i].c;
                luu[i]:=j;
          end;
         end;
end;
procedure       xuat;
var     i,j:longint;
begin
        j:=1;
        for i:=2 to n do if dd[i]>dd[j] then j:=i;
        i:=0;
        while j>0 do
        begin
                inc(i);
                kq[i].cs:=a[j].cs;
                kq[i].r:=a[j].r;
                kq[i].c:=a[j].c;
                kq[i].d:=a[j].d;
                j:=luu[j];
        end;
        writeln(g,i);
        for j:=i downto 1 do   writeln(g,kq[j].cs,' ',kq[j].r,' ',kq[j].d,' ',kq[j].c);
end;
begin
        mo;
        doc;
        QS(1,n);
        QHD;
        xuat;
        dong;
end.

