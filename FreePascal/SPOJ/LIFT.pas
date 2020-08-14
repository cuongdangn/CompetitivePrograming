const   finp    =       '';
        fout    =       '';
        maxx    =       trunc(1e15);
type    node    =       ^re;
        re      =       record
        u,i       :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        ke      :       array[1..1000] of node;
        n,m     :       longint;
        d       :       array[0..1000] of int64;
        e       :       array[1..50000] of bg;
        dd      :       array[0..1000] of boolean;
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
procedure       nap(var ke:node;u,i       :       longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.i:=i;
        p^.next:=ke;
        ke:=p
end;
procedure       doc;
var     i,u,v     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,u,v);
                e[i].x:=u;
                e[i].y:=v;
                nap(ke[u],v,i);
                nap(ke[v],u,i);
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=0 to n do
          begin
          d[i]:=maxx;
          dd[i]:=true;
        end;
        d[1]:=0;
end;

procedure       xuly1(v,u,k       :       longint);
var     t,ta,du    :       longint;
begin

        t:=d[v] div abs(v-u);
        du:=d[v] mod abs(v-u);
        if v=e[k].x then
         begin
                if t mod 2=0 then
                 begin
                  if du=0 then ta:=abs(u-v)
                  else ta:=3*abs(u-v)-du;
                 end
                else
                  ta:=2*abs(u-v)-du;
         end
        else
        begin
                if t mod 2=1 then
                 begin
                  if du=0 then ta:=abs(u-v)
                  else ta:=3*abs(u-v)-du;
                 end
                else
                  ta:=2*abs(u-v)-du;
         end;


        if d[v]+ta<d[u] then d[u]:=d[v]+ta;
end;

procedure       dj;
var     p       :       node;
        u,v,i     :       longint;
begin
        init;
        repeat
                v:=0;
                for i:=1 to n do
                 if (d[i]<d[v])and(dd[i]) then v:=i;
                if( v=n)or(v=0) then break;
                p:=ke[v];
                dd[v]:=false;
                while p<>nil do
                 begin
                        u:=p^.u;
                        xuly1(v,u,p^.i);
                        p:=p^.next;
                 end;
        until    false;
        writeln(g,d[n]*5);
end;
begin
        mo;
        doc;
        dj;
        dong;
end.

