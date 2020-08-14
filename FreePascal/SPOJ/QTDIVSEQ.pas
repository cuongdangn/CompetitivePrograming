{$Mode objfpc}
uses math;
const
                finp            =               'CKN.INP';
                fout            =               'CKN.OUT';
                maxn            =               trunc(1e6);
type
                arr             =               array[0..maxn] of integer;
var
                fi,fo           :               text;
                a,  f           :               arr;
                s               :               array[0..maxn] of int64;
                n,k,m,modulo           :               integer;
procedure openfile;
begin
        assign(fi,finp);reset(fi);
        assign(fo,fout);rewrite(fo);
end;
procedure closefile;
begin
        close(fi);close(fo);
end;
procedure enter;
var
        i               :               integer;
begin
        readln(fi,k,m,modulo);
end;

function find(a,x:integer):integer;//Tim a = x^k*c (k???)
begin
        result:=0;
        while a mod x=0 do
        begin
                inc(result);
                a:=a div x;
        end;
end;
function pow(a,t:integer):integer;
var
        tmp             :               integer;
begin
        if t=1 then
                exit(a mod modulo);
        tmp:=pow(a,t div 2);
        tmp:=(int64(tmp)*tmp) mod modulo;
        if odd(t) then
                tmp:=(int64(tmp)*a) mod modulo;
        exit(tmp);
end;
procedure solve2;
var
        i,j,t,res       :               integer;
        dd              :               array[2..maxn] of boolean;
        count           :               arr;
begin

        for i:=2 to m do
        begin
                dd[i]:=false;
                count[i]:=0;
        end;
        for i:=2 to m do
        if not dd[i] then
        begin
                j:=i;
                repeat
                        if (j>=m-k+1) or (j<=k) then
                                t:=find(j,i);
                        if j>=m-k+1 then
                                inc(count[i],t);
                        if j<=k then
                                dec(count[i],t);
                        if j>i then
                                dd[j]:=true;
                        j:=j+i;
                until j>m;
        end;
        res:=1;
        for i:=2 to m do
        if (not dd[i]) and (count[i]>0) then
                res:=(int64(res)*pow(i,count[i])) mod modulo;
        writeln(fo,res);
end;
begin
        openfile;
        enter;
        solve2;
        closefile;
end.
