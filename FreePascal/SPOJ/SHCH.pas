Const e=10000000;
Type bignum=array [0..90] of longint;
Var Q:array [0..100,0..100] of bignum;
    C:array [0..100] of longint;
    kt:array [0..110] of boolean;
    s:bignum;
    i,j,n,k,luun,luuk,d:longint;

Function taobignum(a:ansistring):bignum;
Var l:bignum;
    m,oo,i1:longint;
    ss:string;
Begin
  While (length(a) mod 7) >0 do a:='0'+a;
  j:=length(a) div 7;
  m:=length(a);
  For i1:=1 to j do
    begin
      ss:=a[m-6]+a[m-5]+a[m-4]+a[m-3]+a[m-2]+a[m-1]+a[m];
      Val(ss,oo);
      l[i1]:=oo;
      m:=m-7;
    end;
  l[0]:=j;
  taobignum:=l;
End;

Function nhan(a:bignum;b:longint):bignum;
Var l:bignum;
    du,i1:longint;
Begin
  Fillchar(l,sizeof(l),0);
  l[0]:=a[0];
  du:=0;
  For i1:=1 to a[0] do
    begin
      l[i1]:=a[i1]*b+du;
      du:=l[i1] div e;
      l[i1]:=l[i1] mod e;
    end;
  IF du>0 then
    begin
      inc(l[0]);
      l[l[0]]:=du;
    end;
  nhan:=l;
End;

Function tru(a,b:bignum):bignum;
Var du,i1:longint;
    l:bignum;
Begin
  du:=0;
  For i1:=1 to b[0] do
    begin
      l[i1]:=a[i1]-b[i1]-du;
      du:=0;
      IF l[i1]<0 then
        begin
          du:=1;
          l[i1]:=l[i1]+e;
        end;
    end;
  For i1:=b[0]+1 to a[0] do
    begin
      l[i1]:=a[i1]-du;
      du:=0;
      IF l[i1]<0 then
        begin
          du:=1;
          l[i1]:=l[i1]+e;
        end;
    end;
  i1:=a[0];
  While l[i1]=0 do dec(i1);
  l[0]:=i1;
  tru:=l;
End;

Function cong(a,b:bignum):bignum;
Var du,i1,oo:longint;
    l:bignum;
Begin
  du:=0;
  IF a[0]>b[0] then oo:=a[0]
  Else oo:=b[0];
  For i1:=1 to oo do
    begin
      l[i1]:=a[i1]+b[i1]+du;
      du:=l[i1] div e;
      l[i1]:=l[i1] mod e;
    end;
  l[0]:=oo;
  IF du>0 then
    begin
      l[oo+1]:=du;
      inc(l[0]);
    end;
  cong:=l;
End;


Function sosanh(a,b:bignum):boolean;
Var i1:longint;
Begin
  IF a[0]>b[0] then exit(true);
  IF a[0]<b[0] then exit(false);
  For i1:=a[0] downto 1 do
    begin
      IF a[i1]>b[i1] then exit(true);
      IF a[i1]<b[i1] then exit(false);
    end;
  exit(false);
End;

Procedure doc;
Begin
  Assign(input,'SHCH.inp');Reset(input);
  Assign(output,'SHCH.out');Rewrite(output);
  Readln(n,k);
  For i:=1 to n do
    begin
      Q[i,0][0]:=1;
      Q[i,0][1]:=1;
      For j:=1 to i do Q[i,j]:=nhan(Q[i,j-1],i-j+1);
    end;
  luun:=n;
  luuk:=k;
End;

Procedure xuly1;
Label 1;
Var st:ansistring;
Begin
  Readln(st);
  s:=taobignum(st);
  Fillchar(kt,sizeof(kt),true);
  d:=0;
  While k>0 do
    begin
      dec(k);
      dec(n);
      For i:=1 to luun do
        IF kt[i]=true then
          begin
            IF sosanh(s,Q[n,k]) then s:=tru(s,Q[n,k])
            Else goto 1;
          end;
      1:
      inc(d);
      C[d]:=i;
      kt[i]:=false;
    end;
  For i:=1 to d-1 do Write(C[i],' ');Write(C[d]);
  Writeln;
End;

Procedure inkq(a:bignum);
Var kq:ansistring;
    ss:string;
    i1:longint;
Begin
  kq:='';
  For i1:=1 to a[0] do
    begin
      Str(a[i1],ss);
      While length(ss)<7 do ss:='0'+ss;
      kq:=ss+kq;
    end;
  While kq[1]='0' do delete(kq,1,1);
  Writeln(kq);
End;

Procedure xuly2;
Var m:longint;
    p:bignum;
Begin
  k:=luuk;n:=luun;
  For i:=1 to k do Read(C[i]);
  d:=0;
  Fillchar(s,sizeof(s),0);
  s[0]:=1;s[1]:=1;
  Fillchar(kt,sizeof(kt),true);

  While k>0 do
    begin
      dec(k);
      dec(n);
      inc(d);
      m:=0;
      kt[c[d]]:=false;
      For i:=1 to c[d]-1 do
        IF kt[i] then inc(m);
      p:=nhan(Q[n,k],m);
      s:=cong(s,p);
    end;
  inkq(s);
//  inkq(Q[luun,luuk]);
End;


BEGIN
doc;
xuly1;
xuly2;
END.
