Uses math;
Const  fi   =   'peaks.inp';
       fo   =   'peaks.out';
       maxn =   1000000;
       modm =   239;

VAR f:array[0..1,-1..30]of longint;
    q:array[1..maxn]of longint;
    p,u,v,nt:longint;
    ck:longint;
    n:int64;

Procedure enter;
  Var i:longint;
  Begin
    read(n,p);
  End;

Procedure solve;
  Var i,j:longint;
  Begin
    f[1,1]:=1;
    f[1,0]:=0;
    v:=1;
    u:=0;

    nt:=200000;
    q[1]:=f[1,p];
    for i:=2 to nt do
      begin
        u:=1 xor u;
        v:=1 xor v;
        for j:=1 to p do
          f[v,j]:=(f[u,j]*2*j + f[u,j-1]*( (i-2*(j-1))mod modm ) )mod modm;
        q[i]:=f[v,p];
      end;
  End;

Function check(u,v:longint):boolean;
  Var i:longint;
  Begin
    for i:=0 to 100 do
      if q[u+i]<>q[v+i] then exit(false);
    check:=true;
  End;

Procedure print;
  Var i,j,k:longint;
  Begin
if n<=nt then write(q[n])
    else
      begin
        i:=50000;
        for j:=i+1 to nt-100 do
          if check(i,j) then
            begin
              ck:=j-i;
              break;
            end;

        k:=(n-i)mod ck;
        if k=0 then k:=ck;
        k:=k+i;

        write(q[k]);
      end;
  End;

BEGIN
  assign(input,fi);assign(output,fo);
  reset(input);rewrite(output);
  enter;
  solve;
  print;
  close(input);close(output);
END.
