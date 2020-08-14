var     a,b,c   :       int64; i:byte;
        n,kq:int64;
Function        Power(X,Y:Longint):longint;
Begin
                If Y=0 then Exit(1)
                Else
                If Y mod 2<>0 then Exit((Power(X,Y-1)*X) Mod 29)
                Else           Exit((Sqr(Power(X,Y div 2))Mod 29) MOd 29);
End;
BEGIN
                readln(n);
                While n<>0 do
                Begin
                        Kq:=0;
                        If N=0 then Exit;
                        A:=Power(2,2*N+1)-1;
                        B:=Power(3,N+1)-1;
                        C:=Power(167,N+1)-1;
                        A:=A*B*C Mod 29;
                        For i:=0 to 29 do
                        IF (i*13) Mod 29=A then
                        Begin
                                Writeln(i);
                                break;
                        End;
                        Readln(N);
                End;
END.

