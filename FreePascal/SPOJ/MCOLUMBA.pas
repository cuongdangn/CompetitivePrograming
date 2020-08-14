{$mode objFpc}
Uses Math;
Const
                finp            =               '';
                fout            =               '';
                maxn            =               60;
type
                Arr             =               Array[1..maxn] of byte;
                Arr2            =               Array[0..9] of integer;
var
                fi,fo           :               text;
                N               :               integer;
                X,Y,Z           :               String;
                A,B             :               Arr;
                SlB             :               Arr2;
                Res             :               boolean;
procedure Openfile;
begin
        Assign(fi,finp);reset(fi);
        Assign(fo,fout);rewrite(fo);
end;
procedure Closefile;
begin
        Close(fi);Close(fo);
end;
procedure Swap(X:String;var A:Arr);
var
        i               :               integer;
begin
        N:=Length(X);
        For i:=1 to N do
                A[i]:=ord(X[N-i+1])-48;
end;
procedure Enter;
begin
        Readln(fi,X);
        Readln(fi,Y);
        Swap(X,A);Swap(Y,B);
end;
procedure Init;
var
        i               :               integer;
begin
        fillchar(slb,sizeof(slb),0);
        For i:=1 to N do
                inc(SlB[B[i]]);
end;
Procedure Build1(i:integer;ok:boolean);
var
        j               :               integer;
        L               :               String;
begin
        if res then exit;
        if i=0 then
        begin
                res:=true;
                exit;
        end;
        L:=Z;
        For j:=(1-ord(ok))*A[i] to 9 do
        if SlB[j]>0 then
        begin
                dec(SlB[j]);
                Z:=L+chr(j+48);
                Build1(i-1,ok or (j>A[i]));
                if res then exit;
                inc(SlB[j]);
                Z:=L;
        end;
end;
Procedure Build2(i:integer;ok:boolean);
var
        j               :               integer;
        L               :               String;
begin
        if res then exit;
        if i=0 then
        begin
                if Z<X then res:=true;
                exit;
        end;
        L:=Z;
        For j:=Max(ord(ok)*9,A[i]) downto 0 do
        if SlB[j]>0 then
        begin
                dec(SlB[j]);
                Z:=L+chr(j+48);
                Build2(i-1,ok or (j<A[i]));
                if res then exit;
                inc(SlB[j]);
                Z:=L;
        end;
end;
procedure Process;
begin
        Init;
        Z:='';Res:=False;
        Build1(N,false);
        if Z='' then Z:='0';
        Writeln(fo,Z);
        Init;
        Z:='';Res:=False;
        Build2(N,False);
        if Z='' then Z:='0';
        Writeln(fo,Z);
end;
begin
        Openfile;
        Enter;
        Process;
        Closefile;
end.
