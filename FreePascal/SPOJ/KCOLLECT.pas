uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        a       :       array[1..111,1..111] of char;
        n,m,dem     :       longint;
        n1,n2   :       longint;
        ke,ke1  :       array[1..11111] of node;
        low,num,b :       array[1..11111] of longint;
        st,mau  :       array[1..11111] of longint;
        top,kq     :       longint;
        d,nhan,nhan1:     array[1..10010] of longint;
         cs     :       array[1..111,1..111] of longint;
         dd     :       array[1..10010] of boolean;
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
procedure       doc;
var     i,j     :longint;
begin
        readln(f,m,n);
        for i:=1 to m do
         begin
          for j:=1 to n do read(f,a[i,j]);
          readln(f);
         end;
end;
function        check(a,b:longint):boolean;
begin
        exit((a>0)and(b>0)and(a<=m)and(b<=n));
end;
procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          if a[i,j]<>'#' then
          begin
           inc(n1);
           cs[i,j]:=n1;
          end;
        for i:=1 to m do
         for j:=1 to n do
          if a[i,j]<>'#' then
          begin
           if check(i,j+1)and(a[i,j+1]<>'#') then
             nap(ke[cs[i,j]],cs[i,j+1]);
           if check(i+1,j)and(a[i+1,j]<>'#') then
             nap(ke[cs[i,j]],cs[i+1,j]);
           if (a[i,j]='W')and check(i,j-1)and(a[i,j-1]<>'#') then nap(ke[cs[i,j]],cs[i,j-1]);
           if (a[i,j]='N')and check(i-1,j)and(a[i-1,j]<>'#') then nap(ke[cs[i,j]],cs[i-1,j]);
             if (a[i,j]<>'W')and(a[i,j]<>'N') then nhan[cs[i,j]]:=ord(a[i,j])-48;
           end;
          n:=n1;
end;
procedure       dfs(u:longint);
var     p       :       node;
        v       :       longint;
begin
        inc(dem);
        num[u]:=dem;
        low[u]:=n+1;
        p:=ke[u];
        inc(top);
        st[top]:=u;
        while p<>nil do
         begin
                v:=p^.u;
                if dd[v] then
                 begin
                    if num[v]>0 then low[u]:=min(low[u],num[v])
                    else
                      begin
                        dfs(v);
                        low[u]:=min(low[u],low[v]);
                      end;
                 end;
                 p:=p^.next;
         end;
         ///////
         if low[u]>=num[u] then
          begin
                inc(n2);
                while st[top]<>u do
                 begin
                   mau[st[top]]:=n2;
                   dd[st[top]]:=false;
                   nhan1[n2]:=nhan1[n2]+nhan[st[top]];
                   dec(top);
                 end;
                 mau[u]:=n2;
                 dd[u]:=false;
                 nhan1[n2]:=nhan1[n2]+nhan[u];
                 dec(top);
          end;
end;
procedure       dfs1(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke1[u];
        while p<>nil do
         begin
            if dd[p^.u] then
             dfs(p^.u);
            p:=p^.next;
         end;
         b[m]:=u;
         dec(m);
end;
procedure             xuly;
var     i,j           : longint;
        p       :     node;
begin
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         if num[i]=0 then
             dfs(i);
         /////////////////////////

        for i:=1 to n do
         begin
          p:=ke[i];
          while p<>nil do
           begin
             if mau[p^.u]<>mau[i] then
              nap(ke1[mau[i]],mau[p^.u]);
              p:=p^.next;
           end;
         end;
         m:=n2;
         fillchar(dd,sizeof(dd),true);
         for i:=1 to n2 do
          if dd[i] then dfs1(i);
         for i:=1 to n2 do
          if b[i]=mau[1] then break;
          d[b[i]]:=nhan1[b[i]];
          kq:=nhan1[b[i]];
          for j:=i to n2 do
           begin
            p:=ke1[b[j]];
            while p<>nil do
             begin
              d[p^.u]:=max(d[b[j]]+nhan1[p^.u],d[p^.u]);
              kq:=max(kq,d[p^.u]);
              p:=p^.next;
             end;
            end;
           writeln(g,kq);
end;

begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
