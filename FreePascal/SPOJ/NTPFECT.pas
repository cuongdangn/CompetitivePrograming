uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..1000] of node;
        n       :       longint;
        dd      :       array[1..1000] of boolean;
        d       :       array[1..1000,0..2] of longint;
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
        for i:=1 to n do ke[i]:=nil;
        for i:=1 to n-1 do
         begin
                readln(f,u,v);
                nap(ke[u],v);
                nap(ke[v],u);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
        ok      :       boolean;
        s,ss,t       :       longint;

begin
        dd[u]:=false;
        p:=ke[u];
        ok:=false;
        s:=0;
        ss:=n+100;
        d[u,1]:=0;
        t:=0;
        d[u,2]:=0;
        while p<>nil do
         begin
                if dd[p^.u] then
                 begin
                        dfs(p^.u);
                        inc(t);
                        d[u,1]:=d[u,1]+min(d[p^.u,2],min(d[p^.u,0],d[p^.u,1]));
                        d[u,2]:=d[u,2]+min(d[p^.u,0],d[p^.u,1]);s:=s+min(d[p^.u,0],d[p^.u,1]);
                        ss:=min(ss,d[p^.u,1]-d[p^.u,0]);
                        if d[p^.u,1]<=d[p^.u,0] then ok:=true;
                 end;
                 p:=p^.next;
         end;
         d[u,1]:=d[u,1]+1;
         if (ok) then d[u,0]:=s
         else d[u,0]:=s+ss;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to n do
          dd[i]:=true;
        dfs(1);
        writeln(g,min(d[1,0],d[1,1]));
end;
procedure        doc1;
begin
        readln(f,n);
        while n<>0 do
         begin
                doc;
                if n=1 then writeln(g,1)
                else
                xuly;
                readln(f,n);
         end;
end;
begin
        mo;
        doc1;
        dong;
end.
