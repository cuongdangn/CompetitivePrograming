const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..1000,1..1000] of byte;
        b       :       array[1..1000,1..1000] of byte;
        dd      :       array[1..1000] of byte;
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
        close(f);
        close(g);
end;
procedure       doc;
var     i,j       :       longint;x:char;u,v:longint;
begin
         readln(f,n);
         readln(f,m);
         for i:=1 to m do
          begin
             readln(f,x,u,v);
             if x='F' then
                begin
                        a[u,v]:=1;
                        a[v,u]:=1;
                end
             else
              begin
                        b[u,v]:=1;
                        b[v,u]:=1;
                        for j:=1 to n do if (j<>v) and (b[j,u]=1) then
                                begin
                                        a[j,v]:=1;
                                        a[v,j]:=1;
                                end;
                                 for j:=1 to n do if (j<>u) and (b[j,v]=1) then
                                begin
                                        a[j,u]:=1;
                                        a[u,j]:=1;
                                end;
              end;
end;
end;
procedure       DFS(u:longint);
var     v:longint;
begin
         dd[u]:=1;
        for v:=1 to n do
                if (a[u,v]=1)and(dd[v]=0) then
                        DFS(v);
end;
procedure       xuly;
var     i,dem       :longint;
begin
          dem:=0;
        for i:=1 to n do
        if dd[i]=0 then
                begin
                        inc(dem);
                        DFS(i);
                end;
        writeln(g,dem);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
