Program factors;
Uses math;
Const fi='factors.inp';
      fo='factors.out';
      P:array[1..20] of longint=(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71);
Var A,Kq,D:array[0..1009] of int64;
    F:array[0..100,0..100] of int64;
    K:array[0..1009] of int64;
    m:longint;
    base : int64;
Procedure Mf;
Begin
        Assign(input,fi);
        Reset(input);
        Assign(output,fo);
        Rewrite(output);
End;

Procedure Df;
Begin
        Close(input);
        Close(output);
End;

Procedure Readfile;
Var i:longint;
    x:int64;
Begin
        base := 1;
        For i:=1 to 62 do base :=base *2;
        x:=base-1;
        base:=base+x;
        m:=0;
        While not eof(input) do
        Begin
                inc(m);
                Readln(A[m]);
                D[m]:=base;
        End;
End;

{Function gt(x:int64):int64;
Var i:longint;
    t:int64;
Begin
        If x=0 then Exit(1);
        t:=1;
        For i:=1 to x do t:=t*i;
        Exit(t);
End;}

Function C(i,k:longint):int64;
Var s:int64;
Begin
        If F[i,k] <> -1 then Exit(F[i,k]);
        If i = 0 then Exit(1);
        If k = 0 then Exit(0);
        s:=C(i-1,k-1)+C(i,k-1);
        F[i,k]:=s;
        C:=s;
End;

Function tinh(x:longint):int64;
Var i:longint;
    y,p,l:int64;

Begin
        p:=0;
        For i:=1 to x do p:=p+k[i];
        y:=0;
        l:=1;
        For i:=1 to x do
        If base div l >= C(k[i],p-y) then
        Begin
                l:=l*C(k[i],p-y);
                y:=y+K[i];
        End;
        Exit(l);
End;

Procedure Duyet(i:longint;n:int64);
Var j:longint;
    y:real;
    x:int64;
Begin
        If n>1 then
        Begin
                x:=tinh(i-1);
                For j:=1 to m do If x =  a[j] then D[j]:=min(D[j],n);
        End;
        For j:= 1 to k[i-1] do
        Begin
                If n < base then
                y:= base / n;
                If (y > p[i]) and (n<base) then
                Begin
                        n:=n*p[i];
                        k[i]:=j;
                        Duyet(i+1,n);
                End;
        End;

End;


Procedure Xuat;
Var i:longint;
Begin
        For i:=1 to m do
        Writeln(A[i],' ',D[i]);
End;

BEGIN
        Mf;
        Readfile;
        Fillchar(F,sizeof(F),255);
   //     Writeln(C(31,63));
        k[0]:=63;
        Duyet(1,1);
        Xuat;
        Df;
END.
