const   finp    =       '';
        fout    =       '';
        maxn    =       30001;
        maxm    =       100001;
        maxw    =       1005;
        maxd    =       maxlongint;

type    node    =       ^re;
        re      =       record
        v,w     :longint;
        next    :node;
        end;
        arr     =       array[0..maxn] of longint;

var     g,f     :       text;
        ke      :array[0..maxn] of node;
        n,m,nheap,s,t,sl     :       longint;
        d,d1,f1,f2    :array[0..maxn] of longint;
        pos,heap,res    :       array[0..maxn] of longint;

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
procedure       nap(var ke:node;v,w:longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,v,w,u :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
                begin
                        readln(f,u,v,w);
                        nap(ke[u],v,w);
                        nap(ke[v],u,w);
                end;
end;
function        downh(var d:arr):longint;
var     c,p,v     :       longint;
begin
        downh:=heap[1];
        v:=heap[nheap];
        dec(nheap);
        p:=1;
        repeat
                c:=p*2;
                if (c<nheap)and(d[heap[c]]>d[heap[c+1]]) then inc(c);
                if (c>nheap)or(d[heap[c]]>d[v]) then break;
                heap[p]:=heap[c];
                pos[heap[p]]:=p;
                p:=c;
        until   false;
        heap[p]:=v;
        pos[v]:=p;
end;
procedure       up(u:longint;var d:arr);
var     c,p     :longint;
begin
        c:=pos[u];
        if c=0 then
               begin
                inc(nheap);
                c:=nheap;
               end;
        repeat
                p:= c div 2;
                if (p=0)or(d[heap[p]]<=d[u]) then break;
                heap[c]:=heap[p];
                pos[heap[c]]:=c;
                c:=p;
        until   false;
        heap[c]:=u;
        pos[u]:=c;
end;

procedure        ktao(var d:arr);
var     i        :      longint;
begin
        for i:=1 to n do
         begin
         d[i]:=maxlongint;
         pos[i]:=0;
        end;
         d[s]:=0;
        nheap:=1;
        heap[1]:=s;
        pos[s]:=1;
end;
procedure       dj(var d,f1:arr);
var     u,v       :longint;
        p       :       node;
begin
        repeat
                u:=downh(d);
                if (u=0) or (u=t) then break;
                p:=ke[u];
                while p<> nil do
                        begin
                                v:=p^.v;
                                if d[v]>d[u]+p^.w then
                                        begin
                                                f1[v]:=f1[u];
                                                d[v]:=d[u]+p^.w;
                                                up(v,d);
                                        end
                                else if d[v]=d[u]+p^.w then f1[v]:=f1[u]+f1[v];
                                p:=p^.next;
                        end;
        until          nheap=0;
end;
procedure       xuly;
var      i:longint;
begin
        s:=1;
        t:=n;
        f1[1]:=1;
        f2[n]:=1;
        ktao(d);
        dj(d,f1);
        s:=n;
        t:=1;
          ktao(d1);
        dj(d1,f2);
        for i:=1 to n do
         if (d[i]+d1[i]<>d[n])or(f1[i]*f2[i]<>f1[n]) then
         begin
                inc(sl);
                res[sl]:=i;
         end;

         writeln(g,sl);
         for i:=1 to sl do writeln(g,res[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
