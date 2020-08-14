uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        maxn    =       100000;
        maxm    =       200000;
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
        re1     =       record
        x,y     :longint;
        end;
var     g,f     :       text;
        st,loai,low,num,sl,tru    :       array[1..maxn] of longint;
        slt,dem,n,m,dau :       longint;
        ke      :       array[1..maxn] of node;
        e       :array[1..maxm] of re1;
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
procedure   nap(var    ke:node;u:longint);
var     p   :   node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i       :longint;
begin
        readln(f,n,m);
        for i:=1 to m do
        begin
                readln(f,e[i].x,e[i].y);
                nap(ke[e[i].x],e[i].y);
        end;
end;
procedure       push(u:longint);
begin
        inc(dau);
        st[dau]:=u;
end;
procedure       DFS(v:longint);
var     p       :       node;
        u       :       longint;
begin
        inc(dem);
        num[v]:=dem;
        low[v]:=maxlongint;
        p:=ke[v];
        push(v);
        while p<>nil do
                begin
                    u:=p^.u;
                    if (loai[u]=0) then
                     begin
                     if num[u]=0 then
                        begin
                                DFS(u);
                                low[v]:=min(low[v],low[u]);
                        end
                     else low[v]:=min(low[v],num[u]);
                     end;
                    p:=p^.next;
                end;
        if low[v]>=num[v] then
                begin
                        inc(slt);
                        inc(sl[slt]);
                        u:=st[dau];
                        dec(dau);
                        loai[u]:=slt;
                        while u<>v do
                                begin
                                        u:=st[dau];
                                        dec(dau);
                                        loai[u]:=slt;
                                        inc(sl[slt]);
                                end;
                end;
end;
procedure       xuly;
var     i,kq       :       longint;
begin
        kq:=0;
        for i:=1 to n do
         if loai[i]=0 then
                        DFS(i);
         for i:=1 to m do
                      if loai[e[i].x]=loai[e[i].y] then inc(tru[loai[e[i].x]]);
         for i:=1 to slt do
                       kq:=kq+sl[i]*(sl[i]-1)-tru[i];
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

