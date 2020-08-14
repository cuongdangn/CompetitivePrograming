{$H+}
Program primes;
Const fi='primes.inp';
      fo='primes.out';
Type bignum = string;
Var n,m:longint;
    k:int64;
    A,kq:array[0..59] of longint;
    D:array[0..1009] of longint;
    nt:array[0..2000] of boolean;
    sl,sc,tong:longint;
    F:array[0..60,0..2000] of string;
    F1:array[0..51,0..1275,0..1275] of string;
Procedure Mf;
Begin
        Assign(input,fi);
        Reset(Input);
        Assign(output,fo);
        Rewrite(output);
End;

Procedure Df;
Begin
        Close(input);
        Close(output);
End;
Procedure Readfile;
Begin
        Readln(n,k);
End;



Procedure sang(i:longint);
Var j:longint;
Begin
        j:=i+i;
        While j<=2000 do
        Begin
                nt[j]:=false;
                j:=j+i;
        End;
End;

function add(a,b : bigNum): bigNum;
var sum, carry, i, x, y : integer;
c : bigNum;
begin
carry:=0;c:='';
while length(a)<length(b) do a:='0'+a;
while length(b)<length(a) do b:='0'+b;
for i:=length(a) downto 1 do
begin
x:= ord(a[i])-ord('0'); {ord('0')=48}
y:= ord(b[i])-ord('0');
sum:=x + y + carry;
carry:=sum div 10;
c:=chr(sum mod 10 +48)+c;
end;
if carry>0 then c:='1'+c;
add:=c;
end;

function bigDiv1(a:bigNum;b:longint):bigNum;
var s,i,hold:longint;
c:bigNum;
begin
hold:=0;s:=0; c:='';
for i:=1 to length(a) do
begin
hold:=hold*10 + ord(a[i])-48;
s:=hold div b;
hold:=hold mod b;
c:=c+chr(s+48);
end;
while (length(c)>1) and(c[1]='0') do
delete(c,1,1);
bigDiv1:=c;
end;



Procedure Taomang;
Var i:longint;
Begin
        Fillchar(nt,sizeof(nt),true);
        nt[1]:=false;
        nt[0]:=false;
        For i:=2 to 2000 do sang(i);
        For i:=2 to 2000 do If nt[i] then
        Begin
                inc(m);
                D[m]:=i;
        End;
End;

Function tinh(i,t:longint):string;
Var    s:string;
Begin
        If F[i,t] <> '-1' then Exit(F[i,t]);
        If i > n then
        Begin
                If nt[t] and nt[tong-t] then Exit('1');
                Exit('0');
        End;
        s:=add(tinh(i+1,t),tinh(i+1,t+i));
        F[i,t]:=s;
        tinh:=s;
End;

FUnction tinh1(i,t1,t2:longint):string;
Var s,s1:string;
Begin
        If F1[i,t1,t2] <> '-1' then Exit(F1[i,t1,t2]);
        If i>n then
        Begin
                If nt[t1] and nt[t2] and nt[tong-t1-t2] then Exit('1');
                Exit('0');
        End;
   //     s:=add(tinh1(i+1,t1,t2),add(tinh1(i+1,t1+i,t2),tinh1(i+1,t1,t2+i)));
        s:=add(tinh1(i+1,t1+i,t2),tinh1(i+1,t1,t2+i));
        s1:=add(s,tinh1(i+1,t1,t2));
        F1[i,t1,t2]:=s1;
        tinh1:=s1;
ENd;

function bigMod1(a:bigNum;b:int64):int64;
var hold:int64;
    i:longint;
begin
hold:=0;
for i:=1 to length(a) do
hold:=(ord(a[i])-48+hold*10) mod b;
bigMod1:=hold;
end;



Procedure Process;
Var i,t1,j:longint;
    p,x:string;
    z:int64;
Begin
        tong:=0;
        Taomang;
        FOr i:=1 to n do inc(tong,i);
        If nt[tong] then
        Begin
                Writeln(1,' ',1);
              //  For i:=1 to n do Write(1,' ');
        End
        Else
        Begin

                For i:=1 to m do If D[i] > tong then break;
                dec(i);
                If tong-D[i] = 1 then dec(i);
                If tong-D[i] = 4 then dec(i);
                If nt[tong-D[i]] then
                           sc:=2
                Else
                sc:=3;
                If sc = 2 then
                        Begin

                For i:=1 to n+1 do
                For j:=0 to tong do F[i,j]:='-1';
                             p:=tinh(1,0);
                             x:=bigdiv1(p,2);
                             z:=bigmod1(x,k);
                        End
                Else
                Begin
                For i:=1 to n+1 do
                For j:=0 to tong do
                For t1:=0 to tong do F1[i,j,t1]:='-1';
                             p:=tinh1(1,0,0);
                             x:=bigdiv1(p,6);
                             z:=bigmod1(x,k);
                End;

                Writeln(sc,' ',z);
                //For i:=1 to n do Write(kq[i],' ');
        End;
End;

BEGIN
        Mf;
        Readfile;
        Process;
        Df;
END.
