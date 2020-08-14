const   finp    =       'DNC.INP';
        fout    =       '';
var     g,f     :       text;
        n,m       :       longint;
        r,h,sb    :       array[1..1000005] of longint;
        cha     : array[1..1000000,0..25] of longint;
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
         read(f,h[i]);
        for i:=1 to n do
         read(f,sb[i]);
end;
procedure       init;
var     i,j       :       longint;
begin
          h[n+1]:=maxlongint;
          for i:=n downto 1 do
           begin
             j:=i+1;
             while h[j]<=h[i] do j:=r[j];
             r[i]:=j;
           end;
          for i:=1 to n do cha[i,0]:=r[i];
          m:=trunc(ln(n+1)/ln(2))+1;
          for i:=1 to m do
           for j:=1 to n do
             cha[j,i]:=cha[cha[j,i-1],i-1];
end;
procedure       nhay(var v:longint;x:longint);
var     i:longint;
begin
 for i:=m downto 0 do
  if x>=1 shl i then
   begin
    v:=cha[v,i];
    x:=x-1 shl i;
   end;
end;
procedure       xuly;
var     i,v       :       longint;
begin
        for i:=1 to n do
         begin
          v:=i;
          nhay(v,sb[i]);
          if v=n+1 then v:=-1;
          writeln(g,v);
         end;
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.


