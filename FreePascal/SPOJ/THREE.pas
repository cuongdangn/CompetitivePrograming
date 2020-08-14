const
  fi='';
  fo='';
  maxn=100;
  maxm=20000;
  vc=10000*maxm;
var
  f:text;
  n,m,luu,kq:longint;
  a,pos,trace:array [0..maxn,0..maxn] of longint;
  dd:array [0..maxm] of longint;

procedure doc;
var
  i,j,u,v,c:longint;
begin
  assign(f,fi);
  reset(f);
  readln(f,n,m);
  for i:=1 to N do
  for j:=1 to n do
  if i=j then a[i,j]:=0 else a[i,j]:=vc;
  for i:=1 to m do
    begin
      readln(f,u,v,c);
      if c<a[u,v] then
        begin
          a[u,v]:=c;
          a[v,u]:=c;
          pos[u,v]:=i;
          pos[v,u]:=i;
        end
    end;
  close(f);
end;

procedure ghi;
var
  dem,i,u,v,j,k:longint;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,kq);
  dem:=0;
  fillchar(dd,sizeof(dd),0);
  for i:=1 to 3 do
  //truy vet tu dinh luu ve dinh i
  if luu<>i then
    begin
      v:=luu;
      repeat
        u:=trace[v,i];
        inc(dem);dd[dem]:=pos[u,v];
        v:=u;
      until v=i;
    end;
  {  begin
     j:=luu;
     repeat
                k:=j;
                j:=trace[j,i];
                inc(dem);
                 dd[dem]:=pos[k,j];
     until j=i;
     end;}
  writeln(f,dem);
  for i:=1 to dem do write(f,dd[i],' ');
  close(f);
end;

procedure floyd;
var
  k,i,j:longint;
begin
  for i:=1 to n do
  for j:=1 to n do trace[i,j]:=j;
  for k:=1 to n do
  for i:=1 to n do
  if a[i,k]<vc then
  for j:=1 to n do
  if a[k,j]<vc then
  if a[i,j]>a[i,k]+a[k,j] then
    begin
      a[i,j]:=a[i,k]+a[k,j];
      trace[i,j]:=trace[i,k];
    end;
end;

procedure xuly;
var
  i:longint;
begin
  kq:=vc;
  for i:=1 to n do
  if a[i,1]+a[i,2]+a[i,3]<kq then
    begin
      kq:=a[i,1]+a[i,2]+a[i,3];
      luu:=i;
    end;
end;

begin
  doc;
  floyd;
  xuly;
  ghi;
end.
