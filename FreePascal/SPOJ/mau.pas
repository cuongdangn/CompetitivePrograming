const   fin     =       '';
        fout    =       '';
var     f1,f2   :       text;
procedure       mofile;
begin
        assign(f1,fin);
        reset(f1);
        assign(f2,fout);
        rewrite(f2);
end;
/////////////////////////
procedure       docfile;
var     i,j     :       longint;
begin

end;
/////////////////////////
procedure       xulyfile;
var     i,j     :       longint;
begin

end;
//////////////////////////
procedure       dongfile;
begin
        close(f1);
        close(f2);
end;
///////////////////////////
begin
        mofile;
        docfile;
        xulyfile;
        dongfile;
end.