uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
type    node    =       ^re;
        re      =       record
        v     :longint;
        next    :       node;
        end;
        kieu    =       array[0..10] of longint;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        cha     :       array[0..maxn,0..20] of longint;
        mi      :       array[0..maxn,0..20] of kieu;
        n,m,q     :     longint;
        lt    :     array[0..17] of longint;
        dd,h,cs    :     array[1..maxn] of longint;
        kq1,mau :     kieu;
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
procedure       nap(var ke:node;v     :       longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var i,u,v,w     :       longint;
begin
        for i:=1 to 10 do mau[i]:=maxn+5;
        readln(f,n,m,q);
        for i:=1 to n-1 do
         begin
                read(f,u,v);
                nap(ke[u],v);
                nap(ke[v],u);
         end;
         for i:=1 to m do
          begin
           read(f,u);
           cs[u]:=i;
           end;
end;
function napp(u,v:longint):kieu;
var tt:kieu;
begin
        tt:=mau;
        tt[0]:=2;
        tt[1]:=min(cs[u],cs[v]);
        tt[2]:=max(cs[u],cs[v]);
        exit(tt);
end;
procedure       DFS(u:longint);
var     p       :       node;
begin
        dd[u]:=1;
        p:=ke[u];
        while p<> nil do
         begin
                if dd[p^.v]=0 then
                 begin
                        h[p^.v]:=h[u]+1;
                        cha[p^.v,0]:=u;
                        mi[p^.v,0]:=napp(u,p^.v);

                        dfs(p^.v);
                 end;
                 p:=p^.next;
         end;
end;
function mix(a,b:kieu):kieu;
begin
        if(a[0]
procedure       init;
var i,j :       longint;
begin
        dfs(1);
        m:=trunc(ln(n)/ln(2))+1;
        for i:=1 to m do
                for j:=1 to n do
                 begin
                        cha[j,i]:=cha[cha[j,i-1],i-1];
                        //ma[j,i]:=max(ma[j,i-1],ma[cha[j,i-1],i-1]);
                        mi[j,i]:=mix(mi[j,i-1],mi[cha[j,i-1],i-1]);
                 end;
        lt[0]:=1;
        for i:=1 to m do
         lt[i]:=lt[i-1]*2;
end;
procedure       nhay(var v:longint;x:longint);
var     i       :       longint;
begin
        for i:=m downto 0 do
        if x>=lt[i] then
         begin
                x:=x-lt[i];
                kq1:=min(kq1,mi[v,i]);
                v:=cha[v,i];
         end;
end;
procedure       LCA(u,v:longint);
var     i       :longint;
begin
        if h[u]>h[v] then nhay(u,h[u]-h[v]) else
         nhay(v,h[v]-h[u]);
         if u=v then exit;
         for i:=m downto 0 do
          if cha[u,i]<>cha[v,i] then
           begin
                kq1:=min(kq1,min(mi[u,i],mi[v,i]));
                //kq2:=max(kq2,max(ma[v,i],ma[u,i]));
                u:=cha[u,i];
                v:=cha[v,i];
           end;
         kq1:=min(kq1,min(mi[u,0],mi[v,0]));
       // kq2:=max(kq2,max(ma[u,0],ma[v,0]));

end;
procedure       xuly;
var     t,u,v,i       :       longint;
begin

        for i:=1 to q do
         begin
          readln(f,u,v,t);
          kq1:=nap;
          LCA(u,v);
          write(g,min(kq1[0],t),' ');
          for j:=1 to min(kq1[0],t) do write(g,kq1[j],' ');
         end;
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
