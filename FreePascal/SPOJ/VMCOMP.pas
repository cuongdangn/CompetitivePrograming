const   finp    =       '';
        fout    =       '';
type    canh    =       record
        x,y,gt     :       longint;
        end;
var     n,m,s,dau,cuoi     :       int64;
        b       :     array[1..100000,1..100000] of longint;
        a       :       array[1..100000] of int64;
        e       :       array[1..100000] of canh;
        adj     :       array[1..900000] of longint;
        head    :       array[0..100000] of longint;
        dd      :       array[1..100000] of boolean;
        st      :       array[1..900000] of longint;
        g,f     :       text;
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
var     i,x,y,c       :       longint;
begin
   fillchar(dd,sizeof(dd),true);
        readln(f,n,m,s);
        for i:=1 to m do
                with e[i] do
                begin
                        readln(f,x,y,gt);
                        a[x]:=a[x]+gt;
                        a[y]:=a[y]+gt;
                        b[x,y]:=gt;
                        b[y,x]:=gt;
                end;
                for i:=1 to n do head[i]:=0;
        for i:=1 to m do
                with e[i] do
                        begin
                                head[x]:=head[x]+1;
                                head[y]:=head[y]+1;
                        end;
        for i:=2 to n do
                head[i]:=head[i-1]+head[i];
        for i:=m downto 1 do
                with e[i] do
                        begin
                                adj[head[x]]:=y;
                                adj[head[y]]:=x;
                                head[x]:=head[x]-1;
                                head[y]:=head[y]-1;
                        end;
                head[n+1]:=2*m;
end;
procedure       push(u:longint);
begin
        inc(cuoi);
        st[cuoi]:=u;
end;
procedure       BFS;
var     i,u,v,kq:longint;
begin
        dau:=1;  kq:=0;
        cuoi:=0;
        for i:=1 to n do if a[i]<s then
        begin
        push(i);
        dd[i]:= false;
        end;
        while dau<=cuoi do
        begin
             v:=st[dau];
             inc(dau);
             for i:=head[v]+1 to head[v+1] do
              if dd[adj[i]] then
              begin
                    a[adj[i]]:= a[adj[i]]-b[v,adj[i]];
                    if a[adj[i]]<s then
                    begin
                    dd[adj[i]]:=false;
                    push(adj[i]);
                    end;
              end;
        end;
        for i:=1 to n do
        if dd[i] then inc(kq);
        if kq>0 then
         begin
          writeln(g,kq);
          for i:=1 to n do
           if dd[i] then write(g,i,' ');
          end
         else writeln(g,-1);
end;
begin
        mo;
        doc;
        BFS;
        dong;
end.



