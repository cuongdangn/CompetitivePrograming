const   finp    =       'MATRIX.inp';
        fout    =       'MATRIX.out';
type    mt      =       array[1..20,1..20] of longint;
var     g,f     :       text;
        n,k       :       longint;
        a       :       mt;
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
var     i,j:longint;
begin
        readln(f,n,k);
        for i:=1 to n do
                begin
                        for j:=1 to n do read(f,a[i,j]);
                        readln(f);
                end;
end;
function        cong(a,b:mt):mt;
var     c:mt;
        i,j:longint;
begin
        for i:=1 to n do
        for j:=1 to n do c[i,j]:=((a[i,j] mod 10)+(b[i,j] mod 10))mod 10;
        exit(c);
end;

function        nhan(a,b:mt):mt;
var     c:mt;
        i,j,k:byte;
        kq:int64;
begin
        for i:=1 to n do
            for j:=1 to n do
                begin
                         kq:=0;
                         for k:=1 to n do
                         kq:=(kq+(a[i,k] mod 10)*(b[k,j] mod 10))mod 10;
                         c[i,j]:=kq;
                end;
        exit(c);
end;
function        pow(a:mt;b:longint):mt;
var     tg:mt;
begin
        if b=1 then exit(a);
        tg:=pow(a,b div 2);
        tg:=nhan(tg,tg);
        if b mod 2=1 then tg:=nhan(tg,a);
        exit(tg);
end;
function    tinh(a:mt;l:longint):mt;
var
        c,tg:mt;
begin
        if l=1 then exit(a);
        c:=tinh(a,l div 2);
        tg:=pow(a,l div 2);
        c:=cong(c,nhan(tg,c));
        if l mod 2=1 then
        c:=cong(c,pow(a,l));
        exit(c);

end;
procedure       xuly;
var     i,j:byte;
        c:mt;
begin
        c:=tinh(a,k);
        for i:=1 to n do
        begin
        for j:=1 to n do
        write(g,c[i,j] mod 10,' ');
        writeln(g);
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
