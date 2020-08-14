const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        v:      longint;
        next:node;
        end;
        arr     =       array[1..410] of longint;
var     g,f     :       text;
        ke      :       array[1..401] of node;
        n,nho   :       longint;
        dd,con,d     :       array[1..401] of longint;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       QS(l,h:longint;var a:arr);
var     i,j,tg,x        :       longint;
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
        until           i>j;
        if i<h then QS(i,h,a);
        if j>l then QS(l,j,a);
end;
procedure       nap(var ke:node;v:longint);
var     p       :node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,v,j,u,n1       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                    read(f,u,n1);
                    for j:=1 to n1 do
                        begin
                                read(f,v);
                                nap(ke[u],v);
                                nap(ke[v],u);
                        end;
                end;
end;
procedure       DFS(u:longint);
var     p       :       node;
        v,dau,i       :       longint;
        st      :   arr;
begin
        dd[u]:=1;
        p:=ke[u];
        dau:=0;
        while p<>nil do
                begin
                        v:=p^.v;
                        if dd[v]=0 then
                                begin
                                        DFS(v);
                                        con[u]:=con[u]+con[v];
                                        inc(dau);
                                        st[dau]:=con[v];
                                end;
                        p:=p^.next;
                end;
        if con[u]>0 then
        begin
        QS(1,dau,st);
        con[u]:=st[dau];
        v:=st[dau]-1;
        for i:=dau-1 downto 1 do
                begin
                    if v>=st[i] then dec(v)
                    else
                        begin
                                con[u]:=con[u]+st[i]-v;
                                v:=st[i]-1;
                        end;
                end
        end
        else con[u]:=con[u]+1;
end;
procedure       xuly;
begin
        DFS(1);
        writeln(g,con[1]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.