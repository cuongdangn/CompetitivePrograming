const   finp    =       '';
        fout    =       '';
        maxw    =       10000299;
type    node    =       ^re;
        re      =       record
        u,w,pow     :longint;
        next    :       node;
        end;
var     g,f     :       text;
        ok      :       boolean;
        n,m,res,kq,tong     :       longint;
        tham    :       array[1..502] of boolean;
        d,tx       :       array[0..502] of longint;
        ke      :       array[1..502] of node;
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
procedure       nap(var ke:node;u,w,pow:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        p^.pow:=pow;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w,pow       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         read(f,tx[i]);
        read(f,m);
        for i:=1 to m do
         begin
          readln(f,u,v,w,pow);
          tong:=tong+pow;
          nap(ke[u],v,w,pow);
          nap(ke[v],u,w,pow);
         end;
end;
procedure       dj;
var     u,i:longint;
        p       :       node;
begin
        for i:=1 to n do
        begin
        d[i]:=maxw;
        tham[i]:=true;
        end;
        d[0]:=maxw;
        d[n]:=0;
        repeat
         u:=0;
         for i:=1 to n do
         if tham[i] then
          if d[i]<d[u] then u:=i;
          if u=0 then exit;
          tham[u]:=false;
          p:=ke[u];
          while p<>nil do
           begin
             if d[p^.u]>d[u]+p^.w then
              d[p^.u]:=d[u]+p^.w;
             p:=p^.next;
           end;
        until false;
end;
procedure       DFS(u,w,t:longint);
var     p       :       node;
begin
        if u=n then
         begin
          ok:=true;
          exit;
         end;
        p:=ke[u];
        if tx[u]=1 then w:=res;
        while p<>nil do
           begin
              if (w>=p^.pow)and(t+p^.w+d[p^.u]=d[1])
              then dfs(p^.u,w-p^.pow,t+p^.w);
              if ok then exit;
           p:=p^.next
          end;
end;
procedure        chat;
var     dau,cuoi,giua:longint;
begin
        dau:=1;
        cuoi:=tong;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) div 2;
          res:=giua;
          ok:=false;
          dfs(1,giua,0);
          if ok then
           begin
            kq:=giua;
            cuoi:=giua-1;
           end
           else dau:=giua+1;
          end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        dj;
        chat;
        dong;
end.
