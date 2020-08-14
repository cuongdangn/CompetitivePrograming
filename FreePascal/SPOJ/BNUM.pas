const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        d       :       array[1..20,1..70,true..false,true..false] of int64;
        a,b     :       array[1..20] of integer;
        k       :       longint;
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
var     i       :       longint;
        tg1,tg2 :       qword;
begin


