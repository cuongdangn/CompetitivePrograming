uses    math;
const   finp    =       'HTAB.INP';
        fout    =       'HTAB.OUT';
type    arr     =       array[1..64,1..64] of longint;
var     g,f     :       text;
        n,m,k,n1,m1,kq     :       longint;
        a,b,c   :       arr;
        lef,ri,l  :       array[0..65] of longint;

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
var     i,j     :longint;
begin
        readln(f,m,n,k);
        for i:=1 to m do
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
        for i:=1 to m do
         begin
          for j:=1 to n do read(f,b[i,j]);
          readln(f);
         end;
end;
procedure       taobangc1(x,y    :       longint;a,b:arr);
var     i,j     :       longint;
begin
 for i:=1 to m-x+1 do
  for j:=1 to n-y+1 do
   if abs(a[i,j]-b[x+i-1,y+j-1])<=k then c[i,j]:=1
   else c[i,j]:=0;
end;
procedure       taobangc2(x,y    :       longint;a,b:arr);
var     i,j,j1     :       longint;
begin
 for i:=1 to m-x+1 do
 begin
  j1:=0;
  for j:=n-y+1 to n do
  begin
   inc(j1);
   if abs(a[i,j]-b[x+i-1,j1])<=k then
   c[i,j1]:=1
   else c[i,j1]:=0;
  end;
 end;
end;
procedure       lr;
var     i,j     :       longint;
begin
        l[0]:=-maxlongint;
        l[n1+1]:=-maxlongint;
        for i:=1 to n1 do
         begin
          j:=i-1;
          while l[j]>=l[i] do j:=lef[j];
          lef[i]:=j;
         end;
        ///////////////
        for i:=n1 downto 1 do
         begin
          j:=i+1;
          while l[j]>=l[i] do j:=ri[j];
          ri[i]:=j;
         end;
         ////////////////
         for i:=1 to n1 do
          kq:=max(kq,(ri[i]-lef[i]-1)*l[i]);
end;
procedure       tinh;
var     i,j     :       longint;
begin
        for i:=1 to n1 do l[i]:=0;
        for i:=1 to m1 do
         begin
          for j:=1 to n1 do
           if c[i,j]=1 then l[j]:=l[j]+1
           else l[j]:=0;
          lr;
         end;
end;
procedure       timax(a,b:arr);
var     i,j     :       longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          begin
           taobangc1(i,j,a,b);
           n1:=n-j+1;
           m1:=m-i+1;
           tinh;
       //    if kq=5 then writeln(i,' ',j);
          end;
         /////
         for i:=1 to m do
          for j:=1 to n do
           begin
            taobangc2(i,j,a,b);
            n1:=j;
            m1:=m-i+1;
            tinh;
           end;
end;
procedure       xuly;
begin
        timax(a,b);
        timax(b,a);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
