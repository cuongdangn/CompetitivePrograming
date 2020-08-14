const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        w       :       extended;
        end;
var     g,f     :       text;
        n,m     :       longint;
        kq,kq1  :       longint;
        ke      :       array[1..100001] of node;
        dd      :       array[1..100001] of boolean;
        cha     :       array[1..100001] of longint;
        con     :array[1..100001] of int64;
        e       :       array[1..100001] of bg;
        s,tb       :       extended;
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
          readln(f,e[i].x,e[i].y,e[i].w);
          nap(ke[e[i].x],e[i].y);
          nap(ke[e[i].y],e[i].x);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;

begin
        dd[u]:=false;
        p:=ke[u];
        while p<> nil do
         begin
                if dd[p^.u] then
                 begin
                        cha[p^.u]:=u;
                        dfs(p^.u);
                        con[u]:=con[u]+con[p^.u];
                 end;
                 p:=p^.next;
         end;
         inc(con[u]);
end;
procedure       xuly;
var     i,j,u,q,t     :       longint;
        w       :     int64;
begin
        fillchar(dd,sizeof(dd),true);
        dfs(1);
        for i:=1 to n-1 do
        begin
                if cha[e[i].x]=e[i].y then u:=e[i].x
                else u:=e[i].y;
                if con[u]>1 then s:=s+6*(con[u]*(con[u]-1)*(n-con[u]))*e[i].w;
                if n-con[u]>1 then s:=s+6*(n-con[u])*(n-con[u]-1)*con[u]*e[i].w;
        end;
        readln(f,q);
        tb:=n;
        tb:=tb*(tb-1)*(tb-2);
        for t:=1 to q do
         begin
                readln(f,i,w);
                if cha[e[i].x]=e[i].y then u:=e[i].x
                else u:=e[i].y;
                if con[u]>1 then s:=s-6*(con[u]*(con[u]-1)*(n-con[u]))*e[i].w;
                if n-con[u]>1 then s:=s-6*(n-con[u])*(n-con[u]-1)*con[u]*e[i].w;
                e[i].w:=w;
                if cha[e[i].x]=e[i].y then u:=e[i].x
                else u:=e[i].y;
                if con[u]>1 then s:=s+6*(con[u]*(con[u]-1)*(n-con[u]))*e[i].w;
                if n-con[u]>1 then s:=s+6*(n-con[u])*(n-con[u]-1)*con[u]*e[i].w;
                writeln(g,s/tb:0:6);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
