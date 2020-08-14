Const Nmax=1000;

Var N:integer;
    a:array [1..Nmax,1..Nmax] of byte;
    f:array [1..Nmax] of integer;
    ct1,ct2,ct3:integer;

Procedure Enter;
Var i,j:integer;

Begin
        readln(N);
        for i:=1 to N do
            for j:=1 to N do read(a[i,j]);
End;

Procedure Print;
Begin
        writeln(ct1,' ',ct2,' ',ct3);
        halt;
End;

Procedure Solve;
Var i,j,z:integer;

Begin
        f[1]:=1;
        ct1:=-1; ct2:=-1; ct3:=-1;
        for i:=2 to N do Begin
            j:=1;
            While (j<i) and (a[i,f[j]]=1) do inc(j);
            for z:=i-1 downto j+1 do
                if a[f[z],i]=1 then f[z+1]:=f[z]
                else Begin
                    ct1:=f[z]; ct2:=f[j]; ct3:=i;
                    Print;
                End;
            f[j+1]:=f[j];
            f[j]:=i;
        End;
End;

BEGIN
        Enter;
        Solve;
        Print;
END.
