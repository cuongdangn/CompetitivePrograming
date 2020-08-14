uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a,min,maxx      :       array[1..1000010] of longint;
        t1,t2   :       array[0..1000001] of int64;
        kq      :       int64;
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
         read(f,a[i]);
end;
procedure       xuly;
var     i,j     :       longint;
        kq1,sl1,sl2:qword ;
begin
        for i:=1 to n do t1[i]:=t1[i-1]+int64(a[i]);
        for i:=n downto 1 do t2[i]:=t2[i+1]+int64(A[i]);
        min[1]:=1;
        maxx[1]:=1;
        for i:=2 to n do
         begin
          if t1[i]<t1[min[i-1]] then min[i]:=i else min[i]:=min[i-1];
          if t1[i]>t1[maxx[i-1]] then maxx[i]:=i else maxx[i]:=maxx[i-1];
         end;
         kq:=0;
        for i:=2 to n do
         begin
         kq:=max(kq,abs(-t2[i]+t1[min[i-1]]));
         kq:=max(kq,abs(-t2[i]+t1[maxx[i-1]]));
         end;
       write(g,kq,' ');
       /////////////////
       sl1:=1;
       sl2:=1;
       kq1:=0;
       for i:=2 to n do
       begin
        if abs(t2[i]-t1[min[i-1]])=kq then inc(kq1,sl2);
        if min[i-1]<>maxx[i-1] then
         if abs(t2[i]-t1[maxx[i-1]])=kq then inc(kq1,sl1);
        if t1[i]=t1[maxx[i-1]] then inc(sl1) else if t1[i]=t1[maxx[i]] then sl1:=1;
        if t1[i]=t1[min[i-1]] then inc(sl2) else if t1[i]=t1[min[i]] then sl2:=1;
        end;
        writeln(g,kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

