uses    math;
const   finp    =       'GAME1.INP';
        fout    =       'GAME1.OUT';
var     g,f     :       text;
        a,b       :       array[0..101] of longint;
        d       :       array[1..101,1..101] of longint;
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
        read(f,a[i]);
        b[i]:=b[i-1]+a[i];
        end;
end;
procedure       QHD;
var     i,j     :       longint;
begin
        for i:=1 to n do D[i,i]:=a[i];
        for i:=1 to n-1 do
                        for j:=1 to n do d[j,i+j]:= b[i+j]-b[j-1]-min(d[j+1,i+j],d[j,i+j-1]);
        write(g,d[1,n],' ',b[n]-b[0]-d[1,n]);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.
