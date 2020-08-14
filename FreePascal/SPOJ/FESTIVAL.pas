const   finp    =       'FESTIVAL.INP';
        fout    =       'FESTIVAL.OUT';
        maxn    =       1000;
        maxm    =       10000;
        maxd    =       maxn*maxm+1;

var     g,f     :       text;
        a       :       array[1..1000,1..1000] of integer;
        d       :       array[0..1000] of longint;
        s1,s,t,h,fi     :       integer;
        n,m     :       longint;
        dd      :       array[1..1000] of byte;
        ht      :       array[0..maxn] of integer;
        vt      :       array[1..maxn] of longint;

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
var     i,j,r       :       integer;
begin
        readln(f,n,m);
        readln(f,s,t,h,fi);
        read(f,s1);
        j:=s1;
        for i:=2 to fi do
                begin
                       read(f,r);
                       ht[j]:=r;
                       j:=r;
                end;
        for i:=1 to m do
                begin
                        readln(f,j,r,a[j,r]);
                        a[r,j]:=a[j,r];
                end;
end;
procedure       init;
var     i,sl,j:integer;
begin
        for i:=1 to n do d[i]:=maxd;
        d[s]:=0;
        d[0]:=maxd;
        sl:=0;
        j:=s1;
        for i:=1 to n do vt[i]:=maxd;
        vt[j]:=0;
        while sl<fi-1 do
                begin
                        vt[ht[j]]:=a[j,ht[j]]+vt[j];
                        j:=ht[j];
                        inc(sl);
                end;
end;
procedure       dj;
var     u,v     :       integer;
begin
        init;
        repeat
                u:=0;
                for v:=1 to n do
                        if dd[v]=0 then
                                if  d[u]>d[v] then u:=v;
                if (u=t)or(u=0) then break;
                dd[u]:=1;
                for v:=1 to n do
                        if a[u,v]>0 then
                                if dd[v]=0 then
                                        begin
                                                if ht[u]=v then
                                                        begin
                                                         if ((d[u]+h<vt[u])or(d[u]+h>=vt[v])) then
                                                                begin
                                                                        if d[v]>d[u]+a[u,v] then d[v]:=d[u]+a[u,v];
                                                                end
                                                         else
                                                                if d[v]>d[u]+a[u,v]+abs(d[u]+h-vt[v]) then
                                                                d[v]:=d[u]+a[u,v]+abs(d[u]+h-vt[v])
                                                         end
                                                else
                                                if ht[v]=u then
                                                        begin
                                                        if ((d[u]+h>=vt[u])or(d[u]+h<vt[v])) then
                                                                begin
                                                                        if d[v]>d[u]+a[u,v] then d[v]:=d[u]+a[u,v];
                                                                end
                                                        else
                                                                if d[v]>d[u]+a[u,v]+abs(vt[u]-d[u]-h) then
                                                                d[v]:=d[u]+a[u,v]+abs(vt[u]-d[u]-h);
                                                        end
                                                else if d[v]>d[u]+a[u,v] then d[v]:=d[u]+a[u,v];
                                        end;
       until           false;

end;
begin
        mo;
        doc;
        dj;
        write(g,d[t]);
        dong;
end.



















































































































































































































































































