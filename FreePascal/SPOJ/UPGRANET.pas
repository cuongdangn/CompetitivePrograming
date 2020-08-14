uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       100010;
type    bg      =       record
        w,x,y     :       longint;
        end;
        node    =       ^re;
        re      =       record
        u,w     :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n,m,m1  :       longint;
        ke      :       array[1..maxn] of node;
        goc,dep :       array[1..maxn] of longint;
        cha,minc:       array[0..maxn,0..18] of longint;
        e       :       array[1..maxn]  of bg;
        dd,dd1  :       array[1..maxn]  of boolean;
        luu     :       longint;
        kq      :       int64;
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
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
          readln(f,e[i].x,e[i].y,e[i].w);
end;
procedure       QS(l,h:longint);
var     i,j,x   :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=e[random(h-l+1)+l].w;
        repeat
                while e[i].w>x do inc(i);
                while e[j].w<x do dec(j);
                if i<=j then
                 begin
                        tg:=e[i];
                        e[i]:=e[j];
                        e[j]:=tg;
                        inc(i);dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function        find(a:longint):longint;
begin
        if goc[a]=-1 then exit(a);
        goc[a]:=find(goc[a]);
        exit(goc[a]);
end;
procedure       dungcay;
var     i,j,cha1,cha2     :       longint;
begin
        randomize;
        QS(1,m);
        for i:=1 to n do
         goc[i]:=-1;
        for i:=1 to m do
         begin
                cha1:=find(e[i].x);
                cha2:=find(e[i].y);
                if cha1<>cha2 then
                 begin
                        dd1[i]:=false;
                        goc[cha1]:=cha2;
                        nap(ke[e[i].x],e[i].y,e[i].w);
                        nap(ke[e[i].y],e[i].x,e[i].w);
                 end;
         end;
end;
procedure       dfs(v:longint);
var     p       :       node;
        u       :       longint;
begin
        dd[v]:=false;
        p:=ke[v];
        while p<> nil do
         begin
                u:=p^.u;
                if dd[u] then
                  begin
                        dep[u]:=dep[v]+1;
                        dfs(u);
                        cha[u][0]:=v;
                        minc[u,0]:=p^.w;
                  end;
                p:=p^.next;
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        dungcay;
        for i:=1 to n do dd[i]:=true;
        dfs(1);
        m1:=trunc(ln(n)/ln(2))+1;
        for i:=0 to m1 do
         cha[0,m1]:=maxlongint;
        for j:=1 to m1 do
          for i:=1 to n do
           begin
            cha[i][j]:=cha[cha[i][j-1],j-1];
            minc[i][j]:=min(minc[i,j-1],minc[cha[i,j-1],j-1]);
           end;
end;
procedure       nhay(var a:longint;l:longint);
var     i       :       longint;
begin
        for i:=m1 downto 0 do
         if l>=1 shl i then
         begin
                luu:=min(luu,minc[a,i]);
                a:=cha[a,i];
                l:=l-1shl i;
         end;
end;

procedure       lca(a,b:longint);
var     i       :       longint;
begin
        if dep[a]>dep[b] then nhay(a,dep[a]-dep[b])
        else nhay(b,dep[b]-dep[a]);
        if a=b then exit;
        for i:=m1 downto 0 do
         if cha[a,i]<>cha[b,i] then
          begin
                luu:=min(luu,minc[a,i]);
                luu:=min(luu,minc[b,i]);
                a:=cha[a,i];
                b:=cha[b,i];
          end;
         luu:=min(luu,minc[a,0]);
         luu:=min(luu,minc[b,0]);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to m do dd1[i]:=true;
        init;
        for i:=1 to m do
         begin
                if dd1[i] then
                 begin
                  luu:=maxlongint;
                  lca(e[i].x,e[i].y);
                  kq:=kq+int64(luu)-int64(e[i].w);
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