const   finp    =       'square.inp';
        fout    =       'square.out';
var     g,f     :    text;
        canh,n  :    longint;
        a       :    array[1..21,1..21] of char;
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
var     i,j       :       longint;
begin
        readln(f,n);
        canh:=0;
        for i:=1 to n do
         begin
                for j:=1 to n do
                        begin
                                read(f,a[i,j]);
                                if a[i,j]='#' then inc(canh);
                        end;
                        readln(f);
         end;
end;
procedure       xuly;
var     i,j,u,v     :       longint;
begin
        if sqr(trunc(sqrt(canh)))<>canh then
         begin
                writeln(g,'NO');
                exit;
         end;
        canh:=trunc(sqrt(canh));
        for u:=1 to n do
        begin
         for v:=1 to n do
          if a[u,v]='#' then  break;
          if a[u,v]='#' then break;
         end;
         if (canh+u-1>n)or(canh+v-1>n) then
          begin
                writeln(g,'NO');
                exit;
          end;
          for i:=u to u+canh-1 do
           for j:=v to v+canh-1 do
            if a[i,j]='.' then
             begin
                writeln(g,'NO');
                exit;
             end;
            writeln(g,'YES');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

