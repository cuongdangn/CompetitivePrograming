const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x1,y1     :       longint;
        end;
var     g,f     :       text;
        a       :       array[1..100000] of bg;
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
procedure       QS(l,h:longint);
var     i,j,x,x1     :       longint;
        tg      : longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].x;

procedure       doc;
var     i       :longint;
begin
        readln(
