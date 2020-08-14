const   finp    =       '';
        fout    =       '';
        maxn    =       200000;
type    node    =       ^re;
        re      =       record
        v,w     :       longint;
        next    :       node;
        end;

        canh    =       record
        x,y,w     :       longint;
        end;

        bg      =       record
        l       :       byte;
        gt,cs       :       longint;
        end;

        tv   =       record
        u,v  :       longint;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        e       :       array[1..maxn] of canh;
        n,m,dem,m1 :       longint;
        last,firs,l:       array[1..maxn] of longint;
        dd      :       array[1..maxn] of byte;
        a       :       array[1..2*maxn] of bg;
        truyvan :       array[1..maxn] of tv;
        bit1,bit2,h:       array[1..maxn] of longint;
        cha     :       array[0..maxn,0..21] of longint;
        lt2      :       array[0..21] of longint;
        res      :array[1..maxn] of longint;
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
procedure       nap(var ke:node;v,w     :       longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w:        longint;
        c:char;
begin
        readln(f,n,m);
        for i:=1 to n-1 do
         begin
                readln(f,u,v,w);
                e[i].x:=u;
                e[i].y:=v;
                e[i].w:=w;
                a[i].l:=1;
                a[i].cs:=i;
                a[i].gt:=w;
                nap(ke[u],v,w);
                nap(ke[v],u,w);
         end;
         for i:=1 to m do
          begin
                read(f,c);
                if c='P' then
                 begin
                      readln(f,truyvan[i].u,truyvan[i].v,a[i+n-1].gt);
                      a[i+n-1].l:=2;
                      a[i+n-1].cs:=i;
                 end
                 else
                  begin
                        readln(f,truyvan[i].u,a[i+n-1].gt);
                        a[i+n-1].l:=3;
                        a[i+n-1].cs:=i;
                  end;
          end;
end;
procedure       DFS(u:longint);
var     p:node;
begin
        dd[u]:=1;
        p:=ke[u];
        inc(dem);
        l[dem]:=u;
        firs[u]:=dem;
        while p<> nil do
         begin
                if dd[p^.v]=0 then
                 begin
                        cha[p^.v,0]:=u;
                         h[p^.v]:=h[u]+1;
                        DFS(p^.v);
                        last[p^.v]:=dem;
                 end;
                 p:=p^.next;
         end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,x1:longint;
        tg:bg;
begin
        i:=l;
        j:=h;

        x:=a[(l+h) div 2].gt;
        x1:=a[(l+h)div 2].l;
        repeat
                while (a[i].gt<x)or((a[i].gt=x)and(a[i].l<x1)) do inc(i);

                while (a[j].gt>x)or((a[j].gt=x)and(a[j].l> x1)) do dec(j);

                if i<=j then
                 begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,j:longint;
begin

        QS(1,n+m-1);
        DFS(1);
        last[1]:=dem;
         m1:=trunc(ln(n)/ln(2))+1;
  for i:=1 to m1 do
    for j:=1 to n do
        cha[j,i]:=cha[cha[j,i-1],i-1];
  lt2[0]:=1;
  for i:=1 to m1 do lt2[i]:=lt2[i-1]*2;
end;
procedure nhay(var v:longint;x:longint);
var i:longint;
begin
  for i:=m1 downto 0 do
    if x>=lt2[i] then
      begin
        v:=cha[v,i];
        x:=x-lt2[i];
      end;
end;
procedure        up1(i,x:longint);
begin
        while i<=n do
         begin
                bit1[i]:=bit1[i]+x;
                i:=i+i and (-i);
         end;
end;
procedure        up2(i,x:longint);
begin
        while i<=n do
         begin
                bit2[i]:=bit2[i]+x;
                i:=i+i and (-i);
         end;
end;
function lca(u,v:longint): longint;
var     i:longint;
begin
  if h[u]>h[v] then nhay(u,h[u]-h[v]) else nhay(v,h[v]-h[u]);
  if u=v then exit(u);
  for i:=m1 downto 0 do
    if cha[u,i]<>cha[v,i] then
      begin
        u:=cha[u,i];
        v:=cha[v,i];
      end;
  exit(cha[u,0]);
end;
function        get1(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
                tg:=tg+bit1[i];
                i:=i-i and (-i);
         end;
         exit(tg);
end;

function        get2(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
                tg:=tg+bit2[i];
                i:=i-i and (-i);
         end;
         exit(tg);
end;

procedure       xulyp(j:longint);
var     u,kq,v,t,x       :       longint;
begin
        u:=LCA(truyvan[j].u,truyvan[j].v);
        v:=get1(firs[truyvan[j].u]);
        t:=get1(firs[truyvan[j].v]);
        x:=get1(firs[u]);
        res[j]:=v+t-2*x;
end;
procedure       xulyt(j,t:longint);
var     u,v,i,kq:      longint;
begin
        i:=truyvan[j].u;
        if cha[e[i].y,0]=e[i].x then
                        kq:=get2(last[e[i].y])-get2(firs[e[i].y])
                        else kq:=t-(get2(last[e[i].x])-get2(firs[e[i].x]));
        res[j]:=kq;
end;
procedure       xuly;
var     i,con,t       :       longint;
begin
        t:=0;
        init;
        firs[1]:=1;

        for i:=1 to n-1+m do
         if a[i].l=1 then
         begin
               if cha[e[a[i].cs].x,0]=e[a[i].cs].y then con:=e[a[i].cs].x
               else con:=e[a[i].cs].y;
               up1(firs[con],1);
               up1(last[con]+1,-1);
               up2(firs[con],1);
               inc(t);
         end
         else
          begin
                if a[i].l=2 then xulyp(a[i].cs)
                else xulyt(a[i].cs,t);
          end;
          for i:=1 to m do
          writeln(g,res[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
