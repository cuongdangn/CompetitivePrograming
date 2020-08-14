uses    math;
const   finp    =       'BLOCK.INP';
        fout    =       'BLOCK.OUT';
        maxx    =       trunc(1e9)+8;
type    node    =       ^re;
        re      =       record
        u,w     :       longint;
        next    :       node;
        end;

var     g,f     :       text;
        ke      :       array[1..100010] of node;
        d       :       array[1..100010,0..1] of longint;
        n,m     :       longint;
        dd,nguy :       array[1..100010] of boolean;
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
procedure       nap(var ke:node;u,w:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,j,u,v,w:    longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
         begin
                readln(f,u,v,w);
                nap(ke[u],v,w);
                nap(ke[v],u,w);
         end;
         read(f,m);
         fillchar(nguy,sizeof(nguy),false);
         for i:=1 to m do begin read(f,u);nguy[u]:=true end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        if nguy[u] then begin d[u,0]:=0;d[u,1]:=maxx end
        else begin d[u,0]:=maxx;d[u,1]:=0; end;
        while p<>nil do
         begin
                if dd[p^.u] then
                 begin
                        dfs(p^.u);
                        if nguy[u] then
                         begin
                                d[u,0]:=d[u,0]+min(p^.w+d[p^.u,0],d[p^.u,1]);
                                d[u,1]:=maxx;
                         end
                        else
                         begin
                                d[u,0]:=min(d[u,1]+d[p^.u,0],d[u,0]+min(d[p^.u,1],d[p^.u,0]+p^.w));
                                d[u,1]:=d[u,1]+min(d[p^.u,1],d[p^.u,0]+p^.w);
                         end;
                 end;
                 p:=p^.next;
         end;
end;
procedure       xuly;
begin
        fillchar(dd,sizeof(dd),true);
        dfs(1);
        writeln(g,min(d[1,0],d[1,1]));
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
