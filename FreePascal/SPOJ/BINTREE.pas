//tu tuong la so co preorder[i] nho nhat la goc cay, cac so co inorder[j]<inorder[goc] la thuoc nhanh trai con laij tuoc nhanh phai
// tu do ta lai tiep tuc vs cac cay con nhanh trai va nhanh phai
const   fi='';//'bin.inp';
		fo='';//'bin.out';
      maxn=50001;

var	f,g:text;
		a,b,vt1,vt2:array[0..maxn]of longint;
      m,n:longint;

procedure mf;
begin
	assign(f,fi);reset(F);
   assign(g,fo);rewrite(G);
end;

procedure df;
begin
	close(F);close(G);
end;

procedure nhap;
var i,j:longint;
begin
	readln(f,n);
   for i:=1 to n do
   	begin
      	read(f,a[i]);
         vt1[a[i]]:=i;
      end;
   for i:=1 to n do
   	begin
      	read(f,b[i]);
         vt2[b[i]]:=i;
      end;
end;

procedure duyet(u,v,uu,vv:longint);
var i,j:longint;
begin
	if u=v then begin write(g,a[u],' ');exit;end
   else if u>v then exit;
   i:=vt2[a[u]];
   if i>uu then duyet(u+1,u+i-uu,uu,i-1);
   if i<vv then duyet(u+i-uu+1,v,i+1,vv);
   write(g,a[u],' ');
end;

procedure xl;
var i,j:longint;
begin
	duyet(1,n,1,n);
end;

BEGIN
	mf;
   nhap;
   xl;
   df;
END.
