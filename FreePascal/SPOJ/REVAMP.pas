const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
        maxm    =       50000;
type    note    =       ^re;
        re      =       record
        u,w     :       longint;
        next    :       note;
        end;
          theap   =       record
         item:  array[1..maxn] of integer;
         nitem: integer;
         pos    :       array[1..maxn] of integer;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of note;
        n,m,k   :       longint;
        heap    :       theap;
procedure       mo;
begin
        assign(g,fout);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure nap(var ke:node; v,w:longint);
var p:node;
begin
        new(p);
        p^.v:=v;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,j,t,q       :longint;
begin
        readln(f,n,m,k);
        for i:=1 to m do
                begin
                        readln(f,j,t,q);
                        nap(ke[j],t,q);
                        nap(ke[t],j,q);
                end;
end;
procedure       kt;
var     v:integer;
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
function        ex      :       integer;
var     p,c,v   :       integer;
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
procedure       update(v:integer);
var     p,c     :       integer;
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
function        relex(u,v,w     :       integer):boolean;
begin
        relex:=d[v]>(d[u]+w);
        if relex then
                        d[v]:=d[u]+w;
end;
procedure       dj;
var     u,i:integer;
begin
        repeat
                u:=ex;
                if (u=0) or (u=t) then break;
                i:=head[u];
                while i<>0 do
                        begin
                                if relex(u,adj[i].v,adj[i].w) then
                                        update(adj[i].v);
                                i:=adj[i].link;
                        end;
        until heap.nitem=0;
