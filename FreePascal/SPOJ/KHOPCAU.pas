uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
        maxm    =       50000;
type    node    =       ^re;
        re      =       record
        u,c     :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        con,cha,low,num:    array[1..maxn] of longint;
        dd,tham :       array[1..maxm] of boolean;
        n,m,dem,kq1,kq2     :       longint;
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
var     i,j,u,v     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                nap(ke[u],v,i);
                nap(ke[v],u,i);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        inc(dem);
        num[u]:=dem;
        low[u]:=maxn;
        p:=ke[u];
        while p<>nil do
         begin
                if tham[p^.c] then
                 begin
                        tham[p^.c]:=false;
                        if num[p^.u]>0 then
                         low[u]:=min(low[u],num[p^.u])
                         else
                          begin
                                cha[p^.u]:=u;
                                dfs(p^.u);
                                low[u]:=min(low[u],low[p^.u]);
                          end;
                 end;
                 p:=p^.next;
         end;
end;
procedure       xuly;
var     i,j,u     :       longint;
begin
        fillchar(tham,sizeof(tham),true);
        for i:=1 to n do
         if num[i]=0 then
          begin
                dfs(i);
                cha[i]:=-1;
          end;
          for i:=1 to n do
           if cha[i]<>-1 then
                if low[i]>=num[i] then inc(kq2);
           //////////////
           fillchar(dd,sizeof(dd),false);
           for i:=1 to n do
            begin
              u:=cha[i];
              if (u<>-1)and(cha[u]<>-1) then
               if low[i]>=num[u] then dd[u]:=true;
            end;
           for i:=1 to n do
            begin
             u:=cha[i];
             if u>0 then inc(con[u]);
            end;
            for i:=1 to n do
             if (con[i]>1)and(cha[i]=-1) then dd[i]:=true;
            for i:=1 to n do
             if dd[i] then inc(kq1);
             writeln(g,kq1,' ',kq2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.