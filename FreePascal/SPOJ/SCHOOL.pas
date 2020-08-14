uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       5000;
        maxm    =       20000;
        maxw    =       32008;
        maxd    =       maxw*maxm+1000;

type    node    =       ^re;
        re      =       record
        v,w       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        tham    :       array[1..maxn] of boolean;
        ke      :       array[1..maxn] of node;
        n,m,nh,s,t  :       longint;
        heap,pos    :       array[1..maxn] of longint;
        d,fx    :       array[1..maxn] of int64;

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
var     i,u,v,w,k       :       longint;
begin
        readln(f,n,m);
        s:=1;
        t:=n;
        for i:=1 to m do
        begin
                readln(f,k,u,v,w);
                nap(ke[u],v,w);
                if k=2 then nap(ke[v],u,w);
        end;
end;
procedure       ktao;
var     i:longint;
begin
        fillchar(tham,sizeof(tham),false);
        for i:=1 to n do d[i]:=maxd;
        d[s]:=0;
        pos[s]:=1;
        nh:=1;
        heap[1]:=s;
        fx[1]:=1;
end;
function        downh:longint;
var     p,c,v   :       longint;
begin
        downh:=heap[1];
        v:=heap[nh];
        dec(nh);
        p:=1;
        repeat
             c:=p*2;
             if (c<nh)and(d[heap[c]]>d[heap[c+1]]) then inc(c);
             if (c>nh)or(d[v]<=d[heap[c]]) then break;
             heap[p]:=heap[c];
             pos[heap[p]]:=p;
             p:=c;
        until   false;
        heap[p]:=v;
        pos[v]:=p;
end;
procedure       upheap(v:longint);
var     c,p     :longint;
begin
        c:=pos[v];
        if c=0 then
                begin
                        inc(nh);
                        c:=nh;
                end;
        repeat
                p:=c div 2;
                if (p=0)or(d[heap[p]]<=d[v]) then break;
                heap[c]:=heap[p];
                pos[heap[c]]:=c;
                c:=p;
        until   false;
        heap[c]:=v;
        pos[v]:=c;
end;
procedure       dj;
var     u,i     :       longint;
        p:      node;
begin
        ktao;
        repeat
                u:=downh;
                if (u=0) or (u=t) then break;
                p:=ke[u];
                while p<> nil do
                        begin
                                i:=p^.v;
                                if d[i]>d[u]+p^.w then
                                        begin
                                                d[i]:=d[u]+p^.w;
                                                fx[i]:=fx[u];
                                                upheap(i);
                                        end
                                        else if d[i]=d[u]+p^.w then fx[i]:=fx[i]+fx[u];
                                p:=p^.next;
                        end;
        until           nh=0;
        if d[t]=maxd then write(g,0,' ',0) else
        writeln(g,d[t],' ',fx[n])
end;
begin
        mo;
        doc;
        dj;
        dong;
end.