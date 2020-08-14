const   finp    =       'DNC.inp';
        fout    =       'DNC.OUT';
type    bg      =       record
        a,b     :longint;
        end;
var     g,f     :       text;
        c       :       array[1..10000] of bg;
        d       :       array[0..10000] of longint;
        n,kq       :longint;
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
var     i:longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                readln(f,c[i].a,c[i].b);
                end;
end;
procedure       QS(l,h:longint);
var     i,j,x     :longint;
        tg        :     bg;
begin
        i:=l;
        j:=h;
        x:=c[(l+h) div 2].a;
        repeat
        while c[i].a<x do inc(i);
        while c[j].a>x do dec(j);
        if i<=j then
         begin
                tg:=c[i];
                c[i]:=c[j];
                c[j]:=tg;
                inc(i);dec(j);
         end;
         until i>j;
        if i<h then qs(i,h);
        if j>l then qs(l,j);
end;

procedure       QHD;
var     i,j,t     :       longint;
begin
        d[0]:=0;
        for i:=1 to n do
        begin
             t:=0;
             for j:=1 to i-1 do
             if c[i].a>=c[j].b then
              if d[j]>t then t:=d[j];
              d[i]:=t+c[i].b-c[i].a;
              if d[i]>kq then kq:=d[i];
        end;
end;
procedure       xuat;
begin
        writeln(g,kq);
       { while cs1<>0 do
        begin
                inc(i);
                f1[i]:=c[cs1].cs;
                cs1:=luu[cs1];
        end;
        for i:=j downto 1 do writeln(g,f1[i]);           }
end;
begin
        mo;
        doc;
        QS(1,n);
        QHD;
        xuat;
        dong;
end.
