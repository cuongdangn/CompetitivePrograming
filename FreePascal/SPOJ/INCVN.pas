const   finp    =       '';
        fout    =       '';
        base    =       5000000;
var     g,f     :       text;
        n,k,kq     :       longint;
        d       :       array[0..1,1..10010] of longint;
        a,b,cs     :       array[1..10010] of longint;
        bit     :       array[1..10010] of longint;
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
var     i,j :Longint;
begin
        readln(f,n,k);
        for i:=1 to n do readln(f,a[i]);
end;
function        get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
          tg:=(tg+bit[i])mod base;
          i:=i-i and (-i);
         end;
         exit(tg)
end;
procedure       up(i,x:longint);
begin
        while i<=n do
         begin
          bit[i]:=(bit[i]+x)mod base;
          i:=i+i and(-i)
         end;
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
                                tg:=cs[i];
                                cs[i]:=cs[j];
                                cs[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       rr;
var     k,i       :       longint;
begin
        randomize;
        for i:=1 to n do
         cs[i]:=i;
        QS(1,n);
        k:=1;
        b[cs[1]]:=1;
        for i:=2 to n do
         begin
          if a[i]<>a[i-1] then inc(k);
          b[cs[i]]:=k;
         end;
end;
procedure       xuly;
var     i,j,l,t     :       longint;
begin
        rr;
        for i:=1 to n do
         d[0,i]:=1;
        l:=1;
        for i:=2 to k do
         begin
          for j:=1 to n do bit[j]:=0;
          for j:=1 to n do
           begin
            t:=get(b[j]-1);
            d[l,j]:=t;
            up(b[j],d[1-l,j]);
           end;
           l:=1-l;
          end;
          for i:=1 to n do
           kq:=(kq+d[1-l,i])mod base;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
