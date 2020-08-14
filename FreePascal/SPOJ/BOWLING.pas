uses    math;
const   finp    =       'BOWLING.INP';
        fout    =       'BOWLING.OUT';
var     f,g     :       text;
        n,r,t       :       longint;
        kq      :   int64;
        d       :   array[0..600001,0..1] of int64;
        b,a       : array[0..600001] of int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       xuly;
var     i       :longint;
begin
        for i:=1 to n+r*2 do
         begin
          d[i,0]:=-trunc(1e15);
          d[i,1]:=-trunc(1e15);
         end;
         d[0,0]:=0;
         kq:=-trunc(1e15);
         for i:=1 to n+r*2 do
          begin
           d[i,0]:=max(d[i-1,0],d[i-1,1]);
           if i>=2*r+1 then
             d[i,1]:=max(d[i-1,1]+a[i],d[i-2*r-1,0]+b[i]-b[i-2*r-1]);
           if kq<d[i,1] then kq:=d[i,1];
          end;
          writeln(g,kq);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          readln(f,n,r);
          for j:=1 to n+r*2 do a[j]:=0;
          for j:=1 to n do read(f,a[j+r]);
          for j:=1 to n+r*2 do b[j]:=b[j-1]+a[j];
          xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.