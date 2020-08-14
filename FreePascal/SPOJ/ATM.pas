const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
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
procedure       chuyendoi(w:int64);
var     i,j     :       longint;
begin
        m:=0;
        while w>0 do
         begin
          inc(m);
          b[m]:=w mod 10;
          w:=w div 10;
         end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        w:=w div 1000;
        chuyendoi(w);
        sc:=1;
        for i:=1 to m do
         begin
          sc:=sc*scc[b[i]];
          min1:=min1+d[b[i]];
         end;
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
                readln(f,w);
                if w mod 1000<>0 then
                  writeln(g,0,' ',0)
                else
                  xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.

