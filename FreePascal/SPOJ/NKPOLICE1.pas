uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       100001;
        maxm    =       500001;
type    node    =       ^re;
        re      =       record
        u,c     :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        dd      :       array[1..maxm] of boolean;
        n,m,dem     :       longint;
        bd,kt,low,tr,sau,dep  :       array[0..maxn] of longint;
        luu     :       array[1..2*maxn+9] of longint;
        e       :       array[1..maxm] of bg;
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
procedure       nap(var ke:node;i,u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.c:=i;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
             readln(f,e[i].x,e[i].y);
             nap(ke[e[i].x],i,e[i].y);
             nap(ke[e[i].y],i,e[i].x);
         end;
end;
procedure       swap(var a,b:longint);
var     tg      :       longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
function        thuoc(a,b:longint):boolean;
begin
        exit((tr[a]>=tr[b])and(sau[a]<=sau[b]));
end;
procedure       dfs(v:longint);
var     i,j,u     :       longint;
        p       : node;
begin
        inc(dem);
        tr[v]:=dem;
        p:=ke[v];
        low[v]:=maxlongint;
        while p<>nil do
         begin
          if dd[p^.c] then
           begin
            dd[p^.c]:=false;
            u:=p^.u;
            if tr[u]>0 then low[v]:=min(low[v],tr[u])
            else
             begin
              dep[u]:=dep[v]+1;
              dfs(u);
              low[v]:=min(low[v],low[u]);
             end;
            end;
           p:=p^.next;
         end;
         inc(dem);
         sau[v]:=dem;
end;
function        timcha(a,c:longint):longint;
var     dau,giua,cuoi,lu,u        :       longint;
begin
        dau:=bd[c];
        cuoi:=kt[c];
        timcha:=0;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) div 2;
          u:=luu[giua];
          if thuoc(a,u) then exit(u)
          else if tr[a]>sau[u] then dau:=giua+1
          else cuoi:=giua-1;
         end;
end;
procedure       truyvan1;
var     a,b,c,d   :       longint;
        ok1,ok2   :       boolean;
begin
        read(f,a,b,c,d);
        if thuoc(c,d) then swap(c,d);
        if (dep[d]-dep[c]>1) then writeln(g,'yes')
        else  if ((low[d]<tr[d])) then writeln(g,'yes')
        else
         begin
          ok1:=thuoc(a,d);
          ok2:=thuoc(b,d);
          if (ok1=ok2) then writeln(g,'yes')
          else writeln(g,'no');
         end;
end;
procedure       truyvan2;
var     a,b,c,e,f1   :       longint;
begin
        read(f,a,b,c);
        if (not thuoc(a,c)) and (not thuoc(b,c)) then writeln(g,'yes')
        else
         if thuoc(a,c) and thuoc(b,c) then
          begin
            e:=timcha(a,c);
            f1:=timcha(b,c);
            if e=f1 then writeln(g,'yes')
            else if (low[e]<tr[c])and(low[f1]<tr[c]) then writeln(g,'yes')
            else writeln(g,'no');
          end
         else
          begin
            if thuoc(a,c) then swap(a,b);
            e:=timcha(b,c);
            if low[e]<tr[c] then writeln(g,'yes')
            else writeln(g,'no');
          end;
end;
procedure       xuly;
var     i,q,l     :       longint;
        p       : node;
begin
        fillchar(dd,sizeof(dd),true);
        dfs(1);
        bd[0]:=0;
        kt[0]:=0;
        for i:=1 to n do
         begin
          bd[i]:=kt[i-1]+1;
          kt[i]:=kt[i-1];
          p:=ke[i];
          while p<>nil do
           begin
            if dep[p^.u]=dep[i]+1 then
             begin
              inc(kt[i]);
              luu[kt[i]]:=p^.u;
             end;
             p:=p^.next;
           end;
         end;
        readln(f,q);
        for i:=1 to q do
         begin
           read(f,l);
           if l=1 then truyvan1
           else truyvan2;
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
