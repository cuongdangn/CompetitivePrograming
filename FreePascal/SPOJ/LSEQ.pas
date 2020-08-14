uses    math;
const   finp    =       'LSEQ.INP';
        fout    =       'LSEQ.OUT';
var     g,f     :       text;
        n,kq,so0       :       longint;
        a       :       array[1..1000010] of longint;
        d       :       array[-100..100,-1..1000] of longint;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         read(f,a[i]);
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
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

procedure       xuly;
var     i,j     :       longint;
begin
        j:=0;
        randomize;
        QS(1,n);
        for i:=1 to n do
          if a[i]=0 then inc(so0);
        for i:=1 to n do
        if a[i]<>0 then
         begin

          for j:=0 to so0 do
           begin
           d[a[i],j]:=max(d[a[i]-j-1,0]+1+j,d[a[i],j-1]);
           kq:=max(kq,d[a[i],j]);
           end;
         end;

        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
