const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        adj     :       array[1..1000000] of longint;
        head,tr    :       array[0..1000] of longint;
        a       :       array[1..1000,1..1000] of integer;
        n,q     :       longint;
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
var     i,j,x,y,z       :       longint;
begin
        readln(f,n,q);
        for i:=1 to n-1 do
        begin
                readln(f,x,y,z);
                a[x,y]:=z;
                a[y,x]:=z;
        end;
        head[n+1]:=(n-1)*2;
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
procedure       bfs(x,y:longint);
var     st      :       array[1..100000] of longint;
        dau,cuoi,t,i,kq:longint;
begin
        fillchar(st,sizeof(st),0);
        fillchar(tr,sizeof(tr),0);
        dau:=0;cuoi:=1;st[cuoi]:=x;
        while dau<=cuoi do
                begin
                    inc(dau);
                    t:=st[dau];
                    for i:=head[t]+1 to head[t+1] do
                     if tr[adj[i]]=0 then
                     begin
                           inc(cuoi); st[cuoi]:=adj[i];
                           tr[adj[i]]:=t;
                           if adj[i]=y then break;

                     end;
                     if adj[i]=y then break;
                end;

                kq:=0;
      while y<>x do
        begin
                kq:=kq+a[tr[y],y];
                y:=tr[y];
        end;
        writeln(g,kq);
end;
procedure       xuly;
var     i,x,y:longint;
begin
        for i:=1 to q do
        begin
                readln(f,x,y);
                BFS(x,y);
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
