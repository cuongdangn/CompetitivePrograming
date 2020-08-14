
CONST   FINP    =       'G2W.INP';
        fout    =       'G2W.OUT';
        maxn    =       10000;
        maxm    =       100000;
        maxd    =       maxn*maxm+1;
type    arr     =       array[0..maxn] of byte;
var     g,f     :       text;
        m,n,p,q :       longint;
        d       :       array[0..maxn] of int64;
        a       :       array[1..maxn,1..maxn]of longint;
        d1,d2,dd        :       array[0..maxn] of byte;

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
var     i,j,k,h :       longint;
begin
        readln(f,n,m,p,q);
        for i:=1 to p do
                begin
                        read(f,j);
                        d1[j]:=1;
                end;
        readln(f);
        for i:=1 to q do
                begin
                        read(f,j);
                        d2[j]:=1;
                end;
        for i:=1 to m do
                        readln(f,j,k,a[j,k]);
end;
procedure       kt(s:longint);
var     i       :longint;
begin
        for i:=1 to n do
                begin
                        dd[i]:=0;
                        d[i]:=maxd;
                end;
        d[0]:=maxd;
        d[s]:=0;
end;
procedure       dj(s,t:longint;var   d1:arr);
var     u,v:longint;
begin
        kt(s);
        repeat
                u:=0;
                for v:=1 to n do
                        if (d1[v]=0)and(dd[v]=0)and(d[v]<d[u]) then u:=v;
                if (u=0)or(u=t) then break;
                dd[u]:=1;
                for v:=1 to n do
                 if (dd[v]=0)and(d1[v]=0) then
                 if a[u,v]>0 then
                                if d[v]>d[u]+a[u,v] then d[v]:=d[u]+a[u,v];
       until     false;
       write(g,d[t],' ');
end;
procedure       xuly;
begin
        dj(1,n,d1);
        dj(n,1,d2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
