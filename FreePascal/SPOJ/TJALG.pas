uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;

var     g,f     :       text;
        ke      :       array[1..10000] of node;
        tham    :       array[1..10000] of boolean;
        num,low,st:     array[1..20000] of longint;
        m,n,dem,kq,top      :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure    z   dong;
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
var    i,u,v:longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                nap(ke[u],v);
         end;
end;

procedure       DFS(u:longint);
var     v       :       longint;
        p       :       node;
begin
        inc(dem);
        num[u]:=dem;
        low[u]:=maxlongint;
        inc(top);
        st[top]:=u;
        p:=ke[u];
        while p<> nil do
         begin
                if tham[p^.v] then
                 if num[p^.v]>0 then low[u]:=min(low[u],num[p^.v])
                 else
                  begin
                        DFS(p^.v);
                        low[u]:=min(low[u],low[p^.v]);
                  end;
                  p:=p^.next;
         end;
         if num[u]<=low[u] then
           begin
                inc(kq);
                repeat
                        v:=st[top];
                        dec(top);
                        tham[v]:=false;
                until   v=u;
           end;
end;
procedure       xuly;
var     i       :       longint;
begin
        fillchar(tham,sizeof(tham),true);
        for i:=1 to n do
         if tham[i] then DFS(i);
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;dong;
end.