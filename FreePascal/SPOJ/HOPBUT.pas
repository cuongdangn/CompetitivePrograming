{}
const   fi      =       'HOPBUT.inp';
        fo      =       'HOPBUT.out';
        maxai   =       255;
var     f,g:text;
        d:array[-1..maxai,-1..maxai,-1..maxai] of longint;
        a:array[0..maxai,0..maxai,0..maxai] of byte;
        n,k,res,lim:longint;
procedure       mo;
begin
        assign(f,fi);
        reset(f);
        assign(g,fo);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     x,y,z,i:Longint;

begin
        read(f,n,lim);
        readln(f);
        for i:=1 to n do
            begin
                read(f,x,y,z);
                readln(f);
                a[x,y,z]:=1;
            end;
end;
procedure       init;
var     i,j,k:longint;
begin
        for i:=0 to maxai do
        for j:=0 to maxai do
        for k:=0 to maxai do
            d[i,j,k]:=d[i-1,j,k]+d[i,j-1,k]-d[i-1,j-1,k]+d[i,j,k-1]-d[i,j-1,k-1]-d[i-1,j,k-1]+d[i-1,j-1,k-1]+a[i,j,k];
end;
function        check(l:longint):boolean;
var     i,j,k,s:longint;
begin
        for i:=l to maxai do
        for j:=l to maxai do
        for k:=l to maxai do
            begin
                s:=d[i,j,k-l-1]+d[i-l-1,j,k]-d[i-l-1,j,k-l-1]+d[i,j-l-1,k]-d[i,j-l-1,k-l-1]-d[i-l-1,j-l-1,k]+d[i-l-1,j-l-1,k-l-1];
                if d[i,j,k]-s>=lim then exit(true);
            end;
        exit(false);
end;
procedure       xuly;
var     dau,cuoi,mid:Longint;
begin
        init;
        dau:=1;
        cuoi:=maxai;
        while dau<=cuoi do
            begin
                mid:=(dau+cuoi)>>1;
                if check(mid) then
                    begin
                        res:=mid;
                        cuoi:=mid-1;
                    end
                    else
                        dau:=mid+1;
            end;
        write(g,res);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.