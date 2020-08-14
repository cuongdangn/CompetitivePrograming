uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..101] of longint;
        tong    :       array[1..101] of longint;
        d,dd       :       array[1..100,-1000000..1000000] of longint;
        n,tong1,kq       :       longint;
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
        for i:=1 to n do read(f,a[i]);
        for i:=n downto 1 do tong[i]:=tong[i+1]+a[i];
        tong1:=tong[1];
end;
function        tinh(i,t1,cl,tt:longint):longint;
var     dem     :       longint;
begin
        if i=n+1 then
         begin
          if (t1>0)and(cl=0) then exit(0) else
           exit(-maxlongint);
         end;
        if (min(tt-t1,t1)>(tong1 div 2))or(abs(cl)-tong[i]>0) then exit(-maxlongint);
        if dd[i,cl]<>-1 then exit(d[i,cl]);
        dem:=tinh(i+1,t1,cl,tt);
        dem:=max(dem,tinh(i+1,t1+a[i],tt-t1-t1-a[i],tt+a[i])+a[i]);
        dem:=max(dem,tinh(i+1,t1,tt-t1+a[i]-t1,tt+a[i]));
        d[i,cl]:=dem;
        dd[i,cl]:=0;
        exit(dem);
end;
procedure       xuly;
var     i,j,t     :       longint;
begin
        for i:=1 to n do
         for j:=- tong1 div 2 to tong1 div 2 do
          dd[i,j]:=-1;
         t:=tinh(1,0,0,0);
         if t<0 then writeln(g,0)
         else writeln(g,t);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
