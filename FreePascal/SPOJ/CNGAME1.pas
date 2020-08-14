uses    math;
const   finp    =       'CNGAME.INP';
        fout    =       'CNGAME.OUT';
type    mt      =       array[1..21,1..21] of int64;
var     g,f     :       text;
        base,k  :       int64;
        n,dem       :       longint;
        a,kq,luu2       :       mt;
        b       :       array[1..20] of int64;
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
function        check(t:int64):boolean;
var     i       :       longint;
begin
        for i:=2 to trunc(sqrt(t))+1 do
                if t mod i=0 then exit(false);
        exit(true);
end;
procedure       ktao;
var     i,j       :       longint;
begin
        fillchar(a,sizeof(a),0);
        for i:=1 to n do
         for j:=1 to n do
         if i<>j then
          begin
          if check(b[i]*6+b[j]) then a[i,j]:=1
         else a[i,j]:=0
         end;
         a[n,n+1]:=1;
         a[n+1,n+1]:=1;
end;

function        cong(a,b        :       mt):mt;
var     i,j     :       longint;
        c       :mt;
begin
        for i:=1 to n do
         for j:=1 to n do
                c[i,j]:=(a[i,j]+b[i,j])mod base;
        exit(c);
end;

function        nhanad(a,b:int64):int64;
var     tg      :       int64;
begin
        tg:=0;
        if (a=0)or(b=0) then exit(0);
        while a>1 do
         begin
              if a mod 2=1 then tg:=(tg+b)mod base;
              a:=a div 2;
              b:=(b*2) mod base;
         end;
         exit((tg+b)mod base);
end;
function        nhan(a,b :mt):mt;
var     c:mt;
        i,j,k   :longint;
begin
        for i:=1 to n do
         for j:=1 to n do
          begin
                c[i,j]:=0;
              for k:=1 to n do
               c[i,j]:=(c[i,j]+nhanad(a[i,k],b[k,j]))mod base;
          end;
          exit(c);
end;
function        lt(a:mt;b:int64):mt;
var     tg      :       mt;
begin
        if b=1 then exit(a);
        tg:=lt(a,b div 2);
        tg:=nhan(tg,tg);
        if (b mod 2=1) then tg:=nhan(tg,a);
        exit(tg);
end;
{function        tinh(r:int64):mt;
var b,c,tg:mt;
begin
        if r=1  then exit(a);
        inc(dem);
        c:=tinh(r div 2);
        b:=luu[dem+1];
        b:=nhan(b,c);
        tg:=cong(c,b);
        if r mod 2=1 then
        begin
        tg:=cong(tg,luu[dem])
        end;
        dec(dem);
        exit(tg);
end;
function        chuanbi(a:mt;b:int64):mt;
var     tg      :       mt;
begin

        if b=1 then
        begin
        luu[dem+1]:=a;
        exit(a);
        end;
        inc(dem);
        tg:=chuanbi(a,b div 2);
        tg:=nhan(tg,tg);
        if (b mod 2=1) then tg:=nhan(tg,a);
        luu[dem]:=tg;
        dec(dem);
        exit(tg);
end;   }
procedure       xuly;
var     i       :       longint;
begin

        dem:=0;
         n:=n+1;
        kq:=lt(a,k+1);

        writeln(g,kq[1,n] mod base);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n,k,base);
        for i:=1 to n do read(f,b[i]);
        readln(f);
        ktao;
        xuly;
end;
procedure       xuly1;
var     i,t       :       longint;
begin
        readln(f,t);
        for i:=1 to t do doc;
end;
begin
        mo;
        xuly1;
        dong;
end.

