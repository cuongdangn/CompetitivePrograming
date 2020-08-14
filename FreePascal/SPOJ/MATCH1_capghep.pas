const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n,m,k   :       longint;
        ke      :       array[1..10000] of node;
        dd      :       array[1..10000] of boolean;
        ok      :       boolean;
        list,match    :       array[1..10000] of longint;
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
        readln(f,n,m,k);
        for i:=1 to k do
         begin
          readln(f,u,v);
          nap(ke[u],v);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.u] then
                 begin
                        dd[p^.u]:=false;
                        if match[p^.u]<>0 then
                                dfs(match[p^.u])
                                else ok:=true;
                        if ok then begin match[p^.u]:=u;exit; end;
                 end;
                 p:=p^.next;
         end;
end;


procedure       capghep;
var     i,j,nlist,old     :       longint;
begin
        for i:=1 to n do
         list[i]:=i;
        nlist:=n;
        repeat
                old:=nlist;
                for i:=1 to m do dd[i]:=true;
                for i:=nlist downto 1 do
                 begin
                        ok:=false;
                        dfs(list[i]);
                        if ok then
                         begin
                                list[i]:=list[nlist];
                                dec(nlist);
                         end;
                 end;
        until    nlist=old;
end;
procedure       xuly;
var     i,j,kq     :       longint;
begin
        capghep;
        kq:=0;
        for i:=1 to m do
         if match[i]<>0 then
          inc(kq);
          writeln(g,kq);
         for i:=1 to m do
          if match[i]<>0 then writeln(g,match[i],' ',i);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.