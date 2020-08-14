const   finp    =       'PILOT.INP';
        fout    =       'PILOT.OUT';
var     g,f     :       text;
        n,m     :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,m,n);
        if (n mod 2=m mod 2) then writeln(g,'Duong Dat')
        else writeln(g,'Nhat Uyen');
end;
begin
        mo;
        doc;
        dong;
end.