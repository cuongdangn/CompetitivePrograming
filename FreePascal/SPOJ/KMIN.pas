const   fi='';
        fo='';
        maxn=50001;
type    node=record
                i,j:longint;
             end;
        mang=array[1..maxn] of longint;
var     f:text;
        h:array[1..maxn] of node;
        a,b:mang;
        n,m,i,j,k,l,nheap:longint;
procedure doc;
begin
  assign(f,fi);
  reset(f);
  readln(f,n,m,k);
  for i:=1 to n do
    readln(f,a[i]);
  for i:=1 to n do
    readln(f,b[i]);
  close(f);
end;
procedure qsort(var a:mang;lo,hi:longint);
  procedure sort(l,r:longint);
  var i,j,x,y:longint;
  begin
    i:=l;j:=r;x:=a[(l+r) div 2];
    repeat
      while a[i]<x do i:=i+1;
      while a[j]>x do j:=j-1;
      if i<=j then
        begin
          y:=a[i];a[i]:=a[j];a[j]:=y;
          i:=i+1;j:=j-1;
         end;
    until i>j;
    if i<r then sort(i,r);
    if j>l then sort(l,j);
  end;
begin
  sort(lo,hi);
end;
function tinh(i,j:longint):longint;
begin
  tinh:=a[i]+b[j];
end;
procedure capnhat;
var cha,con,x:longint;
    v:node;
begin
  v:=h[1];
  x:=tinh(h[1].i,h[1].j);
  cha:=1;
  while cha*2<=nheap do
    begin
      con:=cha*2;
      if (con<nheap)and(tinh(h[con].i,h[con].j)>tinh(h[con+1].i,h[con+1].j)) then con:=con+1;
      if tinh(h[con].i,h[con].j)>=x then break;
      h[cha]:=h[con];
      cha:=con;
    end;
  h[cha]:=v;
end;
procedure ghi(x:longint);
begin
  writeln(f,x);
end;
procedure lam;
begin
  qsort(a,1,n);
  qsort(b,1,m);
  for i:=1 to m do
    begin
      h[i].i:=1;
      h[i].j:=i;
    end;
  nheap:=m;
  assign(f,fo);
  rewrite(f);
  for k:=1 to k do
    begin
      ghi(tinh(h[1].i,h[1].j));
      if h[1].i<n then
         h[1].i:=h[1].i+1 else
           begin
             h[1]:=h[nheap];
             nheap:=nheap-1;
           end;
      capnhat;
    end;
  close(f);
end;
begin
  doc;
  lam;
end.

