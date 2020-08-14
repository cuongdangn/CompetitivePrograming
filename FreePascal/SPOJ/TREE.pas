const   finp    =       'TREE.INP';
        fout    =       'TREE.OUT';
        maxn    =       trunc(1e6);
type    node    =       ^re;
        re      =       record
        u       :       longint;
        w       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n       :       longint;
        d,dto       :       array[0..maxn] of int64;
        dd      :       array[1..maxn] of boolean;
        slcon   :       array[1..maxn] of longint;
        kq      :       int64;
        kq2     :       longint;
        ke      :       array[1..maxn] of node;
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
procedure       nap(var ke: node;u,w:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;

procedure       doc;
var     i,j,u,v,w     :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
         begin
          readln(f,u,v,w);
          nap(ke[u],v,w);
          nap(ke[v],u,w);
         end;
end;
procedure       DFS(v:longint);
var     p       :       node;
begin
        dd[v]:=false;
        p:=ke[v];
        while p<>nil do
         begin
          if dd[p^.u] then
           begin
            dfs(p^.u);
             slcon[v]:=slcon[v]+slcon[p^.u];
            d[v]:=d[v]+int64(p^.w)*int64(slcon[p^.u])+d[p^.u];
           end;
          p:=p^.next;
         end;
        slcon[v]:=slcon[v]+1;
end;
procedure       dfslay(v,cha,tr:longint);
var     p       :       node;
begin
        dd[v]:=false;
        p:=ke[v];
        dto[v]:=dto[cha]-int64(tr)*int64(slcon[v])+int64(tr)*int64((n-slcon[v]));
        while p<>nil do
         begin
           if dd[p^.u] then
             dfslay(p^.u,v,p^.w);
           p:=p^.next;
         end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to n do dd[i]:=true;
        dfs(1);
        for i:=1 to n do dd[i]:=true;
        dto[0]:=d[1];
        dfslay(1,0,0);
        for i:=1 to n do
         if kq<=dto[i] then
          begin
           kq:=dto[i];
           kq2:=i;
          end;
         writeln(g,kq,' ',kq2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
