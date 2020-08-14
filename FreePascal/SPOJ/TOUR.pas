{$MODE OBJFPC}
uses    math;
const   finp    =       'TOUR.INP';
        fout    =       'TOUR.OUT';
        maxn    =       1005;
        maxm    =       1000005;
        maxw    =       1000000000;
        maxd    =       maxn*maxw+15;
type
        tadj     =       record
        v       :       longint;
        w       :       int64;
        link    :       longint;
        end;
        theap   =       record
         item   :  array[1..maxn] of longint;
         nitem  :  integer;
         pos    :  array[1..maxn] of longint;
        end;
var
        f,g     :       text;
        adj     :       array[1..maxm] of tadj;
        head    :       array[1..maxn] of longint;
        d       :       array[1..maxn,1..maxn] of int64;
        s1      :array[1..16] of longint;
        dd      :       array[1..16] of byte;
        fx      :       array[1..15,0..32786] of int64;
        n,m,s,k :       longint;
        heap    :       theap;
        kq      :       int64;
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
var     i,u     :       longint;
begin
        readln(f,n,m,k);
        fillchar(head[1],n*sizeof(head[1]),0);
        for i:=1 to k do read(f,s1[i]);
        inc(k);
        s1[k]:=1;
        readln(f);
        for i:=1 to m do
                begin
                        readln(f,u,adj[i].v,adj[i].w);
                        adj[i].link:=head[u];
                        head[u]:=i;
                end;

end;
procedure       kt;
var     v:longint;
begin
        for v:=1 to n do d[s,v]:=maxd;
        d[s,s]:=0;
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
                                if (c<nitem)and(d[s,item[c+1]]<d[s,item[c]]) then inc(c);
                                if (c > nitem) or (d[s,v]<=d[s,item[c]]) then break;
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
                                if (p=0)or(d[s,item[p]]<=d[s,v]) then break;                                item[c]:=item[p];
                                item[c]:=item[p];
                                pos[item[c]]:=c;
                                c:=p;
                        until   false;
                        item[c]:=v;
                        pos[v]:=c;
                end;
end;
function        relex(u,v     :       longint;w:int64):boolean;
begin
        relex:=d[s,v]>(d[s,u]+w);
        if relex then
                        d[s,v]:=d[s,u]+w;
end;
procedure       dj;
var     u,i:longint;
begin
        kt;
        repeat
                u:=ex;
                if (u=0) then break;
                i:=head[u];
                while i<>0 do
                        begin
                                if relex(u,adj[i].v,adj[i].w) then update(adj[i].v);
                                i:=adj[i].link;
                        end;
        until heap.nitem=0;
end;
procedure       QHD;
var     i,j,t,k1     :       longint;
begin
        for i:=0 to 1 shl k-1 do
         for j:=1 to k do fx[j,i]:=maxd;
         for i:=1 to k do

                fx[i,1 shl (i-1)]:=d[1,s1[i]];
        for i:=1 to 1 shl k-1 do
         begin
                for j:=1 to k do
                 if (i shr (j-1)) and 1=1 then
                 begin
                        t:=i and (not ( 1 shl (j-1)));
                        for k1:=1 to k do
                         if (t shr (k1-1)) and 1 =1 then
                                fx[j,i]:=min(fx[j,i],fx[k1,t]+d[s1[k1],s1[j]]);
                 end;
         end;
         for i:=1 to k do
          kq:=min(kq,fx[i,1 shl k-1]+d[s1[i],1]);
end;

procedure       xuly;
var     i       :       longint;
begin
        for i:=1 to k do
         begin
          s:= s1[i];
          dj;
         end;
         kq:=maxd;
         dd[k]:=1;
         dec(k);
         QHD;
         if kq=maxd then writeln(g,-1)
         else writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


