uses    math;
var  a,b     :       array[1..32] of longint;
procedure       xuly(x,y:longint);
var     t1,t2,m,r,l,i   :       longint;
begin
        t1:=x;
        m:=0;
        t2:=y;
        while (t2>0)and(t1<>t2) do
         begin
          r:=t1 mod t2;
          inc(m);
          a[m]:=t1;b[m]:=t2;
          t1:=t2;t2:=r;
         end;
        inc(m);
        a[m]:=t1; b[m]:=t1;
        l:=0;
        for i:=m-1 downto 1 do
           if (abs(a[i]-b[i])=min(a[i+1],b[i+1]))and(l=1) then l:=0
           else l:=1;
        if l=0 then writeln('S')
        else writeln('T');
end;
procedure       swap(var a,b        :       longint);
var     tg      :       longint;
begin
        tg:=a;a:=b;b:=tg;
end;
procedure       doc;
var     u,v     :       longint;
begin
        repeat
         readln(u,v);
         if u<v then swap(u,v);if (u=0)and(v=0) then exit;
         xuly(u,v);
        until false;
end;
begin
        doc;
end.