const
    inp='';
    out='';
    maxn=1000;
    max=300;
    coso=1000000000;
type
    bignumb=array[1..max] of int64;
var
    fi,fo:text;
    f:array[0..maxn] of bignumb;
    n:longint;
    mang1:bignumb;

procedure openfile;
begin
    assign(fi,inp);reset(fi);
    assign(fo,out);rewrite(fo);
end;

procedure enter;
begin
    readln(fi,n);
    n:=n-2;
end;

function mul(x:bignumb;k:longint):bignumb;
var
    i,nho:longint;
    c:bignumb;
begin
    nho:=0;
    for i:=max downto 1 do
        begin
            c[i]:=x[i]*k+nho;
            if c[i]>=coso then
                begin
                    nho:=c[i] div coso;
                    c[i]:=c[i] mod coso;
                end
            else nho:=0;
        end;
    mul:=c;
end;

function plus(a,b:bignumb):bignumb;
var
    i,nho:longint;
    c:bignumb;
begin
    nho:=0;
    for i:=max downto 1 do
        begin
            c[i]:=a[i]+b[i]+nho;
            if c[i]>=coso then
                begin
                    nho:=c[i] div coso;
                    c[i]:=c[i] mod coso;
                end
            else nho:=0;
        end;
    plus:=c;
end;

procedure solve;
var
    i:longint;
    s:string;
    ok:Boolean;
begin
    f[0][max]:=1;
    mang1[max]:=1;
    for i:=1 to n do
        f[i]:=plus(mul(f[i-1],i),mang1);
    ok:=false;
    for i:=1 to max do
        begin
            if (not ok) and (f[n][i]<>0) then
                begin
                    ok:=true;
                    s:='';
                    while f[n][i]>0 do
                        begin
                            s:=chr(f[n][i] mod 10+48)+s;
                            f[n][i]:=f[n][i] div 10;
                        end;
                    write(fo,s);
                end
            else if ok then
                    begin
                        s:='';
                        while f[n][i]>0 do
                            begin
                                s:=chr(f[n][i] mod 10+48)+s;
                                f[n][i]:=f[n][i] div 10;
                            end;
                        while length(s)<9 do s:='0'+s;
                        write(fo,s);
                    end;
        end;
end;

procedure closefile;
begin
    close(fi);
    close(fo);
end;

begin
    openfile;
    enter;
    solve;
    closefile;
end.
