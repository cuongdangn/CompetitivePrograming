uses    math;
const   finp    =       'REFORM.INP';
        fout    =       'REFORM.OUT';
        maxn    =       100010;
        maxm    =       200010;
type    node    =       ^re;
        re      =       record
        u,i     :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        e       :       array[1..maxm] of bg;
        cau,dd      :       array[1..maxm] of boolean;
        n,m     :       longint;
        sl,dem      :       longint;
        kq      :       int64;
        sll     :       array[1..3] of int64;
        low,num,con,cha,ca :       array[1..maxn] of longint;
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
        close(g);
        close(f);
end;
procedure       nap(var ke:node;u,i:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.i:=i;
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
                e[i].x:=u;
                e[i].y:=v;
                nap(ke[u],v,i);
                nap(ke[v],u,i);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        p:=ke[u];
        inc(dem);
        low[u]:=maxlongint;
        num[u]:=dem;
        while p<>nil do
         begin
                if dd[p^.i] then
                 begin
                        dd[p^.i]:=false;
                        if num[p^.u]<>0 then low[u]:=min(low[u],num[p^.u])
                        else
                         begin
                                cha[p^.u]:=u;
                                ca[p^.u]:=p^.i;
                                dfs(p^.u);
                                con[u]:=con[u]+con[p^.u];
                                low[u]:=min(low[u],low[p^.u]);
                         end;
                 end;
                 p:=p^.next;
         end;
         inc(con[u]);
end;
procedure       init;
var     i,j     :       longint;
begin
         for i:=1 to m do begin dd[i]:=true;cau[i]:=false; end;
         dem:=0;
         for i:=1 to n do
          if num[i]=0 then
              begin
                inc(sl);
                j:=dem;
                cha[i]:=-1;
                dfs(i);
                sll[sl]:=dem-j;
                if sl>=3 then break;
              end;
end;
procedure       xuly;
var     i,j,u,v     :       longint;
begin
        init;
        if sl>=3 then begin writeln(g,0);exit end;
        for i:=1 to n do
         begin
          u:=cha[i];
          if (u<>-1)and(low[i]>=num[i]) then cau[ca[i]]:=true;
         end;
        //////////////////
        for i:=1 to m do
         begin
                if not cau[i] then
                 begin
                  if sl=1 then kq:=kq+(int64(n)*int64(n-1)) div 2-int64(m);
                  if sl=2 then kq:=kq+sll[1]*sll[2];
                 end
                else
                 begin
                        if cha[e[i].x]=e[i].y then begin u:=e[i].y;v:=e[i].x end
                        else begin u:=e[i].x;v:=e[i].y end;
                        if sl=1 then kq:=kq+int64(con[v])*int64((n-con[v]))-1;
                 end;
         end;
         writeln(g,kq);
end;


begin
        mo;
        doc;
        xuly;
        dong;
end.
