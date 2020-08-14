{$MODE OBJFPC}
{$M 4000000}
const   finp    =       '';
        fout    =       '';
        maxn=100000;
        maxm=1000000;
type    stack      =       record
        item    :       array[1..maxn] of integer;
        top     :       integer;
        end;
        tedge   =       record
        x,y:integer;
        end;

var     g,f     :       text;
        e       :       array[1..maxm] of tedge;
        link    :       array[1..maxm] of integer;
        head,number,low,t,dd    :       array[1..maxn] of integer;
        avail   :       array[1..maxn] of boolean;
        st   :  stack;
        n,count,scc,m     :       integer;
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
var     i,v,u       :       integer;
begin
        readln(f,n,m);
        for i:=1 to m do
                with    e[i] do readln(f,x,y);

        fillchar(head,sizeof(head),0);
        for i:=m downto 1 do
        with e[i] do
                begin
                        link[i]:=head[x];
                        head[x]:=i;
                end;
end;
procedure       kt;
begin
        fillchar(number,sizeof(number),0);
        fillchar(avail,sizeof(avail),true);
        st.top:=0;
        count:=0;
        scc:=0;
end;
procedure      push(v:integer);
        begin
                with st do
                        begin
                                inc(top);
                                item[top]:=v;
                        end;
        end;
function pop:integer;
begin
        with st do
                begin
                        pop:=item[top];
                        dec(top);
                end;
end;
procedure       mini(var x:integer;y:integer);
begin
        if y<x then x:=y;
end;

procedure       DFS(u:integer);
var     i,v     :       integer;
begin
        inc(count);
        number[u]:=count;
        low[u]:= 10000 ;
        push(u);
        i:=head[u];
        while i<>0 do
                begin
                        v:= e[i].y;
                        if avail[v] then
                          if number[v]<>0 then
                            mini(low[u],number[v])
                          else
                                begin
                                        DFS(v);
                                        mini(low[u],low[v]);
                                end;
                        i:=link[i];
                end;

        if low[u]>= number[u] then
                begin
                        inc(scc);
                        repeat
                                v:=pop;
                                t[v]:=scc;
                                avail[v]:=false;
                        until v=u;
                end;
end;
procedure       xuly;
var     v       :       integer;
begin
        fillchar(dd,sizeof(dd),0);
        for v:=1 to n do
                if avail[v] then dfs(v);
        for v:=1 to m do
         begin
                if dd[t[e[v].y]]=0 then
                if t[e[v].x]<>t[e[v].y] then
                begin
                dec(scc);
                dd[t[e[v].y]]:=1;
                end;
         end;
         write(g,scc);
end;
begin
        mo;
        doc;
        kt;
        xuly;
        dong;
end.

