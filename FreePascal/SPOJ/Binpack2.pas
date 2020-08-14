{$mode objFpc}
Uses Math;
Const
                finp            =               'binpack2.inp';
                fout            =               'binpack2.out';
                maxn            =               100;
                maxm            =               1048576;
Type
                Arr             =               Array[0..maxm] of int64;
var
                fi,fo           :               text;
                N,k,M           :               integer;
                A               :               Array[0..maxn] of int64;
                S               :               int64;
                Res             :               Array[0..maxn] of integer;
                P,Q,Cs1,Cs2     :               Arr;
procedure Openfile;
begin
        assign(fi,finp);reset(fi);
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
        Readln(fi,N,k);S:=0;
        For i:=1 to N do
        begin
                Read(fi,A[i]);
                S:=S+A[i];
        end;
        Readln(fi);
end;
procedure Subtask3;
var
        T               :               int64;
        i,j,r           :               integer;
        W               :               int64;
begin
        t:=a[1];
        i:=1;

        w:=s div 2;
        while t<w do
                begin
                        res[i]:=1;
                        i:=

END;

Function Get(q:int64;i:integer):integer;
begin
        Get:=q shr (i-1) and 1;
end;
procedure Swap(var A,B:int64);
var
        tmp             :               int64;
begin
        tmp:=A;A:=B;B:=tmp;
end;
procedure Qsort(Var A,Cs:Arr;l,r:integer);
var
        i,j                     :               integer;
        x                       :               int64;
begin
        if l>=r then exit;
        i:=l;j:=r;x:=A[(l+r) shr 1];
        Repeat
                While A[i]<x do inc(i);
                While A[j]>x do dec(j);
                if i<=j then
                begin
                        Swap(A[i],A[j]);Swap(Cs[i],Cs[j]);
                        inc(i);dec(j);
                end;
        Until i>j;
        Qsort(A,Cs,l,j);Qsort(A,Cs,i,R);
end;
Function Find(X:int64;l,r:integer):integer;
var
        mid,d,c         :               integer;
begin
        Find:=0;d:=l;c:=r;
        While d<=c do
        begin
                mid:=(d+c) shr 1;
                if Q[mid]=X then
                        exit(mid)
                else
                if Q[mid]<X then
                        d:=mid+1
                else
                        c:=mid-1;
        end;
end;
procedure Subtask2;
var
        i,j,N1,N2,M1,M2,u,v     :               integer;
        T,W                     :               int64;
begin
        W:=S div 2;
        N1:=N div 2;N2:=N-N1;
        M1:=1 shl N1-1;M2:=1 shl N2-1;
        For i:=0 to M1 do
        begin
                T:=0;
                For j:=1 to N1 do
                if Get(i,j)=1 then
                        T:=T+A[j];
        //        S1[i]:=T;
                P[i+1]:=T;Cs1[i+1]:=i;
        end;
        For i:=0 to M2 do
        begin
                T:=0;
                For j:=1 to N2 do
                if Get(i,j)=1 then
                        T:=T+A[N1+j];
                Q[i+1]:=T;Cs2[i+1]:=i;
        end;
        Qsort(Q,Cs2,1,M2+1);
        For i:=1 to M1+1 do
        if P[i]<W then
        begin
                j:=Find(W-P[i],1,M2+1);
                if j<>0 then
                        break;
        end;
        For u:=1 to N1 do
        if Get(Cs1[i],u)=1 then
                Res[u]:=1
        else
                Res[u]:=2;
        For u:=1 to N2 do
        if Get(Cs2[j],u)=1 then
                Res[N1+u]:=1
        else
                Res[N1+u]:=2;
        For u:=1 to N do
                Write(fo,Res[u]);
        Writeln(fo);
end;
procedure Solve;
begin
        Enter;
        if K>=1 then Subtask3
        else Subtask2;
end;
procedure Process;
var
        i,Test          :               integer;
begin
        Readln(fi,Test);
        For i:=1 to test do
                Solve;
end;
begin
        Openfile;
        Process;
        Closefile;
end.
