Const   fi='';
        fo='';
Var     F,A:array[0..500,0..500] of longint;
        n,m,k: longinT;
Procedure       Openf;
        Begin
           assign(input,fi); reset(input);
           assign(output,fo); rewrite(output);
        End;
Procedure       init;
        Var     i,j:longint;
        Begin
           readln(m,n,k);
           For i:=1 to m do
            Begin
               F[0,i]:=0;
               For j:=1 to n do
                  Begin
                   read(A[i,j]);
                   F[i,j]:=F[i,j-1]+A[i,j];
                  End;
              readln
              End;
        End;
Procedure       QHD;
        Var     L,R,i,j,x0,y0,x1,y1,res,S,dt:longint;
        Begin
           res:= maxlongint;
           For L:=1 to n do
            For R:=L to n do
            Begin
              i:=1;j:=1;
              S:= F[1,R]-F[1,L-1];
              While (i<=j)and(j<=m) do
                Begin
                 If S<k then
                  Begin
                    inc(j);
                    S:= S+F[j,R]-F[j,L-1];
                  End
                 Else Begin
                       dt:=(j-i+1)*(R-L+1);
                       If dt<= res then
                        Begin
                          res:=dt;
                          x0:=L; y0:=i;
                          x1:=R; y1:=j;
                          S:=S-(F[i,R]-F[i,L-1]);
                          inc(i);
                         End else Begin
                                  S:=S-(F[i,R]-F[i,L-1]);
                                  inc(i);
                                  End;
                      End;
                   End;
                 End;
            If res= maxlongint then Write(-1)
            Else Begin
                  Writeln(res);
                  Write(x0,#32,y0,#32,x1,#32,y1)
                 End
        End;
Procedure       Closef;
        Begin
           close(input);
           close(output);
        End;
BEGIN
   Openf;
   init;
   QHD;
   Closef;
END.
