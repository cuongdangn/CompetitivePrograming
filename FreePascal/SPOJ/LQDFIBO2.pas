{$mode Objfpc}{$H+}
Uses    Math;
Const           maxn            =               20;
                Base            =               15111992;
Type
                Matrix          =               Array[1..3,1..3] of Int64;
Var             N               :               Integer;
                S1,S2,S         :               String;
                F               :               Array[1..maxn] of int64;
                CC,LL,Res       :               int64;
                A,B1,B2,C       :               Matrix;
Procedure       doc;
begin
        Readln(N);
        Readln(S1);
        Readln(S2);
        Readln(S);
end;
Function Nhan(A,B:Matrix):Matrix;
var
        i,j,k           :               byte;
        X               :               int64;
        C               :               Matrix;
begin
        For i:=1 to 3 do
        for j:=1 to 3 do
        begin
                X:=0;
                for k:=1 to 3 do
                        X:=(X+((A[i,k] mod Base)*(B[k,j] mod Base)) mod Base) mod Base;
                C[i,j]:=X;
                If C[i,j]<0 then inc(C[i,j],Base);
        end;
        Exit(C);
end;
Function Power(A:Matrix;N:Integer):matrix;
var
        B               :               Matrix;
begin
        If N=1 then Exit(A);
        B:=Power(A,N div 2);
        B:=Nhan(B,B);
        If odd(N) then Power:=Nhan(B,A)
        Else Power:=B;
end;
Function Find(X,Y:String):int64;
var
        i,j             :               integer;
begin
        Find:=0;
        If Length(Y)<Length(X) then exit;
        For i:=1 to Length(Y)-LEngth(X)+1 do
        if X[1]=Y[i] then
        if Copy(Y,i,Length(X))=X then inc(Find);
end;
Procedure Init;
var
        i               :               byte;
        Tmp             :               String;
begin
        F[1]:=Find(S,S1);F[2]:=Find(S,S2);
        for i:=3 to maxn do
        begin
                Tmp:=S2+S1;
                S1:=S2;S2:=Tmp;
                F[i]:=(Find(S,Tmp)) mod Base;
        end;
        CC:=(F[maxn]-F[maxn-1]-F[maxn-2]) mod Base;
        LL:=(F[maxn-1]-F[maxn-2]-F[maxn-3]) mod Base;
        B1[2,1]:=1;B1[1,2]:=1;B1[2,2]:=1;B1[3,2]:=LL;B1[3,3]:=1;
        B2[2,1]:=1;B2[1,2]:=1;B2[2,2]:=1;B2[3,2]:=CC;B2[3,3]:=1;
        A[1,1]:=F[maxn-1];A[1,2]:=F[maxn];A[1,3]:=1;
end;
Procedure       xuly;
Var
        i,j,T           :               integer;
        D1,D2           :               Matrix;
begin
        Init;
        If N<=20 then
        begin
                Res:=F[N];
                If F[N]<0 then inc(F[N],Base);
                Writeln(Res);Exit;
        end;
        If N=21 then
        begin
                D1:=Nhan(A,B1);
                Writeln(D1[1,2] mod Base);
                exit;
        end;
        T:=(N-20);
        If odd(T) then
        begin
                i:=T div 2+1;j:=i-1;
        end
        else
        begin
                i:=T div 2;j:=i;
        end;
        D1:=Power(B1,i);D2:=Power(B2,j);
        C:=Nhan(A,D1);
        C:=Nhan(C,D2);
        Writeln(C[1,2] mod Base);
end;
begin
       doc;
       xuly;
end.

