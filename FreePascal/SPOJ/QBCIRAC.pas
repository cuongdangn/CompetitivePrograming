const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u,c       :       longint;
        next    :       node
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m     :       longint;
        ke      :       array[1..1010] of node;
        e       :       array[1..20010] of bg;
        dd      :       array[1..20010] of boolean;
        num,xo  :       array[1..1010] of longint;
        id      :       longint;
        truy    :       array[1..1010] of longint;
        luu     :       array[1..1010] of longint;
        lkq     :       array[1..1010] of longint;
        kq,l    :       longint;
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
procedure       nap(var ke:node;u,c:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        p^.c:=c;
        ke:=p;
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
         end;
end;
function        ktra(u:longint):boolean;
var     p       :       node;
begin
        num[u]:=id;
        xo[u]:=0;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.c] then
                begin

                if num[p^.u]<id then
                 begin
                        if ktra(p^.u) then exit(true);
                 end
                else  if xo[p^.u]=0 then exit(true);
                end;
                p:=p^.next;
         end;
         xo[u]:=id;
         exit(false);
end;
function        dfs(u:longint):boolean;
var     p       :       node;
        v       :longint;
begin
        num[u]:=id;
        xo[u]:=0;
        p:=ke[u];
        while p<>nil do
         begin
                if num[p^.u]<id then
                 begin
                        truy[p^.u]:=p^.c;
                        if dfs(p^.u) then exit(true);
                 end
                else  if xo[p^.u]=0 then
                        begin
                                v:=u;
                                while v<>p^.u do
                                 begin
                                        inc(l);
                                        luu[l]:=truy[v];
                                        v:=e[truy[v]].x;
                                 end;
                                 inc(l);
                                 luu[l]:=p^.c;
                                 exit(true);
                        end;
                p:=p^.next;
         end;
         xo[u]:=id;
         exit(false);
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x,tg    :       longint;
begin
        i:=l;
        j:=h;
        x:=lkq[random(h-l+1)+l];
        repeat
                while (e[lkq[i]].x<e[x].x)or((e[lkq[i]].x=e[x].x)and(e[lkq[i]].y<e[x].y)) do inc(i);
                while (e[lkq[j]].x>e[x].x)or((e[lkq[j]].x=e[x].x)and(e[lkq[j]].y>e[x].y)) do dec(j);
                if i<=j then
                 begin
                        tg:=lkq[i];
                        lkq[i]:=lkq[j];
                        lkq[j]:=tg;
                        inc(i);dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       xuly;
var     i,j       :       longint;
        ok      :       boolean;

begin
        id:=1;
        ok:=true;
        for i:=1 to n do
         if num[i]=0 then
                if dfs(i) then begin ok:=false;break;end;
         fillchar(dd,sizeof(dd),true);
        for i:=1 to l do
         begin
                inc(id);
                ok:=true;
                dd[luu[i]]:=false;
                for j:=1 to n do
                 if num[j]<>id then
                        if ktra(j) then
                         begin
                                ok:=false;
                                break;
                         end;
                 if ok then
                  begin
                        inc(kq);
                        lkq[kq]:=luu[i];
                  end;
                  dd[luu[i]]:=true;
         end;
         if kq=0 then writeln(g,-1)
         else
          begin
                writeln(g,kq);
                randomize;
                QS(1,kq);
                for i:=1 to kq do
                  writeln(g,e[lkq[i]].x,' ',e[lkq[i]].y);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
