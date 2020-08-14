const   finp    =       '';
        fout    =       '';
type    ca      =       record
        x,y     :       integer;
        end;
var     g,f     :       text;
        n,m,dem,nh     :       integer;
        nhom,head,adj    :       array[1..50000] of integer;
        e       :       array[1..10000] of ca;
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
var     i,u,v       :integer;
begin
        readln(f,n,m);
        for i:=1 to n-1 do
                begin
                        readln(f,u,v);
                        if v=1 then
                                begin
                                        inc(dem);
                                        e[dem].x:=i+1;
                                        e[dem].y:=u;
                                        nhom[i+1]:=-1;
                                        nhom[u]:=-1;
                                end;
                end;
        for i:=1 to dem do
             with e[i] do
             begin
                head[x]:=head[x]+1;
                head[y]:=head[y]+1;
             end;
             for i:=2 to n do
             head[i]:=head[i-1]+head[i];
             for i:=dem downto 1 do
                    with e[i] do
                    begin
                        adj[head[x]]:=y;
                        adj[head[y]]:=x;
                        head[x]:=head[x]-1;
                        head[y]:=head[y]-1;
                    end;
                    head[n+1]:=2*dem;
end;
procedure       DFS(u:integer);
var     i:integer;
begin
        nhom[u]:=nh;
        for i:=head[u]+1 to head[u+1] do
                if nhom[adj[i]]=-1 then
                        DFS(adj[i]);
end;
procedure       xuly;
var     i,a,b:integer;
begin
        for i:=1 to n do
        if nhom[i]=-1 then
                begin
                        inc(nh);
                        DFS(i);
                end;
        for i:=1 to m do
                begin
                  readln(f,a,b);
                  if (nhom[a]=nhom[b])and(nhom[a]>0) then writeln(g,'NO')
                  else writeln(g,'YES');
                end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.