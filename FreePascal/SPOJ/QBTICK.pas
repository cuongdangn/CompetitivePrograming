const
fi = '';
fo = '';
var
f1,f2 : text;
i,j,N,s,f:longint;
L1,L2,L3,C1,C2,C3 : int64;
a,T : array[0..100001] of int64;
Function Fmin(a,b:int64):int64;
begin
if a<b then Fmin:=a else Fmin:=b;
end;
Function Tinh(X:int64):int64;
begin
if X<=L1 then Tinh:=C1
else
if X<=L2 then Tinh:=C2
else
if X<=L3 then Tinh:=C3;
end;
begin
assign(f1,fi);
reset(f1);
readln(f1,L1,L2,L3,C1,C2,C3);
readln(f1,N);
readln(f1,s,f);
A[1]:=0;
for i:=1 to n-1 do readln(f1,a[i+1]);
close(f1);
assign(f2,fo);
rewrite(f2);
{Co so quy hoach dong}
for i:=s+1 to f do T[i]:=1000000000000000000;
T[s]:=0;
A[1]:=0;
{Quy hoach dong}
for i:=s+1 to f do
begin
for j:=i-1 downto s do
if a[i]-a[j]>L3 then break
else
T[i]:=Fmin(T[i],T[j]+tinh(A[i]-A[j]));
end;
write(f2,T[f]);
close(f2);
end.
