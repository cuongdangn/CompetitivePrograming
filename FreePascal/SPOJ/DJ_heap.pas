const   finp    =       'Djheap.inp';
        fout    =       '';
        maxn    =       100000;
        maxx    =       100000000;
type    node    =       ^re;
        re      =       record
        u,w     :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n,m     :       longint;
        heap    :       array[1..maxn] of longint;
        pos     :       array[1..maxn] of longint;
        ke      :       array[1..maxn] of node;
        d       :       array[1..maxn] of longint;
        nh      :       longint;
        s,t     :       longint;
procedure       mo;
begin
        Assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       nap(var ke:node;u,w:    longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v,w     :       longint;
begin
        readln(f,n,m,s,t);
        for i:=1 to m do
         begin
                readln(f,u,v,w);
                nap(ke[u],v,w);
                nap(ke[v],u,w);
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do d[i]:=maxx;
        d[s]:=0;
        heap[1]:=s;
        nh:=1;
end;
function        down:longint;
var     c,p,x     :       longint;
begin
        down:=heap[1];
        p:=1;
        x:=heap[nh];
        dec(nh);
        repeat
                c:=p*2;
                if (c<nh)and(d[heap[c]]>d[heap[c+1]]) then inc(c);
                if (c>nh)or(d[heap[c]]>=d[x]) then break;
                heap[p]:=heap[c];
                pos[heap[p]]:=p;
                p:=c;
        until   false;
        heap[p]:=x;
        pos[x]:=p;
end;
procedure       up(x:longint);
var     p,c:    longint;
begin
        c:=pos[x];
        if c=0 then
         begin
                inc(nh);
                c:=nh;
         end;
         repeat
                p:=c div 2;
                if (p=0)or(d[heap[p]]<=d[x]) then break;
                heap[c]:=heap[p];
                pos[heap[c]]:=c;
                c:=p;
         until  false;
         heap[c]:=x;
         pos[x]:=c;
end;

procedure       dj;
var     i,u       :       longint;
        p       : node;
begin
        init;
        repeat
                u:=down;
                if u=t then break;
                p:=ke[u];
                while p<>nil do
                 begin
                        if d[p^.u]>d[u]+p^.w then
                         begin
                                d[p^.u]:=d[u]+p^.w;
                                up(p^.u);
                         end;
                         p:=p^.next;
                 end;
        until    nh     =       0;
        if d[t]=maxx then writeln(g,'ko co duong di')
        else writeln(g,d[t]);
end;
begin
        mo;
        doc;
        dj;
        dong;
end.