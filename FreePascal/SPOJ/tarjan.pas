uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        tham    :       array[1..maxn] of boolean;
        ke      :       array[1..maxn] of node;
        n,m     :       longint;
        num,low :       array[1..maxn] of longint;
        st      :       array[1..2*maxn] of longint;
        top,dem     :       longint;
        scc     :       longint;
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
procedure       nap(var ke:node;v:longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v       :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
        begin
                readln(f,u,v);
                nap(ke[u],v);
        end;
end;
procedure       ktao;
begin
        fillchar(tham,sizeof(tham),false);
        top:=0;
end;
procedure       push(u:longint);
begin
        inc(top);
        st[top]:=u;
end;
procedure       dfs(u:longint);
var     p       :node;
        v:longint;
begin
        inc(dem);
        num[u]:=dem;
        low[u]:=maxlongint;
        p:=ke[u];
        push(u);
        while p<>nil do
                begin
                        v:=p^.v;
                        if tham[v]= false then
                         if num[v]>0 then
                                        low[u]:=min(low[u],num[v])
                         else
                                begin
                                        dfs(v);
                                        low[u]:=min(low[u],low[v]);
                                end;
                         p:=p^.next;
                end;
                if num[u]<=low[u] then
                        begin
                                inc(scc);
                                repeat
                                        v:=st[top];
                                        dec(top);
                                       { write(g,v,' ');}
                                        tham[v]:=true;
                                until   v=u;
                                {writeln(g);}
                        end;
end;
procedure       xuly;
var     i       :longint;
begin
        ktao;
        for i:=1 to n do
        if tham[i]=false then dfs(i);
        writeln(g,scc);
        dong;
end;
begin
        mo;
        doc;
        xuly;
end.



