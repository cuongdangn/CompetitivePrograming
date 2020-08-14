const   finp    =       '';
        fout    =       '';
type    ca =       record
        x,y     :       longint;
        end;
var     f,g     :       text;
        head,adj,dd        :       array[1..50001] of longint;
        n,m,s,cuoi,dau     :       longint;
        st      : array[0..4*10000] of longint;
        canh    : array[1..50000] of ca;
        l       : array[1..10000] of longint;
        kq      : int64;
        ds      : array[1..10000,1..10000] of byte;
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
var     i,i1,i2,t,dem:longint;
begin
        t:=0;
        dem:=0;
        readln(f,n,m,s);
        for i:=1 to m do
                begin
                        readln(f,i1,i2);
                        if ds[i1,i2]=0 then
                                begin
                                    inc(dem);
                                    canh[dem].x:=i1;
                                    canh[dem].y:=i2;
                                    ds[i1,i2]:=1;
                                end;
                end;
        m:=dem;

        for i:=1 to n do head[i]:=0;
        for i:=1 to m do
                with canh[i] do
                        head[x]:=head[x]+1;
        for i:=2 to n do
                head[i]:=head[i-1]+head[i];

        for i:=m downto 1 do
                with canh[i] do
                        begin
                                adj[head[x]]:=y;
                                head[x]:=head[x]-1;
                        end;
        head[n+1]:=m;
end;
procedure       push(u:longint);
begin
        inc(cuoi);
        st[cuoi]:=u;
end;
procedure               BFS;
var     u,i,j               :       longint;
begin
        dau:=0;
        cuoi:=-1;
        push(s);
        l[s]:=1;
        dd[s]:=1;
        kq:=0;
        while dau<=cuoi do
                begin
                        u:=st[dau];
                        inc(dau);
                        for i:=head[u]+1 to head[u+1] do
                                begin
                                        j:=adj[i];
                                        if dd[j]=1 then
                                                        if l[j]=l[u]+1 then
                                                        begin
                                                        dd[j]:=2;
                                                        inc(kq);
                                                        end;
                                        if dd[j]=0 then
                                                begin
                                                        if dd[u]=2 then
                                                                begin
                                                                        inc(kq);
                                                                        dd[j]:=2;
                                                                        l[j]:=l[u]+1;
                                                                        push(j);
                                                                end
                                                        else
                                                                begin
                                                                        dd[j]:=1;
                                                                        l[j]:=l[u]+1;
                                                                        push(j);
                                                                end;
                                                end;
                                end;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        BFS;
        dong;
end.


