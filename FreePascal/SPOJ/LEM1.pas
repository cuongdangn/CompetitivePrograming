uses    math;
const   finp    =       '';
        fout    =       '';

var     g,f     :       text;
        r       :       array[1..10003] of real;
        r1,r2      :       double;
        n       :       longint;
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
var     i:longint;
begin
        readln(f,n);
        for i:=1 to n do
        begin
        read(f,r[i]);
        r2:=r2+r[i];
        end;
        r[n+1]:=r[1];
end;
function        tinh(a:real):real;
var     i:longint;q:real;
begin
        q:=0;
        for i:=1 to n do
        q:=q+arccos(1-(2*r[i]*r[i+1])/((a+r[i])*(a+r[i+1])));
        tinh:=q;
end;
function        Find(x:real):real;
var
        inf,sup,median,t:real;
begin
        inf:=0;
        sup:=r2;
        while inf<=sup do
        begin
                median:=(inf+sup)/2;
                t       :=tinh(median);
                if abs(t-x)< 1.0E-10 then
                begin
                        find:=median;
                        exit;
                end;
        if t>x then inf:= median
        else sup:= median;
end;
        find:=0;
end;
procedure       xuly;
begin
        writeln(g,find(2*pi):0:3);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
