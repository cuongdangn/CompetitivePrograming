uses    math;
const   finp    =       'HIST.INP';
        fout    =       'HIST.OUT';
var     n       :       longint;
        kq      :       int64;
        l,lef,ri       :       array[0..100001] of longint;
        g,f     :text;
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
procedure       lr;
var     i,j     :       longint;
begin
        l[0]:=-maxlongint;
        l[n+1]:=-maxlongint;
        for i:=1 to n do
         begin
          j:=i-1;
          while l[j]>=l[i] do j:=lef[j];
          lef[i]:=j;
         end;
        ///////////////
        for i:=n downto 1 do
         begin
          j:=i+1;
          while l[j]>=l[i] do j:=ri[j];
          ri[i]:=j;
         end;
         ////////////////
         for i:=1 to n do
          kq:=max(kq,int64(ri[i]-lef[i]-1)*int64(l[i]));
end;
procedure       xuly;
var     i,j,k:longint;
begin
        kq:=0;
        read(f,n);
        while n<>0 do
         begin
         kq:=0;
          for i:=1 to n do read(f,l[i]);
          lr;
          writeln(g,kq);
          read(f,n);
         end;
end;
begin
        mo;
        xuly;
        dong;
end.

