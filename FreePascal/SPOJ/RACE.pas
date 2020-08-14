{$mode ObjFpc}
Uses Math;
Const
                finp            =               'DNC.INP';
                fout            =               '';
                maxn            =               300;
                Vc              =               maxlongint div 2;
var
                fi,fo           :               text;
                N,m               :               integer;
                A               :               Array[1..maxn,1..maxn] of integer;
                F               :               Array[0..1,0..maxn,0..maxn] of integer;
procedure Openfile;
begin
        Assign(fi,finp);Reset(fi);
        Assign(fo,fout);Rewrite(fo);
end;
procedure Closefile;
begin
        Close(fi);Close(fo);
end;
procedure Enter;
var
        i,j             :               integer;
        c       :       string;
begin
        Readln(fi,M,n);
        For i:=1 to N do
        begin
               readln(fi,c);
               for j:=1 to m do if c[j]='*' then a[i,j]:=1;
        end;
end;
Function Maxx(A,B,C,D,E:integer):integer;
begin
        Maxx:=Max(A,Max(B,Max(C,Max(D,E))))
end;
procedure Optimize;
var
        i,k,x1,x2,y1,y2 :               integer;
begin
        i:=1;
        For x1:=0 to N do
	For x2:=0 to N do
		F[0,x1,x2]:=-Vc;
	F[0,1,1]:=A[1,1];
        For k:=3 to m+N do
        begin
                For x1:=0 to N do
                For x2:=0 to N do
                        F[i,x1,x2]:=-Vc;
                For x1:=1 to N do
                For x2:=1 to N do
                if (x1<k) and (x1>k-m-1)
                and (x2<k) and (x2>k-m-1) then
                begin
                        F[i,x1,x2]:=Maxx(F[i,x1,x2],F[1-i,x1,x2],F[1-i,x1,x2-1],F[1-i,x1-1,x2],F[1-i,x1-1,x2-1]);
                        y1:=k-x1;y2:=k-x2;
                        if x1<>x2 then
                                F[i,x1,x2]:=F[i,x1,x2]+A[x1,y1]+A[x2,y2]
                        else
                                F[i,x1,x2]:=F[i,x1,x2]+A[x1,y1];
                end;
                i:=1-i;
        end;
       Writeln(fo,F[1-i,N,n]);
end;
begin
        Openfile;
        Enter;
        Optimize;
        Closefile;
end.
