const   finp    =       'BLOCK.INP';
        fout    =       'BLOCK.OUT';
type    mt      =       array[1..2,1..2] of int64;
var     n,k     :       int64;
        a,b     :       mt;
        f,g     :       text;
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
function        nhan(a,b:mt):mt;
var     c:mt;
        i,j,k1:byte;
begin
        for i:=1 to 2 do
         for j:=1 to 2 do
                begin
                     c[i,j]:=0;
                     for k1:=1 to 2 do c[i,j]:=(c[i,j]+a[i,k1]*b[k1,j])mod k;
                end;
         exit(c);
end;
function        lt(a:mt;b:longint):mt;
var     tg:mt;
begin
        if b=1 then exit(a);
        tg:=lt(a,b div 2);
        tg:=nhan(tg,tg);
        if b mod 2=1 then tg:=nhan(tg,a);
        exit(tg);
end;
procedure       kt;
begin
        a[1,1]:=1;
        a[1,2]:=0;
        b[1,1]:=2;
        b[1,2]:=1;
        b[2,1]:=1;
        b[2,2]:=1;
end;
procedure       xuly;
var     c       :       mt;
begin
        readln(f,n,k);
        if n=2 then write(g,1)
        else
                begin
                        kt;
                        c:=lt(b,n-2);
                        a:=nhan(a,c);
                        write(g,a[1,1]);
                end;
end;
begin
        mo;
        xuly;
        dong;
end.
