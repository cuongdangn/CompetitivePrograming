uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :      node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        dd      :       array[1..maxn] of byte;
        n       :       longint;
        d       :       array[1..3,1..maxn] of longint;
        tr      :       array[1..maxn] of byte;

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
var     p       :node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     u,v,i     :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
                begin
                     readln(f,u,v);
                     nap(ke[u],v);
                     nap(ke[v],u);
                end;
end;
function        minx(v:longint):longint;
var     i       :byte;
begin
        minx:=d[1,v];
        for i:=2 to 3 do minx:=min(minx,d[i,v]);
end;

procedure       DFS(u:longint);
var     v,t:      longint;
        p       :       node;
        i       :       byte;
begin
        dd[u]:=1;
        p:=ke[u];
        while p<>nil do
                begin
                        v:=p^.v;
                        if dd[v]=0 then
                                begin
                                        dfs(v);
                                        d[1,u]:=d[1,u]+min(d[2,v],d[3,v]);
                                        d[2,u]:=d[2,u]+min(d[1,v],d[3,v]);
                                        d[3,u]:=d[3,u]+min(d[1,v],d[2,v]);
                                end;
                        p:=p^.next;
                end;
        for i:=1 to 3 do d[i,u]:=d[i,u]+i;
end;
procedure       DFS1(u,i:longint);
var     v,t:      longint;
        p       :       node;

begin
        dd[u]:=1;
        tr[u]:=i;
        p:=ke[u];
        while p<>nil do
                begin
                        v:=p^.v;
                        if dd[v]=0 then
                                begin
                                        if i=1 then if min(d[2,v],d[3,v])=d[2,v] then dfs1(v,2)else dfs1(v,3);
                                        if i=2 then if min(d[1,v],d[3,v])=d[1,v] then dfs1(v,1)else dfs1(v,3);
                                        if i=3 then if min(d[2,v],d[1,v])=d[2,v] then dfs1(v,2)else dfs1(v,1);
                                end;
                        p:=p^.next;
                end;
end;

procedure       xuly;
var     i,j:      longint;
begin
        DFS(1);
        writeln(g,minx(1));
        j:=1;
        for i:=2 to 3 do if d[i,1]<d[j,1] then j:=i;
        fillchar(dd,sizeof(dd),0);
        DFs1(1,j);
        for i:=1 to n do writeln(g,tr[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
