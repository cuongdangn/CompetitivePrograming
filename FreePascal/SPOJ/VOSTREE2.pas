const   finp    =       '';
        fout    =       '';
        maxn    =       100005;
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n,m     :       longint;
        a       :       array[1..maxn] of int64;
        ke      :       array[1..maxn] of node;
        kq      :       int64;
        tham    :       array[1..maxn] of boolean;

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
procedure       nap(var ke:node;u:int64);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v   :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
         begin
          readln(f,u,v);
          nap(ke[u],v);
          nap(ke[v],u);
         end;
         for i:=1 to n do read(f,a[i]);
end;
procedure       dfs(u:longint);
var     p       :       node;
        v       :       longint;
        dem     :       int64;
begin
        p:=ke[u];
        tham[u]:=false;
        dem:=0;
        while p<> nil do
         begin
             v:=p^.u;
             if tham[v] then
              begin
               dem:=dem+a[v];
               dfs(v);
              end;
             p:=p^.next;
         end;
        kq:=kq+abs(a[u]-dem);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        fillchar(tham,sizeof(tham),true);
        kq:=0;
        dfs(1);
        writeln(g,kq);
end;
procedure       doc1;
var     i,t     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          doc;
          xuly;
         end;
end;
begin
        mo;
        doc1;
        dong;
end.