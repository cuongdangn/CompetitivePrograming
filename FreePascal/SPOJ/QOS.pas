uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       1000;
        maxm    =       100000;
        maxx    =       maxm*200;
type    node    =       ^re;
        re      =       record
        u,w     :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y,w   :       longint;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        d       :       array[0..maxn] of longint;
        e       :       array[1..maxm] of bg;
        n,m,k,t :       longint;
        fx      :       array[1..maxn,0..1000] of int64;
        sl      :       longint;
        luu     :       array[1..maxn] of longint;
        dd      :       array[0..maxn] of boolean;
        cmin,tmin:      longint;
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
var     i,j:    longint;
begin
        readln(f,n,m,t,k);
        cmin:=maxx;
        for i:=1 to m do
         begin
                readln(f,e[i].x,e[i].y,e[i].w);
                nap(ke[e[i].y],e[i].x,e[i].w);
                cmin:=min(cmin,e[i].w);
         end;
end;
procedure       init;
var     i       :       longint;
begin
        for i:=0 to n do
         begin
                dd[i]:=true;
                d[i]:=maxx;
         end;
        d[t]:=0;
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x,tg    :       bg;
begin
        i:=l;
        j:=h;
        x:=e[random(h-l+1)+l];
        repeat
                while (e[i].x<x.x)or((e[i].x=x.x)and(e[i].y>x.y)) do inc(i);
                while (e[j].x>x.x)or((e[j].x=x.x)and(e[j].y<x.y)) do dec(j);
                if i<=j then
                 begin
                        tg:=e[i];
                        e[i]:=e[j];
                        e[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       daochieu;
var     i,j     :       longint;
begin
        for i:=1 to n do ke[i]:=nil;
        randomize;
        QS(1,m);
        for i:=1 to m do nap(ke[e[i].x],e[i].y,e[i].w);
end;
procedure       dj;
var     i,u     :       longint;
        p       :       node;
begin
        init;
        repeat
                u:=0;
                for i:=1 to n do
                 if (d[i]<d[u])and(dd[i]) then
                  u:=i;
                 if (u=0) then break;
                 dd[u]:=false;
                 p:=ke[u];
                 while p<>nil do
                  begin
                        if d[p^.u]>d[u]+p^.w then
                         d[p^.u]:=d[u]+p^.w;
                         p:=p^.next;
                  end;
        until     false;
        tmin:=d[1];
        daochieu;
end;
function        tinh(u,cl:longint):int64;
var     dem     :       int64;
        p       :       node;
begin
        if cl<0 then exit(0);
        if u=t then exit(1);
        if fx[u,cl]<>-1 then exit(fx[u,cl]);
        dem:=0;

        p:=ke[u];
        dd[u]:=false;
        while p<>nil do
         begin
                if dd[p^.u] then
                 dem:=dem+tinh(p^.u,cl+d[u]-d[p^.u]-p^.w);
                p:=p^.next;
         end;
         dd[u]:=true;
         if dem>k then dem:=k+1;
         fx[u,cl]:=dem;
         exit(dem);
end;

procedure        lankq(u,cl:longint);
var     dem     :       int64;
        p       :       node;
begin
        inc(sl);
        luu[sl]:=u;
        if u=t then exit;
        dem:=0;

        p:=ke[u];
        dd[u]:=false;
        while p<>nil do
         begin
                if dd[p^.u] then
                begin
                 dem:=tinh(p^.u,cl+d[u]-d[p^.u]-p^.w);
                 if dem>=k then
                  begin
                        lankq(p^.u,cl+d[u]-d[p^.u]-p^.w);
                        exit;
                  end
                 else k:=k-dem;
                end;
                p:=p^.next;
         end;

end;
procedure       xuly;
var     i,j     :       longint;
        x       :       int64;
begin
        dj;
        fillchar(dd,sizeof(dd),true);
        fillchar(fx,sizeof(fx),255);
        x:=tinh(1,tmin+cmin-d[1]);
        if x<k then begin writeln(g,-1); exit end;
        sl:=0;
        lankq(1,tmin+cmin-d[1]);
        if sl=0 then writeln(g,-1)
        else
         begin
                writeln(g,sl);
                for i:=1 to sl do write(g,luu[i],' ');
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
