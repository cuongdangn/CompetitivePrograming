uses    math;
const   finp    =       'test1/DNC.INP';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        w       :       longint;
        next    :       node;
        end;
        bg      =       record
        gt      :       int64;
        cs      :       longint;
        end;
var     g,f     :       text;
        ke      :       array[1..10000] of node;
        n       :       longint;
        dd,cha      :       array[1..10000] of longint;
        d,d1,d2       :       array[1..10000] of int64;
        p,ne    :       longint;
        dc      :       array[1..10010] of bg;
        k,kq,luu:       int64;
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
var     i,j,u,v,w     :       longint;
begin
        readln(f,n,p);
        for i:=1 to n-1 do
         begin
          readln(f,u,v,w);
          nap(ke[u],v,w);
          nap(ke[v],u,w);
         end;
end;
procedure       QS(l,h  :       longint);
var     i,j     :       longint;
        x       :       int64;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        x:=dc[random(h-l+1)+l].gt;
        repeat
         while dc[i].gt<x do inc(i);
         while dc[j].gt>x do dec(j);
         if i<=j then
          begin
            tg:=dc[i];
            dc[i]:=dc[j];
            dc[j]:=tg;
            inc(i);dec(j);
          end;
         until i>j;
         if i<h then QS(i,h);
         if j>l then QS(l,j);
end;
procedure        dfs(u:longint);
var     p        :      node;
begin
        dd[u]:=1;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.u]=0 then
                  begin
                   d[p^.u]:=d[u]+int64(p^.w);
                   cha[p^.u]:=u;
                   dfs(p^.u);
                   if d1[u]<d1[p^.u]+int64(p^.w) then
                    begin
                     d2[u]:=d1[u];
                     d1[u]:=d1[p^.u]+int64(p^.w);
                    end
                   else
                    d2[u]:=max(d2[u],d1[p^.u]+int64(p^.w));
                  end;
                p:=p^.next;
         end;
end;
function        chat2(x:int64):longint;
var     dau,cuoi,luu,giua       :       longint;
begin
        dau:=1;
        cuoi:=n;
        while dau<=cuoi do
         begin
           giua:=(dau+cuoi) div 2;
           if dc[giua].gt<=x then
            begin
             luu:=dc[giua].cs;
             dau:=giua+1;
            end
           else cuoi:=giua-1;
         end;
        exit(luu);
end;
function        ktra(x:int64):boolean;
var     j,t:    longint;
        ma1,ma2 :       int64;
begin
        t:=chat2(x);
        j:=cha[t];
        while j<>-1 do
         begin
           if d1[j]=d1[t]+d[t]-d[j] then
             begin ma1:=d2[j]+d[t]-d[j];ma2:=d[j]-d[p]+d2[j] end else begin ma1:=d1[j]+d[t]-d[j];ma2:=d1[j]+d[j]-d[p] end;
           if min(ma1,ma2)>x then exit(false);
           j:=cha[j];
         end;
        exit(true);
end;

procedure       chat;
var     luu,dau,cuoi,giua   :       int64;
        i       :longint;
begin
        dfs(p);
        cha[p]:=-1;
        for i:=1 to n do
         begin
          dc[i].gt:=d1[i];
          dc[i].cs:=i;
         end;
         randomize;
         QS(1,n);
        dau:=d2[p];
        cuoi:=d1[p];
        while dau<=cuoi do
         begin
           giua:=(dau+cuoi) div 2;
           if ktra(giua) then
            begin
               luu:=giua;
               cuoi:=giua-1;
            end
           else
            dau:=giua+1;
         end;
         writeln(g,d1[p]-luu);
end;

begin
        mo;
        doc;
        chat;
        dong;
end.
