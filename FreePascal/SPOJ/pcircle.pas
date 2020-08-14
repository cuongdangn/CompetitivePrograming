const           fi='DNC.INP';
                fo='DNC.OUT';
var
                f,g:text;
                a,b:array[1..40]of boolean;
                c:array[1..1000,1..20] of integer;
                d:array[1..20]of integer;
                n,dem:longint;
procedure       mo;
begin
                assign(f,fi);
                assign(g,fo);
                reset(f);
                rewrite(g);
end;
function        nt(x:longint):boolean;
var
                i:longint;
begin
                for i:=2 to trunc(sqrt(x)) do
                        if x mod i =0 then
                                exit(false);
                exit(true);
end;
procedure       tao;
var
                i:longint;
begin
                a[1]:=false;
                for i:=2 to 40 do
                        if nt(i) then a[i]:=true else a[i]:=false;
                for i:=1 to 2*n do b[i]:=true;
                b[1]:=false;
                d[1]:=1;
                dem:=0;
end;
procedure       doc;
begin
                readln(f,n);
end;
procedure    xuat;
var
                i,j:longint;
begin
                writeln(g,dem);
                if dem>1000 then dem:=1000;
                for i:=1 to dem do
                        begin
                                for j:=1 to 2*n do   write(g,c[i,j],' ');
                                writeln(g);
                        end;
end;
procedure               dong;
begin
                close(f);
                close(g);
end;
procedure       dq(vt:longint);
var             i:longint;
begin
                    if vt=(2*n+1) then
                        begin
                                if a[d[2*n]+1] then
                                        begin
                                                dem:=dem+1;
                                                if dem <=1000 then
                                                        for i:=1 to 2*n do
                                                                c[dem,i]:=d[i];

                                        end;
                        end
                else
                        begin
                                for i:=2 to n*2 do

                                        if (b[i]) and (a[d[vt-1]+i]) then
                                                begin
                                                        b[i]:=false;
                                                        d[vt]:=i;
                                                        dq(vt+1);
                                                        b[i]:=true;
                                                        d[vt]:=0;
                                                end;
                        end;
end;

begin
        mo;
        doc;
        tao;
        dq(2);
        xuat;
        dong;
end.
