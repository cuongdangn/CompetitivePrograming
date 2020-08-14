Type
   ll=LongInt;
   Data=Array [1..nMax,1..nMax] of ll;


Var
   m,n,k,i,j                            : ll;
   Res                                  : ll;
   P,X                                  : Data;


Operator *(Var a,b: Data)c: Data;
Var
   i,j,k,S: ll;
Begin
   FillChar(c,SizeOf(c),0);
   For i:=1 to n do
      For j:=1 to n do
         begin
            S:=0;
            For k:=1 to n do S:=S+a[i,k]*b[k,j];
            c[i,j]:=S Mod Base;
         end;
End;


Procedure EnterData;
Begin
   Assign(InPut,InputFile);
   Reset(InPut);
   Try
      begin
         ReadLn(n,m,k);
      end;
   Finally
   end;
   Close(InPut);
End;


Procedure Init;
Var
   a,b,c: ll;
Begin
   FillChar(X,SizeOf(X),0);
   For i:=1 to n*2 do
      begin
         a:=i-1+n*(Ord(i Mod n=1));
         b:=i+1-n*(Ord(i Mod n=0));
         c:=i+n*(1-2*Ord(i>n));
         X[i,a]:=1;
         X[i,(n Shl 2)+a]:=1;
         X[i+n+n,b+n+n]:=1;
         X[i+n+n,(n Shl 2)+b]:=1;
         X[(n Shl 2)+i,c]:=1;
         X[(n Shl 2)+i,c+n+n]:=1;
      end;
   FillChar(P,SizeOf(P),0);
   n:=n*6;
   For i:=1 to n do P[i,i]:=1;
End;


Procedure Process;
Begin
   Init;
   Dec(k);
   If k<>0 then
   For i:=0 to Trunc(Ln(k)/Ln(2))+1 do
      begin
         If k Shr i and 1=1 then P:=P*X;
         X:=X*X;
      end;
   n:=n Div 6;
   For i:=1 to 3 do
      begin
         Res:=(Res+P[m,2]+P[m,n*3]+P[m,n*5+1]) Mod Base;
         m:=m+n+n;
      end;
End;


Procedure PrintResult;
Begin
   Assign(OutPut,OutputFile);
   Rewrite(OutPut);
   Try
      begin
         Write(Res);
      end;
   Finally
   end;
   Close(OutPut);
End;


BEGIN
   EnterData;
   Process;
   PrintResult;
END.
