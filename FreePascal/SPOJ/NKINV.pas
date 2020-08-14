Const
    inp='DNC.INP';
    out='';
    maxN=60000;
Var
    fi,fo:text;
    a,T:array[1..maxN] of longint;
    n:longint;
    Result:int64;

Procedure OpenFile;
Begin
    assign(Fi,inp);
    Reset(Fi);
    assign(fo,out);
    Rewrite(fo);
End;

Procedure Enter;
Var
    i:longint;
Begin
    Readln(Fi,n);
    For i:=1 to n do Read(fi,a[i]);
End;

Function Find(u:longint):longint;
Begin
    IF u<1 then
        Begin
            Find:=0;
            Exit;
        End;
    Find:=t[u]+Find(u-u and (-u));
End;

Procedure Update(u:longint);
Begin
    IF u>maxN then Exit;
    t[u]:=t[u]+1;
    Update(u+u and (-u));
End;

Procedure solve;
Var
    i:longint;
Begin
    For i:=n downto 1 do
        Begin
            Result:=Result+Find(a[i]-1);
            Update(a[i]);
        End;
End;

Procedure PrintResult;
Begin
    Writeln(fo,Result);
End;

Procedure CloseFile;
Begin
    Close(Fi);
    Close(Fo);
End;

Begin
    OpenFile;
    enter;
    solve;
    PrintResult;
    CloseFile;
End.
