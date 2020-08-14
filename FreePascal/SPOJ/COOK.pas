const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
type node=^re;
        re=record
            v:longint;
            next:node;
            end;

var     g,f     :       text;
        ke:array[0..maxn] of node;
        x,kq,n,xp       :       longint;
        d       :       array[0..maxn] of int64;
procedure	mo;
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
procedure nap(var ke:node; v:longint);
var p:node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;
procedure doc;
var i,u,v,w:longint;
begin
        readln(F,n);
        for i:=1 to n do
        begin
              readln(F,w,u);
              nap(ke[u],i);
              d[i]:=w;
        end;
end;
procedure dfs(u:longint);
var v:longint;
        P:node;
begin

        if (d[u]>0)and(u<>xp) then inc(kq);
        p:=ke[u];
        WHile p<>nil do
        begin
                v:=p^.v;

                begin
                    dfs(V);
                end;
                p:=p^.next;
        end;
end;
procedure dfs1(u:longint);
var v:longint;
P:node;
begin

        if u<>xp then d[u]:=d[u]-x;
        p:=ke[u];
        WHile p<>nil do
        begin
                v:=p^.v;

                begin

                    dfs1(V);
                end;
                p:=p^.next;
        end;
end;


procedure       xuly;
var     i,t,v,i1       :longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
                read(f,i1);
                if i1=1 then
                        begin
                                readln(f,xp,x);

                                dfs1(xp);
                        end
                else    begin
                         kq:=0;

                         readln(f,xp);
                         dfs(xp);
                         writeln(kq);
                         end;
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

