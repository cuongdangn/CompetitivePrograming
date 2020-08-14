const   finp    =       'DNC.inp';
        fout    =       'DNC.out';
var     g,f:text;
procedure       mo      ;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     n,t,s:longint;
        d:int64;
begin
        readln(f,N);
read(f,T); D:=T;
while N>1 do
Begin
read(f,S);
if S>T then D:=D-T+S;
T:=S;
dec(N)
End;
writeln(g,D);
END;
begin
        mo;
        doc;
        dong;
end.
