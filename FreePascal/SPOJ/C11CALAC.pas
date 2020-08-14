const fi='';
      fo='';
      MAXK=51;
      CS=1000000007;

type mt=array[0..MAXK,0..MAXK] of int64;

var n,k:longint;
    a,b:mt;

procedure mf;
begin
   assign(input,fi);
   reset(input);
   assign(output,fo);
   rewrite(output);
end;

procedure df;
begin
   close(input);
   close(output);
end;

procedure nhap;
begin
   readln(n,k);
end;

procedure init;
var i,j:longint;
begin
   for i:=0 to k do
     begin
       a[i,0]:=1;
       a[i,i]:=1;
     end;
   for i:=2 to k do
     for j:=1 to i-1 do
        a[i,j]:=(a[i-1,j]+a[i-1,j-1]) mod CS;
   a[k+1]:=a[k];
   a[k+1,k+1]:=1;
end;

function nhan(a,b:mt):mt;
var i,j,h:longint;
    c:mt;
begin
   fillchar(c,sizeof(c),0);
   for i:=0 to k+1 do
      for j:=0 to k+1 do
         for h:=0 to k+1 do
            c[i,j]:=(c[i,j]+a[i,h]*b[h,j]) mod CS;
   exit(c);
end;

function lt(n:longint):mt;
var c:mt;
begin
   if n=1 then exit(a);
   c:=lt(n div 2);
   c:=nhan(c,c);
   if odd(n) then
       c:=nhan(c,a);
   exit(c);
end;

procedure xl;
var i,res:longint;
begin
   if n=1 then
      begin
         writeln(1);
         exit;
      end;
   b:=lt(n-1);
   res:=0;
   for i:=0 to k+1 do
       res:=(res+b[k+1,i]) mod CS;
   writeln(res);
end;

procedure solve;
begin
   while not eof do
     begin
        nhap;
        init;
        xl;
     end;
end;

begin
   mf;
   solve;
   df;
end.
