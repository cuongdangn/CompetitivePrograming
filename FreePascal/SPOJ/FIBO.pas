uses crt;
const
     fi='fibo.inp';
     fo='fibo.out';
var
     a,b,c:array[1..250] of byte;
     n:word;
     f:text;
procedure nhap;
var
   i,l,r:word;
   t:char;
   tg:byte;
begin
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        fillchar(c,sizeof(c),0);
        assign(f,fi);reset(f);
        n:=0;
        while not(eoln(f)) do
           begin
                read(f,t);
                inc(n);
                if t='1' then a[n]:=1;
           end;
        readln(f);
        l:=1;
        r:=n;
        i:=n;
        while l<r do
           begin
                tg:=a[l];
                a[l]:=a[r];
                a[r]:=tg;
                inc(l);
                dec(r);
           end;
        n:=0;
        while not(eoln(f)) do
            begin
                read(f,t);
                inc(n);
                if t='1' then b[n]:=1;
            end;
        readln(f);
        l:=1;
        r:=n;
        while l<r do
        begin
                tg:=b[l];
                b[l]:=b[r];
                b[r]:=tg;
                inc(l);
                dec(r)
        end;
if i>n then n:=i;
        for i:=1 to n  do c[i]:=a[i]+b[i];
close(f);
end;
procedure cong;
var
   i,j:byte;duoc:boolean;
{f1=1;f2=2,f(n)=f(n-1)+f(n-2);f1+f2=f3;2f(n)=f(n+1)+f(n-2);2f(2)=f(3)+f(1)}
begin
{nhung gia tri c[i]=2 thi danx ra de moi c<=1}
repeat
duoc:=true;
j:=n;
while (j>0)and(c[j]<2) do dec(j);
if j>0 then
   begin
   duoc:=false;
   if j>2 then begin dec(c[j],2);inc(c[j+1]);inc(c[j-2]);end;
   if (j=2)and(c[1]=0) then begin dec(c[2],2);inc(c[1]);inc(c[3]);end;
   if (j=2)and(c[1]>=1) then begin dec(c[2]);dec(c[1]);inc(c[3]);end;
   if j=1 then begin dec(c[1],2);inc(c[2]);end;
   if j=n then inc(n);
   end;
until duoc;

repeat
        duoc:=true;
j:=n-1;
while j>0 do
        begin
                if c[j]+c[j+1]=2 then
                begin
                        duoc:=false;
                        c[j]:=0;
                        c[j+1]:=0;;
                        c[j+2]:=1;
                        if j=n-1 then inc(n);
                end;
                dec(j);
        end;
until   duoc;
end;
procedure viet;
var
   i:byte;
begin
        assign(f,fo);
        rewrite(f);
        for i:=n downto 1 do write(f,c[i]);
        writeln(f);
        close(f);
end;
BEGIN
        nhap;
        cong;
        viet;
END.
