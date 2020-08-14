{$mode ObjFpc}{$H+}
Uses Math;
Const
                finp            =               'DNC.inp';
                fout            =               'DNC.out';
                maxn            =               100;
                tt              =               #64;
var
                fi,fo           :               text;
                N,k             :               integer;
                A               :               Array[1..maxn] of String;
                B               :               array[1..maxn] of int64;
                F               :               Array[0..maxn,0..maxn,0..8] of String;
procedure Openfile;
begin
        Assign(fi,finp);reset(fi);
        assign(fo,fout);rewrite(fo);
end;
procedure Closefile;
begin
        Close(fi);Close(fo);
end;
procedure Enter;
var
        i               :               integer;
begin
        Readln(fi,N,K);
        For i:=1 to N do
        begin
                Readln(fi,A[i]);
                Val(A[i],B[i]);
                B[i]:=B[i] mod 9;
        end;
end;
procedure Sort;
var
        i,j             :               integer;
        x               :               int64;
        tmp             :               String;
begin
        For i:=1 to N-1 do
        for j:=i+1 to N do
        if A[i]+A[j]<A[j]+A[i] then
        begin
                tmp:=A[i];A[i]:=A[j];A[j]:=Tmp;
                x:=B[i];B[i]:=B[j];B[j]:=x;
        end;
end;
Function Compare(S1,S2:String):boolean;
begin
        if length(S1)<length(S2) then exit(true);
        if length(S1)=length(S2) then
        if S1<S2 then exit(true);
        exit(false);
end;
procedure Optimize;
var
        i,j,r           :               integer;
begin
        For i:=0 to N do
        for j:=0 to K do
        for r:=0 to 8 do
                F[i,j,r]:=tt;
        for i:=0 to n do
        F[i,0,0]:='';
        For j:=1 to K do
        For i:=1 to N do
        for r:=0 to 8 do
        begin
                if F[i-1,j-1,(9+r-B[i])mod 9]<>tt then
                F[i,j,r]:=F[i-1,j-1,(9+r-B[i]) mod 9]+A[i];
                if ((F[i,j,r]=tt) and (F[i-1,j,r]<>tt)) or
                ((F[i,j,r]<>tt) and (F[i-1,j,r]<>tt) and Compare(F[i,j,r],F[i-1,j,r])) then
                        F[i,j,r]:=F[i-1,j,r];
        end;
        If F[N,K,0]=tt then Writeln(fo,-1)
        else
        Writeln(fo,F[N,K,0]);
end;
procedure Process;
var
        Test,i          :               integer;
begin
        Readln(fi,Test);
        For i:=1 to Test do
        begin
                Enter;
                Sort;
                Optimize;
        end;
end;
begin
        Openfile;
        Process;
        Closefile;
end.
