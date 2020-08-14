var     i,n,j,dem,tg     :longint;
        a,cs    :       array[1..2010] of longint;
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

begin
        readln(n);
        for i:=1 to n do read(a[i]);
        for i:=1 to n do cs[i]:=i;
        randomize;
        QS(1,n);
        for i:=2 to n do
         if a[i]=a[i-1] then inc(dem);
        if dem<=1 then begin writeln('NO');exit end;
        writeln('YES');
        for i:=1 to n do write(cs[i],' ');
        writeln;
        for i:=2 to n do if a[i]=a[i-1] then
         begin
          tg:=cs[i];
          cs[i]:=cs[i-1];
          cs[i-1]:=tg;
          break;
         end;
        for j:=1 to n do write(cs[j],' ');
        writeln;
        for j:=i+1 to n do
         if a[j]=a[j-1] then
          begin
           tg:=cs[j];
           cs[j]:=cs[j-1];
           cs[j-1]:=tg;
           break;
          end;
         for i:=1 to n do write(cs[i],' ');
        writeln;
end.