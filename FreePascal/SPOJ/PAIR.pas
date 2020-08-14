const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        s,b,c   :       array[1..500000] of longint;
        kq      :       int64;
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
procedure       DOC;
VAR    i,j      :       longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     cu      :       longint;
begin

