const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        x,y     :       char;
        s       :       ansistring;
        n,sx      :       longint;
        dem:      int64;
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
begin
        i:=0;
        readln(f,s);
        n:=length(s);
        read(f,x);
        read(f,y);
end;
procedure       xuly;
var     i       :       longint;
begin
        dem:=0;
        for i:=1 to  n do
         begin
              if (sx>0)and(s[i]=y) then
                 begin
                        dem:=dem+sx;
                 end;
              if s[i]=x then inc(sx);
         end;
         write(g,dem);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
