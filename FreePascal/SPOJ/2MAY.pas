uses    math;
const   finp    =       '2MAY.INP';
        fout    =       '2MAY.OUT';
type    bg      =       record
        s,t     :       longint;
        end;
var     g,f     :       text;
        a       :       array[0..101] of bg;
        n,m,kq  :       longint;
        d       :       array[0..101,0..101] of longint;
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
         readln(f,a[i].s,a[i].t);
         a[0].s:=-1;
         a[0].t:=-1;
end;
procedure       QS(l,h:longint);
var     i,j,x     :       longint;
        tg      : bg;
begin
        i:=l;
        j:=h;
        x:=a[random(h-l+1)+l].t;
        repeat
                while a[i].t<x do inc(i);
                while a[j].t>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,j     :       longint;
begin
        randomize;
        QS(1,n);
        fillchar(d,sizeof(d),255);
        for i:=1 to n do
         begin
          d[i,0]:=a[i].t-a[i].s+1;
          d[0,i]:=a[i].t-a[i].s+1;
         end;
end;
procedure       xuly;
var     i,j,k     :       longint;
begin
        init;
        d[0,0]:=0;
        for i:=1 to n-1 do
         for j:=i+1 to n do
         begin
                for k:=i-1 downto 0 do
                  begin
                        if a[i].s>a[k].t then
                         d[i,j]:=max(d[i,j],d[k,j]+a[i].t-a[i].s+1);
                        if a[j].s>a[k].t then
                          d[i,j]:=max(d[i,j],d[k,i]+a[j].t-a[j].s+1);
                  end;
                  kq:=max(kq,d[i,j]);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.