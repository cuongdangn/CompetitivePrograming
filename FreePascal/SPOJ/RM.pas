CONST
        tfi='';
        tfo='';
        k=31;
VAR
        n:int64;
        LT:array[0..33]of int64;
        fi,fo:text;

Procedure Init;
  Var tg:int64;
      i:longint;
  Begin
    tg:=1; LT[0]:=1;
    for i:=1 to 33 do
      begin
        tg:=tg*2;
        LT[i]:=tg;
      end;
  End;

Function Power(a,q,n:int64):int64;
  Var c,p2,u:int64;
  Begin
    c:=1; u:=a; p2:=1;
    repeat
      if q and p2<>0 then c:=(c*u) mod n;
      p2:=p2 shl 1;
      u:=(u*u) mod n;
    until p2>q;
    Power:=c;
  End;

Function MillerTest(n,a,q,t:int64):Boolean;
  Var pre,c:int64;
      i:longint;
  Begin
    c:=Power(a,q,n);
    pre:=n-1;
    for i:=0 to t do
    begin
      if c=1 then exit(pre=n-1);
      pre:=c;
      c:=(c*c) mod n;
    end;
    MillerTest:=False;
  End;

Procedure Cal(n:int64; var q,t:int64);
  Var i:longint;
  Begin
    for i:=0 to 33 do
      if ((n-1) mod LT[i]=0) and (((n-1) div LT[i]) mod 2<>0) then
        begin
          q:=(n-1) div LT[i];
          t:=i;
          exit;
        end;
  End;

Function Prime(n:int64):Boolean;
  Var i:longint;
      a,q,t:int64;
  Begin
    Prime:=False;
    if n=2 then exit(true);
    if n mod 2=0 then exit(false);
    Cal(n,q,t);
    For i:=1 to k do
    Begin
      a:=random(n-1)+1;
      if MillerTest(n,a,q,t)=false then exit;
    End;
    Prime:=True;
  End;

Procedure OpenFile;
  Begin
    assign(fi,tfi); reset(fi);
    assign(fo,tfo); rewrite(fo);
  End;

Procedure Process;
  Var i,j,test:longint;
  Begin
    read(fi,test);
    for i:=1 to test do
      begin
        read(fi,n);
        for j:=n-1 downto 2 do
        if prime(j) then
                begin
                        writeln(fo,j);
                        break;
                end;
      end;
  End;

Procedure CloseFile;
  Begin
    close(fi); close(fo);
  End;

Procedure RM;
  Begin
    OpenFile;
    Init;
    Process;
    CloseFile;
  End;

BEGIN
        RM;
END.
