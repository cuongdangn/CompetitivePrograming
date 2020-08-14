const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        kq      :       int64;
        n       :       longint;
        sl1,sl  :       array[1..100000] of int64;
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
procedure       doc;
var     i      :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         begin
          readln(f,a[i].x,a[i].y);
          inc(sl[a[i].x]);
          inc(sl1[a[i].y]);
         end;
        for i:=1 to n do
          kq:=kq+(sl[a[i].x]-1)*(sl1[a[i].y]-1);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
