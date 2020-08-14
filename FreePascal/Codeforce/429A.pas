const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n       :       longint;
        dd      :       array[1..100010] of boolean;
        ke      :       array[1..100010] of node;
        c,d,dep :       array[1..100010] of longint;
        luu     :       array[1..100010] of longint;
        kq      :       longint;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,u,v     :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
         begin
                readln(f,u,v);
                nap(ke[u],v);
                nap(ke[v],u);
         end;
        for i:=1 to n do read(f,c[i]);
        for i:=1 to n do read(f,d[i]);
end;
procedure       dfs(u,ch,le       :       longint);
var     v,tle,tch  :       longint;
        p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        if dep[u] mod 2=0 then
                begin
                        tle:=0;
                        if ch=1 then
                           begin
                                if c[u]<>d[u] then tch:=0
                                else begin
                                        inc(kq);
                                        luu[kq]:=u;
                                        tch:=1;
                                      end
                           end
                        else
                            begin
                                if c[u]=d[u] then tch:=0
                                else begin
                                        inc(kq);
                                        luu[kq]:=u;
                                        tch:=1;
                                      end;
                             end;
                 end
        else
                begin
                        tch:=0;
                        if le=1 then
                           begin
                                if c[u]<>d[u] then tle:=0
                                else begin
                                        inc(kq);
                                        luu[kq]:=u;
                                        tle:=1;
                                      end
                           end
                        else
                            begin
                                if c[u]=d[u] then tle:=0
                                else begin
                                        inc(kq);
                                        luu[kq]:=u;
                                        tle:=1;
                                      end;
                             end;
                 end;
        while p<> nil do
                begin
                        if dd[p^.u] then
                                begin
                                        dep[p^.u]:=dep[u]+1;
                                        dfs(p^.u,(ch+tch)mod 2,(le+tle) mod 2);
                                end;
                        p:=p^.next;
                end;
end;
procedure       xuly;
var     i       :       longint;
begin
        kq:=0;
        fillchar(dd,sizeof(dd),true);
        dep[1]:=1;
        dfs(1,0,0);
        writeln(g,kq);
        for i:=1 to kq do writeln(g,luu[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
