const   finp    =       'fib.inp';
        fout    =       'fib.out';
var     g,f     :       text;
        t,m,k   :     longint;
        a,b     :       qword;
        fi      :       array[0..10000001] of integer;
        d       :       array[0..1001,0..1001] of byte;
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
function        pow(a,b:qword):longint;
var     tg:longint;
begin
        if b=1 then exit(a mod k);
        tg:=pow(a,b div 2)mod k;
        tg:=(tg*tg)mod k;
        if b mod 2 =1 then tg:=(tg*a) mod k;
        exit(tg);
end;
procedure       sub1;
var     i       : longint;
        kq      : longint;
        x       : int64;
begin
        fi[0]:=0;
        fillchar(d,sizeof(d),0);
        k:=0;
        fi[1]:=1;
        d[1,0]:=1;
        for i:=2 to 10000001 do
                begin
                        fi[i]:=(fi[i-1]+fi[i-2]) mod m;
                        if d[fi[i],fi[i-1]]=1 then break;
                        d[fi[i],fi[i-1]]:=1;
                end;
       k:=i-1;
       write(g,fi[pow(a mod k,b)mod k] mod m,' ');
end;
function        UC(a,b:qword):qword;
begin
        if b=0 then exit(a);
        exit(UC(b,a mod b));
end;
procedure       sub2;
var     i:longint;
        t:qword;
begin
        t:=UC(a,b);
       write(g,fi[t mod k] mod m);
       writeln(g);
end;

procedure       doc;
var     i:longint;
begin
        readln(f,t);
        for i:=1 to  t do
                begin
                        readln(f,a,b,m);
                        sub1;
                        sub2;
                end;
end;
begin
        mo;
        doc;
        dong;
end.
