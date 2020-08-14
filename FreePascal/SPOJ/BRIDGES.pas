uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        v  :       longint;
        next    :       node;
        end;
        re1     =       record
        x,y     :       longint;
        gt,w   :       int64;
        cs   :       longint;
        end;
var     g,f     :       text;
        ke      :       array[0..100000] of node;
        n,k,vc,vp     :       longint;
        d       :     array[0..100001] of int64;
        t       :  array[0..100001] of re1;
        dd      :  array[0..100001] of byte;
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
procedure       nap(var ke:node;v:longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,a,b,w       :       longint;
begin
        readln(f,n,k,vp,vc);
        for i:=1 to n do ke[i]:=nil;
        for i:=1 to n-1 do
                begin
                        readln(f,a,b,w);
                        t[i].cs:=i;
                        t[i].w:=w;
                        t[i].x:=a;
                        t[i].y:=b;
                        nap(ke[a],b);
                        nap(ke[b],a);
                end;
end;
procedure       DFS(u:longint);
var     p:node;
        v,cs:longint;
        w:int64;
begin
        dd[u]:=1;
        p:=ke[u];
        d[u]:=1;
        while p<> nil do
                begin
                       v:=p^.v;
                       if dd[v]=0 then
                                begin
                                        dfs(v);
                                        d[u]:=d[u]+d[v];
                                end;
                        p:=p^.next;
                end;
end;
procedure       QS(l,h:longint);
var     i,j    :       longint;
        tg      : re1;
        x       : real;
begin
        i:=l;
        j:=h;
        x:=t[(l+h) div 2].gt;
        repeat
                while t[i].gt<x do inc(i);
                while t[j].gt>x do dec(j);
                if i<=j then
                        begin
                                if i<j then
                                begin
                                tg:=t[i];
                                t[i]:=t[j];
                                t[j]:=tg;
                                end;
                                inc(i);
                                dec(j);
                        end;
        until     i>j;
     if i<h then QS(i,h);
     if j>l then QS(l,j);
end;
procedure       xuly;
var     i       :longint;
        w:      int64;
begin
        for i:=1 to n do dd[i]:=0;
        dfs(2);
        for i:=1 to n-1 do t[i].cs:=i;
        for i:=1 to n-1 do
                begin
                      w:=min(d[t[i].x],d[t[i].y]);
                      t[i].gt:=w*(n-w)*t[i].w;
                end;
        QS(1,n-1);


        if vp>vc then
              for i:=1 to k do write(g,t[i].cs,' ')
        else
              for i:=n-k to n-1 do write(g,t[i].cs,' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
