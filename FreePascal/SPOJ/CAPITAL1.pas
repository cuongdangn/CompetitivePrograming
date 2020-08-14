uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        w       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..10000] of node;
        n       :       longint;
        dd      :       array[1..10000] of longint;
        d       :       array[1..10000] of int64;
        p,ne    :       longint;
        k,kq,luu:       int64;
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
procedure       nap(var ke:node;u,w:longint);
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
        readln(f,n,p);
        for i:=1 to n-1 do
         begin
          readln(f,u,v,w);
          nap(ke[u],v,w);
          nap(ke[v],u,w);
         end;
end;

procedure        dfs1(u:longint);
var     p        :      node;
begin
        dd[u]:=1;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.u]=0 then
                  begin
                   d[p^.u]:=d[u]+int64(p^.w);
                   k:=max(d[p^.u],k);
                   dfs1(p^.u);
                  end;
                p:=p^.next;
         end;
end;
procedure        dfs(u:longint;w:int64);
var     p        :      node;
begin
        dd[u]:=ne;
        p:=ke[u];
        luu:=max(min(d[u],w),luu);
        while p<>nil do
         begin
                if dd[p^.u]<ne then
                   dfs(p^.u,w+int64(p^.w));
                p:=p^.next;
         end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        k:=0;
        dfs1(p);
        ne:=1;
        kq:=maxlongint*100000;
        for i:=1 to n do
         if i<>p then
          begin
            inc(ne);
            luu:=0;
            dfs(i,0);
            kq:=min(kq,luu);
          end;
         writeln(g,k-kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.