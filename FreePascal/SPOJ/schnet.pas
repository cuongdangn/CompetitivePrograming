{$MODE OBJFPC}
{$M 4000000}
uses    math;
const   finp    =       'DNC.inp';
        fout    =       '';
        maxn    =       100;
        maxm    =       10000;
type    stac    =       record
        item    :       array[1..maxn] of integer;
        top     :       integer;
        end;
        tedge   =       record
        x,y     :       integer;
        end;

var     g,f     :       text;
        e       :       array[1..maxm] of tedge;
        link    :       array[1..maxm] of integer;
        head,number,low,dd,t,dd1,dd2:        array[1..maxn] of integer;
        avail   :       array[1..maxn] of boolean;
        st      :       stac;
        n,count,scc,m   :       integer;
        br,bv   :      integer;
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
var     i,u,v   :       integer;
begin
        readln(f,n);
        m:=0;
        for i:=1 to n do
                begin
                        read(f,u);
                        while u<>0 do
                                begin
                                        inc(m);
                                        e[m].x:=i;
                                        e[m].y:=u;
                                        read(f,u);
                                end;
                        readln(f);
                end;
        for i:=m downto 1 do
                begin
                        with e[i] do
                                begin
                                        link[i]:=head[x];
                                        head[x]:=i;
                                end;
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
var     v,iq       :       integer;
begin
        fillchar(dd,sizeof(dd),0);
        fillchar(dd1,sizeof(dd),0);
        for v:=1 to n do
                if avail[v] then dfs(v);
        iq:=scc;
        for v:=1 to m do
         begin
                if dd[t[e[v].y]]=0 then
                if t[e[v].x]<>t[e[v].y] then
                begin
                dec(iq);
                dd[t[e[v].y]]:=1;
                dd1[t[e[v].y]]:=1;
                dd2[t[e[v].x]]:=1;
                end;
         end;
         writeln(g,iq);
         for v:=1 to scc do
               begin
                if dd1[v]=0 then inc(bv);
                if dd2[v]=0 then inc(br);
               end;
         writeln(g,max(br,bv));


end;
begin
        mo;
        doc;
        kt;
        xuly;
        dong;
end.

