var     n,m ,dem    :       longint;
        a,pos       :       array[1..11,1..1003] of longint;
        f       :   array[1..1003] of longint;
function        acc(i,j:longint):boolean;
var     k:longint;
begin
        for k:=1 to m do
        if pos[k,i]>pos[k,j] then exit(false);

        exit(true)
end;
procedure       doc;
var     i,j:longint;
begin
        readln(n,m); dem:=1;
        for i:=1 to m do
                begin
                for j:=1 to n do
                                begin
                                read(a[i,j]);
                                pos[i,a[i,j]]:=j;
                                end;
                readln;
                end;
                for i:=1 to n do f[i]:=1;

                for i:=1 to n do

                 for j:=1 to i-1 do
                 if (acc(a[1,j],a[1,i])) and( f[i]<f[j]+1) then f[i]:=f[j]+1;
                 for i:=1 to n do if dem<f[i] then dem:=f[i];
                 writeln(dem);
end;
begin
        doc;
end.
