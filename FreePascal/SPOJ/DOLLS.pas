const   finp    =       'DOLLS.INP';
        fout    =       'DOLLS.OUT';
var     g,f     :       text;
        a       :       array[1..100001] of longint;
        n ,k      :       longint;
        s       :       int64;
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
        readln(f,n,k);
        for i:=1 to n do read(f,a[i]);
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
                while a[i]>x do inc(i);
                while a[j]<x do dec(j);
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
var     i,j,x     :       longint;
begin
        randomize;
        QS(1,n);
        for i:=1 to n do s:=s+a[i];
        x:=1;
        for i:=1 to n do
         begin
          while (x<=n)and((a[i]-a[x])<k) do inc(x);
          if x<=n then
           begin
            s:=s-a[x];
            x:=x+1;
           end;
         end;
         writeln(g,s);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.