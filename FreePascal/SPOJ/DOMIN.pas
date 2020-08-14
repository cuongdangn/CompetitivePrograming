const   finp    =       'DNC.INP';
        fout    =       'DMC.OUT';
var     g,f     :text;
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
var     i,j:longint;
begin
        readln(f,n,m);
        for i:=1 to n do
        begin
         for j:=1 to m do read(f,a[i,j]);
         readln(f);
        end;
end;
procedure       DQ(i,j:longint);
var
