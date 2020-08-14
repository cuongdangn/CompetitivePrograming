uses math;
const	fi='DNC.INP';//'lem5.inp';
		fo='';//'lem5.out';
      maxn=100001;

var	f,g:text;
		n,res:longint;
      a,b,vt,bb,aa:array[0..maxn]of longint;
      l,luu:array[0..maxn,0..101]of longint;

procedure mf;
begin
	assign(f,fi);reset(F);
   assign(g,fo);rewrite(G);
end;

procedure df;
begin
	close(F);close(G);
end;

procedure sort(l,r: longint);
var
         i,j,x,y: longint;
begin
	i:=l;
   j:=r;
   x:=b[(l+r) div 2];
   repeat
   	while b[i]<x do inc(i);
      while x<b[j] do dec(j);
      if not(i>j) then
             begin
                y:=b[i];
                b[i]:=b[j];
                b[j]:=y;
                y:=vt[i];
                vt[i]:=vt[j];
                vt[j]:=y;
                inc(i);
                j:=j-1;
             end;
   until i>j;
   if l<j then sort(l,j);
   if i<r then sort(i,r);
end;

procedure nhap;
var i,j:longint;
begin
  readln(f,n);
   for i:=1 to n do begin readln(f,a[i]);vt[i]:=i;end;
   b:=a;
   sort(1,n);
   bb[1]:=1;
   for i:=2 to n do
   	if b[i]=b[i-1] then bb[i]:=bb[i-1] else bb[i]:=bb[i-1]+1;
   for i:=1 to n do begin aa[vt[i]]:=bb[i];end;
end;

 procedure init;
var i,j,t:longint;
begin
  for i:=2 to n do
   for j:=1 to 100 do
    begin
    	if b[i]-j=b[i-1] then luu[bb[i],j]:=bb[i-1]
      else if b[i]-j<b[i-1] then luu[bb[i],j]:=luu[bb[i-1],j-(b[i]-b[i-1])];
    end;
end;

procedure xl;
var i,j,t,k,k1:longint;
begin
	for i:=1 to n do
    for j:=1 to 100 do
    	begin
      	t:=luu[aa[i],j];
	if l[aa[i],j]<l[t,j]+1 then l[aa[i],j]:=l[t,j]+1;
       if res<l[aa[i],j] then
        begin
                res:=l[aa[i],j];
                k:=i;
                k1:=j;
        end;

	end;
    writeln(g,res);
    writeln(g,k,' ',k1);
end;

BEGIN
	mf;
   nhap;
   init;
   xl;
   df;
END.
