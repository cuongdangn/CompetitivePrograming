const   finp    =       '';
        fout    =       '';
type    mt      =       array[1..2,1..2] of int64;
var     g,f     :       text;
        a,b     :       mt;
        m,k       :       int64;
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
function        nhan1(a,b:int64):int64;
var     dem:int64;
begin
        nhan1:=0;
        while a>=1 do
                begin
                        if a mod 2 =1 then nhan1:=nhan1+b;
                        b:=((b mod m)+(b mod m)) mod m;
                        a:=a div 2;
                end;
end;

function        nhan(a,b:mt):mt;
var     c:mt;
        x:qword;
        i,j,k:byte;
begin
        for i:=1 to 2 do
                for j:=1 to 2 do
                        begin
                                x:=0;
                                for k:=1 to 2 do x:=(x+nhan1(a[i,k],b[k,j]))mod m;
                                c[i,j]:=x mod m;
                        end;
       exit(c);
end;
function       mu(a:mt;b:int64):mt;
var     tg      :       mt;
begin
        if b=1 then exit(a);
        tg:=mu(a,b div 2);
        tg:=nhan(tg,tg);
        if odd(b) then tg:=nhan(tg,a);
        exit(tg);
end;
procedure       kt(x,y:int64);
begin
        a[1,1]:=y mod m;
        a[1,2]:=y mod m;
        b[1,1]:=x;
        b[2,1]:=1;
        b[2,2]:=1;
end;
procedure       xuly(x,y:int64);
var     c       :       mt;
begin
        if k=1 then writeln(g,y mod m)else
        begin
        kt(x,y);
        c:=mu(b,k-1);
        c:=nhan(a,c);
        writeln(g,c[1,1]mod m);
        end;
end;
procedure       doc;
var     i,t       :       byte;
        x,y  :       int64;
begin
        readln(f,t);
        for i:=1 to t do
                begin
                        readln(f,x,y,m,k);
                        xuly(x,y);
                end;
end;
begin
        mo;
        doc;
        dong;
end.


