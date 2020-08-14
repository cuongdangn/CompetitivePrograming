uses crt;
const fin='';
fout='';
base=1000000000;

var f:text;
a:array[1..100,1..100]of longint;
b:array[1..100,1..100]of longint;
m,n:integer;

procedure nhap;
var i,j:integer;
begin
assign(f,fin);
reset(f);
readln(f,m,n);
for i:=1 to m do
begin
for j:=1 to n do
begin
read(f,a[i,j]);
a[i,j]:=abs(a[i,j])mod base;
end;
readln(f);
end;
close(f);
end;

function UCLN(a, b:longint):longint;

begin

     if (a<b) then

          UCLN:=UCLN(b, a)

     else if (b=0) then

          UCLN:=a

     else

          UCLN:=UCLN(b,  a mod b);

end;

procedure run1;
var i,j,k,h:integer;
begin
for i:=1 to m do b[i,1]:=1;

for i:=1 to m do
for j:=1 to n-1 do
begin
for k:=1 to i do
for h:=1 to j-1 do
if ucln(a[i,j],a[k,h]) >1 then b[i,j]:=(b[i,j] mod base+b[k,h] mod base) mod base;

for k:=1 to i-1 do
if ucln(a[i,j],a[k,j]) >1 then b[i,j]:=(b[i,j] mod base+b[k,j] mod base) mod base;
end;
end;

procedure run2;
var i,j,k:integer;
begin
for i:=1 to m do
for k:=1 to i do
for j:=1 to n-1 do
if ucln(a[i,n],a[k,j]) >1 then b[i,n]:=(b[i,n] mod base+b[k,j] mod base) mod base;
end;

procedure xuat;
var i:integer;
        res:int64;
begin
assign(f,fout);
rewrite(f);
res:=0;
for i:=1 to m do res:=(res mod base+b[i,n] mod base) mod base;
writeln(f,res);
close(f);
end;

begin
nhap;
run1;
run2;
xuat;
end.
