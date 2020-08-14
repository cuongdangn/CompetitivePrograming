const   finp    =       'DNC.INP';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u      :       longint;
        next    :       node
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m     :       longint;
        ke      :       array[1..1101] of node;
        a       :       array[1..1010,1..1010] of longint;
        dd,dd1      :       array[1..1010,1..1010] of boolean;
        num,xo  :       array[1..1010] of longint;
        id      :       longint;
        truy,luu:       array[1..20000] of longint;
        lkq     :       array[1..20000] of bg;
        kq,l    :       longint;
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
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                inc(a[u,v]);
                nap(ke[u],v);
         end;
end;
function        dfs(u:longint;ok:boolean):boolean;
var     p       :       node;
        v       :longint;
begin
        num[u]:=id;
        xo[u]:=0;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[u,p^.u] then
                begin
                if  num[p^.u]<id then
                 begin
                        truy[p^.u]:=u;
                        if dfs(p^.u,ok) then exit(true);
                 end
                else  if xo[p^.u]=0 then
                        begin
                                if ok then
                                begin
                                v:=u;
                                while v<>p^.u do
                                 begin
                                        inc(l);
                                        luu[l]:=v;
                                        v:=truy[v];
                                 end;
                                 inc(l);
                                 luu[l]:=v;
                                end
                                else
                                 begin
                                 v:=u;
                                 while v<>p^.u do
                                 begin
                                        dd1[truy[v],v]:=true;
                                        v:=truy[v];
                                 end;

                                 end;
                                  exit(true);
                        end;
                end;
                p:=p^.next;
         end;
         xo[u]:=id;
         exit(false);
end;
procedure       xuly;
var     i,j       :       longint;
        ok      :       boolean;

begin
        id:=1;
        ok:=true;
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         if num[i]=0 then
                if dfs(i,true) then begin ok:=false;break;end;
        if ok then begin writeln(g,-1);exit end;
        dd1[luu[l],luu[l-1]]:=true;
        for i:=l downto 2 do
               if (a[luu[i],luu[i-1]]=1)and(dd1[luu[i],luu[i-1]]) then
                begin
                        inc(id);
                        dd[luu[i],luu[i-1]]:=false;
                        ok:=true;
                        for j:=1 to n do
                        if num[j]<id then
                         if DFS(j,false) then
                          begin
                                ok:=false;
                                break;
                          end ;
                         if ok then
                          begin
                                inc(kq);
                                lkq[kq].x:=luu[i];
                                lkq[kq].y:=luu[i-1];
                          end;
                          dd[luu[i],luu[i-1]]:=true;
                end;
         if a[luu[1],luu[l]]=1 then
                begin
                        inc(id);
                        dd[luu[1],luu[l]]:=false;
                        ok:=true;
                        for j:=1 to n do
                        if num[j]<id then
                         if dfs(j,false) then
                          begin
                                ok:=false;
                                break;
                          end;
                         if ok then
                          begin
                                inc(kq);
                                lkq[kq].x:=luu[1];
                                lkq[kq].y:=luu[l];
                          end;
                          dd[luu[1],luu[l]]:=true;
                end;
         if kq=0 then writeln(g,-1)
         else
         begin
         writeln(g,kq);
         for i:=1 to kq do
          writeln(g,lkq[i].x,' ',lkq[i].y);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
