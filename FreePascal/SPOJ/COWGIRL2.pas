const   finp    =       'DNC.INP';
        fout    =       'DNC.out';
        du      =       187033892;
type        mt      =       array[0..80,0..80] of int64;
        bit =   array[1..4] of byte;
var     g,f     :       text;
        m,n     :       longint;
        tt      :       array[1..4] of longint;
        a,b    :       mt;

procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
begin
        readln(f,m,n);
end;
function       nhan(a,b:mt):mt;
var     c:mt;
        i,j,k   :       integer;
begin
        for i:=0 to tt[m]-1 do
         for j:=0 to tt[m]-1 do
                begin
                        c[i,j]:=0;
                        for k:=0 to tt[m]-1 do c[i,j]:=(c[i,j]+a[i,k]*b[k,j])mod du;
                end;
        exit(c);
end;
function        lt(a:mt;b:int64):mt;
var     tg      :       mt;
begin
        if b=1 then exit(a);
        tg:=lt(a,b div 2);
        tg:=nhan(tg,tg);
        if b mod 2=1 then tg:=nhan(tg,a);
        exit(tg);
end;

procedure       cd(var s:bit;a:longint);
var     i,j,i1:longint;
begin

        j:=a;
        i1:=m;
        while i1>0 do
                begin
                        i:=j mod 3;
                        s[i1]:=i;
                        j:=j div 3;
                        dec(i1);
                end;
end;
function        check1(a:longint):boolean;
var     s:bit;
        i:longint;
begin
        cd(s,a);
        for i:=2 to m do
         if ((s[i]=1)and(s[i-1]=0)) or ((s[i-1]=1)and(s[i]=0)) then exit(false);
        exit(true);
end;
function        check(i,j:longint):boolean;
var     s,s1    :       bit;
        i1       :       longint;
begin
        cd(s,i);
        cd(s1,j);
        for i1:=1 to m do
         if ((s[i1]=1)and(s1[i1]=0))or((s[i1]=0)and(s1[i1]=1)) then exit(false);
         exit(true);
end;
procedure   ktao;
var     i,j:longint;
begin
        tt[1]:=3;
        tt[2]:=9;
        tt[3]:=27;
        tt[4]:=81;
        for i:=0 to tt[m]-1 do
        for j:=0 to tt[m]-1 do
        if check1(i) and check1(j) then
        begin
                b[1,i]:=1;
                b[1,j]:=1;
                if check(i,j) then a[i,j]:=1
                else a[i,j]:=0;
        end;
end;
procedure       xuly;
var        kq:int64;
        i:longint;
begin
        kq:=0;
        doc;
        ktao;
        if n=1 then
                begin
                    for i:=0 to tt[m]-1 do kq:=(kq+b[1,i])mod du;
                    writeln(g,kq);
                end
        else
                begin
                      a:=lt(a,n-1);
                      b:=nhan(b,a);
                      for i:=0 to tt[m]-1 do kq:=(kq+b[1,i])mod du;
                      writeln(g,kq mod du);
                end;

end;
begin
        mo;
        xuly;
        dong;
end.

