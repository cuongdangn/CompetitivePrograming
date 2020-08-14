const   finp    =       '';
        fout    =       '';
type    mang    =       array[0..2189564] of longint;
var     g,f     :       text;
        a,b,min    :       mang;
        k,n :       longint;
        max1 :       longint;
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
var     i,j       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                read(f,a[i]);

        for i:=1 to n do
                begin
                        b[i]:=b[i-1]+a[i];
                end;
        for i:=n+1 to n*2 do b[i]:=b[i-1]+a[i-n];
end;
procedure       xuly;
var     i,max:longint;
begin
        min[1]:=b[1];     max:=-maxlongint;
        for i:=2 to 2*n do if b[i]<min[i-1] then min[i]:=b[i] else min[i]:=min[i-1];
        for i:=1 to 2*n do if max
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
