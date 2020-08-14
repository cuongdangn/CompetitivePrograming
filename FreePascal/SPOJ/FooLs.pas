const   finp    =       'FOOLS.INP';
        fout    =       'FOOLS.OUT';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     n       :       longint;
        g,f     :       text;
        ke      :       array[1..100010] of node;
        m       :       longint;
        dep     :       array[1..100010] of longint;
        cha     :       array[0..100010,0..25] of longint;
        dd      :       array[1..100010] of boolean;
        nhan    :       array[1..100010] of longint;
        e       :       array[1..100010] of bg;
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
                e[i].x:=u;
                e[i].y:=v;
                nap(ke[u],v);
                nap(ke[v],u);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.u] then
                 begin
                        cha[p^.u,0]:=u;
                        dep[p^.u]:=dep[u]+1;
                        dfs(p^.u);
                 end;
                p:=p^.next;
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        fillchar(dd,sizeof(dd),true);
        dep[1]:=1;
        dfs(1);
        m:=trunc(ln(n)/ln(2))+1;
        for j:=1 to m do
          for i:=1 to n do
                 cha[i,j]:=cha[cha[i,j-1],j-1];
end;
procedure       nhay(var a:longint;l:longint);
var     i       :       longint;
begin
        for i:=m downto 0 do
         if l>=1 shl i then
          begin
                a:=cha[a,i];
                l:=l-(1 shl i);
          end;
end;
function        lca(a,b:longint):longint;
var     i       :       longint;
begin
        if dep[a]>dep[b] then nhay(a,dep[a]-dep[b])
        else nhay(b,dep[b]-dep[a]);
        if a=b then exit(a);
        for i:=m downto 0 do
        if cha[a,i]<>cha[b,i] then
         begin
                a:=cha[a,i];
                b:=cha[b,i];
         end;
         exit(cha[a,0]);
end;

procedure       dfs1(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.u] then
                 begin
                        dfs1(p^.u);
                        nhan[u]:=nhan[u]+nhan[p^.u];
                 end;
                p:=p^.next;
         end;
end;
procedure       xuly;
var     i,j,y,u,v,t     :       longint;
begin
        init;
        read(f,t);
        for i:=1 to t do
         begin
                read(f,u,v);
                y:=lca(u,v);
                nhan[y]:=nhan[y]-2;
                inc(nhan[u]);
                inc(nhan[v]);
         end;
         fillchar(dd,sizeof(dd),true);
         dfs1(1);
         for i:=1 to n-1 do
          begin
           if cha[e[i].x,0]=e[i].y then write(g,nhan[e[i].x],' ')
           else write(g,nhan[e[i].y],' ');
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
