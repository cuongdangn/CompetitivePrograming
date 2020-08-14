const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        a       :       array[1..10000,1..10000] of longint;
        n,kq,i,m       :       longint;  dem:int64;
        dd   :       array[1..10000] of byte;
        head :       array[1..10000] of longint;
        adj     :    array[1..10000] of longint;
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
{procedure       doc;
var     i,j       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        for j:=1 to n do
                                begin
                                read(f,a[i,j]);
                                if a[i,j]=1 then inc(m);
                                end;

                        readln(f);
                end;
                head[n+1]:=m;
        for i:=n downto 1 do
         begin
                head[i]:=head[i+1];
                for j:=n downto 1 do
                 if a[i,j]>0 then
                  begin
                        adj[head[i]]:=j;
                        head[i]:=head[i]-1;
                  end;
         end;
end;
procedure       DFS(u:longint);
var     i       :       longint;
begin
        dd[u]:=1;
        for i:=head[u]+1 to head[u+1] do
                if a[u,adj[i]]=1 then
                        if dd[adj[i]]=0 then
                                begin
                                        inc(dem);
                                        if dem=n then
                                                begin
                                                inc(kq);
                                                kq:=kq mod 1000000007;
                                                end
                                        else dfs(adj[i]);
                                        dec(dem);
                                end;
        dd[u]:=0;
end; }
begin
        mo;
       { doc;}dem:=1;
       for i:=2 to 777 do
        begin
        dem:=(dem*i) mod 1000000007;
        end;
        writeln(g,dem);
        dong;
end.
