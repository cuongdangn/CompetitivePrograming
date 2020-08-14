const   finp    =       '';
        maxn    =       222222;
        maxm    =       44441;
        maxw    =       1000;
        maxd    =       maxm*maxw*100;
type
        tadj     =       record
        v       :       longint;
        w       :       longint;
        link    :       longint;
        end;
        theap   =       record
         item:  array[0..maxn] of longint;
         nitem: integer;
         pos    :       array[0..maxn] of longint;
        end;
var
        f       :       text;
        adj     :       array[0..maxm] of tadj;
        head    :       array[0..maxn] of longint;
        d       :       array[0..maxn] of longint;
        n,m,s,t :       longint;
        heap    :       theap;
procedure       doc;
var     i,j,u,v,p,w,sc     :longint;
begin
        assign(f,finp);
        reset(f);
        readln(f,m,n);
        fillchar(head[1],n*sizeof(head[1]),0);
        p:=0;
        sc:=0;
        for i:=1 to 2*m do
                begin
                       IF i mod 2 = 1 then
                       begin
                        for j:=1 to n do
                                begin
                                      read(f,w);
                                      u:=j+p;
                                      v:=p+j-n;
                                      if v<=0 then v:=0;
                                        inc(sc);
                                        adj[sc].v:=v;
                                        adj[sc].w:=w;
                                        adj[sc].link:=head[u];
                                        head[u]:=sc;
                                        inc(sc);
                                        adj[sc].v:=u;
                                        adj[sc].w:=w;
                                        adj[sc].link:=head[v];
                                        head[v]:=sc
                               end
                        end
                        else
                        begin
                           for j:=1 to n-1 do
                                begin
                                        read(f,w);
                                        u:=j+p;
                                        v:=p+j+1;
                                        inc(sc);
                                        adj[sc].v:=v;
                                        adj[sc].w:=w;
                                        adj[sc].link:=head[u];
                                        head[u]:=sc;
                                        inc(sc);
                                        adj[sc].v:=u;
                                        adj[sc].w:=w;
                                        adj[sc].link:=head[v];
                                        head[v]:=sc;
                                end;
                           p:=p+n;
                        end;
                        readln(f);
                end;
        S:=0;
        T:=N*M;
        n:=n*m+1;
        m:=sc;
        close(f);
end;

procedure       kt;
var     v:longint;
begin
        for v:=1 to n do d[v]:=maxd;
        d[s]:=0;
        with heap do
                begin
                        fillchar(pos[1],sizeof(pos[1])*n,0);
                        item[1]:=s;
                        pos[s]:=1;
                        nitem:=1;
                end;
end;
function        ex      :       longint;
var     p,c,v   :       longint;
begin
        with heap do
                begin
                        ex:=item[1];
                        v:=item[nitem];
                        dec(nitem);
                        p:=1;
                        repeat
                                c:=p*2;
                                if (c<nitem)and(d[item[c+1]]<d[item[c]]) then inc(c);
                                if (c > nitem) or (d[v]<=d[item[c]]) then break;
                                item[p]:=item[c];
                                pos[item[p]]:=p;
                                p:=c;
                        until false;
                        item[p]:=v;
                        pos[v]:=p;
                end;
end;
procedure       update(v:longint);
var     p,c     :       longint;
begin
        with heap do
                begin
                        c:=pos[v];
                        if c=0 then
                                begin
                                        inc(nitem);
                                        c:=nitem;
                                end;
                        repeat
                                p:= c div 2;
                                if (p=0)or(d[item[p]]<=d[v]) then break;                                item[c]:=item[p];
                                item[c]:=item[p];
                                pos[item[c]]:=c;
                                c:=p;
                        until   false;
                        item[c]:=v;
                        pos[v]:=c;
                end;
end;
function        relex(u,v,w     :       longint):boolean;
begin
        relex:=d[v]>(d[u]+w);
        if relex then
                        d[v]:=d[u]+w;
end;
procedure       dj;
var     u,i:longint;
begin
        repeat
                u:=ex;
                if (u=t) then break;
                i:=head[u];
                while i<>0 do
                        begin
                                if relex(u,adj[i].v,adj[i].w) then
                                        update(adj[i].v);
                                i:=adj[i].link;
                        end;
        until heap.nitem=0;
        if d[t]=maxd then writeln(0)
        else write(d[t]);
end;
begin
        doc;
        kt;
        DJ;
end.


