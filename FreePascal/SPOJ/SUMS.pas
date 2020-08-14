const   finp    =       'SUMSET.INP';
        fout    =       'SUMSET.OUT';
        maxn    =       10001;
        maxw    =       10001;
        maxd    =       maxlongint;
type    node    =       ^re;
        re=     record
        v,w     :longint;
        next:node;
        end;
var     g,f     :       text;
        ke      :array[0..maxn] of node;
        n,nh       :       longint;
        heap,a,dd,d,pos       :array[0..1001] of longint;

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
var     i,a,j       :   longint;
begin
        readln(f,n);
        for i:=1 to n do
                    read(f,a[i]);
end;
procedure       QS(l,h:longint);
var     i,j,x,tg       :longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until  i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       taodothi;
var     i,b,du,j       :       longint;
begin
        QS(1,n);
        b:=a[1];
        for i:=2 to n do
                begin
                    du:=a[i] mod b+1;
                    if dd[du]=0 then
                        begin
                                dd[du]:=1;
                                j:=0;
                                while du<=b do
                                        begin
                                                nap(ke[j],du,a[i]);
                                                nap(ke[du],j,a[i]);
                                                inc(du);
                                                inc(j);
                                        end;
                        end;
                end;
        n:=a[1];
end;
procedure       ktao;
var     i       :       longint;
begin
        for i:=0 to n do
        begin
                d[i]:=maxd;
                pos[i]:=0;
        end;
        d[1]:=0;
        nh:=1;
        heap[1]:=1;
end;
procedure       dheap:longint;
var     v,p,c     :       longint;
begin
        dheap:=heap[1];
        v:=heap[nh];
        dec(nh);
        p:=1;
         repeat
                c:=p*2;
                if (c<nh)and(d[heap[c]]>d[heap[c+1]]) then inc(c);
                if (c>nh)or(d[heap[c]]>d[v]) then break;
                heap[p]:=heap[c];
                pos[heap[p]]:=p;
                p:=c;
         until  false;
         heap[p]:=v;
         pos[v]:=p;
end;
procedure       up(u:longint);
var     c,p:longint;
begin
        c:=pos[u];
        if c=0 then
                begin
                        inc(nh);
                        c:=nh;
                end;
        repeat
                p:=c div 2;
                if (p=0)or(d[heap[p]]<=d[u]) then break;
                heap[c]:=heap[p];
                pos[heap[c]]:=c;
                c:=p;
        until   false;
        heap[c]:=u;
        pos[u]:=c;
end;
procedure       dj;
var     u,v:longint;
        p       :       node;
begin
        repeat
                u:=dheap;
                if (u=0)or(