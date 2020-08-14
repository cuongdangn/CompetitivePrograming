const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        m,n,dem,n1:       longint;
        dep     :       array[1..maxn] of longint;
        d       :       array[0..maxn,0..18] of longint;
        num     :       array[1..maxn] of longint;
        v       :       array[1..maxn] of longint;
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
procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v     :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
          begin
           readln(f,u,v);
           nap(ke[u],v);
           nap(ke[v],u);
          end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        p:=ke[u];
        inc(dem);
        num[u]:=dem;
        while p<>nil do
         begin
          if num[p^.u]=0 then
           begin
            d[p^.u,0]:=u;
            dep[p^.u]:=dep[u]+1;
            dfs(p^.u);
           end;
           p:=p^.next;
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        dem:=0;
        dfs(1);
         m:=trunc(ln(n)/ln(2))+1;
        for j:=1 to m do
          for i:=1 to n do
           d[i,j]:=d[d[i,j-1],j-1];
end;
function        nhay(u,l        :       longint):longint;
var     i       :       longint;
begin
        for i:=m downto 0 do
         if l>=1 shl i then
          begin
           u:=d[u,i];
           l:=l-1 shl i;
          end;
          exit(u);
end;
function        LCA(a,b:longint):longint;
var     i       :       longint;
begin
        if dep[a]>dep[b] then a:=nhay(a,dep[a]-dep[b])
        else b:=nhay(b,dep[b]-dep[a]);
        if a=b then exit(a);
        for i:=m downto 0 do
        if d[a,i]<>d[b,i] then
         begin
          a:=d[a,i];
          b:=d[b,i];
         end;
         exit(d[a,0]);
end;
procedure       QS(l,h:longint);
var     t,x,i,j :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=num[v[t]];
        repeat
         while num[v[i]]<x do inc(i);
         while num[v[j]]>x do dec(j);
          if i<=j then
           begin
            tg:=v[i];
            v[i]:=v[j];
            v[j]:=tg;
            inc(i);dec(j);
           end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

function        tinh:longint;
var     kq,i:longint;
begin
        QS(1,n1);
        kq:=dep[v[1]];
        for i:=2 to n1 do
         kq:=kq+dep[v[i]]-dep[lca(v[i],v[i-1])];
        exit(kq*2);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        init;
        for i:=1 to n do
         begin
          j:=i;
          n1:=0;
          while j<=n do
           begin
            inc(n1);
            v[n1]:=j;
            j:=j+i;
           end;
           writeln(g,tinh);
          end;
end;
begin
        mo;
        doc;
        randomize;
        xuly;
        dong;
end.