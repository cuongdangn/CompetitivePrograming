const   finp            =               'ARRAY.INP';
        fout            =               'ARRAY.OUT';
        maxn            =               2*trunc(1e5);
type    arr             =               array[0..maxn] of longint;
var     fi,fo           :               text;
        a,  f           :               arr;
        k,m,modulo           :               longint;
procedure mo;
begin
        assign(fi,finp);reset(fi);
        assign(fo,fout);rewrite(fo);
end;
procedure dong;
begin
        close(fi);close(fo);
end;
procedure doc;
var
        i               :               longint;
begin
        readln(fi,m);
        k:=m;
        m:=m*2;
        modulo:=trunc(1e9)+7;
end;

function tang(a,x:longint):longint;
begin
        tang:=0;
        while a mod x=0 do
        begin
                inc(tang);
                a:=a div x;
        end;
end;
function pow(a,t:longint):longint;
var
        tmp             :               longint;
begin
        if t=1 then
                exit(a mod modulo);
        tmp:=pow(a,t div 2);
        tmp:=(int64(tmp)*tmp) mod modulo;
        if odd(t) then
                tmp:=(int64(tmp)*a) mod modulo;
        exit(tmp);
end;
procedure xuly;
var
        i,j,t,res       :               longint;
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
                                t:=tang(j,i);
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
        mo;
        doc;
        xuly;
        dong;
end.
