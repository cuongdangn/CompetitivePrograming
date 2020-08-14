uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
type    node    =       ^re;
        re      =       record
        u,c     :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        num,low :       array[1..maxn] of longint;
        dd,dd2      :       array[0..maxn] of boolean;
        mau,ca,con,cha  :       array[0..maxn] of longint;
        dem,n,m :       longint;
        e       :       array[1..maxn] of bg;
        lo      :       longint;
        loai    :       array[0..1] of longint;
        d       :       array[1..maxn,0..1] of longint;
        kq      :       longint;
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
procedure       nap(var ke:node;u,c:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.c:=c;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     u,v,i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
          readln(f,u,v);
          e[i].x:=u;
          e[i].y:=v;
          nap(ke[u],v,i);
          nap(ke[v],u,i);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        inc(dem);
        num[u]:=dem;
        p:=ke[u];
        low[u]:=n+1;
        while p<>nil do
         begin
         if dd[p^.c] then
          begin
          dd[p^.c]:=false;
          if num[p^.u]>0 then
           low[u]:=min(low[u],num[p^.u])
          else
           begin
                ca[p^.u]:=p^.c;
                dfs(p^.u);
                low[u]:=min(low[u],low[p^.u]);
           end;
          end;
          p:=p^.next;
         end;
end;
procedure       dfs2(u:longint);
var     p       :       node;
        t       :       longint;
begin
        p:=ke[u];
        t:=0;
        dd[u]:=false;
        while p<>nil do
         begin
                if dd[p^.u] then
                begin
                cha[p^.u]:=u;
                dfs2(p^.u);
                t:=t+con[p^.u];
                end;
                p:=p^.next;
         end;
         if t>0 then
          begin
                dd2[cha[u]]:=true;
                inc(kq);
                con[u]:=0;
          end
          else
          begin
                if dd2[u] then con[u]:=0
                else con[u]:=1;
          end;
end;
procedure       dfs1(u,t:longint);
var     p       :       node;
begin
        mau[u]:=t;
        p:=ke[u];
        while p<>nil do
         begin
                if (mau[p^.u]=0)and(dd[p^.c]) then dfs1(p^.u,t);
                p:=p^.next;
         end;
end;

procedure       init;
var     i,j     :       longint;
begin
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         if num[i]=0 then
          begin
                dem:=0;
                ca[i]:=-1;
                dfs(i);
          end;
        ///////////////////////////////
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
           if (ca[i]<>-1)and(low[i]>=num[i]) then dd[ca[i]]:=false;
        ///////////////////////////////
        for i:=1 to n do
         if mau[i]=0 then
          begin
                inc(lo);
                dfs1(i,lo);
          end;
         for i:=1 to lo do ke[i]:=nil;
         for i:=1 to m do
          if not dd[i] then
           begin
            nap(ke[mau[e[i].x]],mau[e[i].y],i);
            nap(ke[mau[e[i].y]],mau[e[i].x],i);
           end;
end;
procedure       xuly;
var     i,j:    longint;
begin
        init;
        for i:=1 to lo do dd[i]:=true;
        for i:=1 to lo do
         if dd[i] then
          begin
           con[0]:=0;
           cha[i]:=0;
           dfs2(i);
           if (con[i]>0) then kq:=kq+1;
          end;

        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
