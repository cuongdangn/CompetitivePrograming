uses    math;
const   finp    =       'ROWING.INP';
        fout    =       'ROWING.OUT';
        maxn    =       4010;
        maxx    =       maxlongint;
type    node    =       ^re;
        re      =       record
        u       :       longint;
        w       :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,h     :       longint;
        ke      :       array[0..maxn] of node;
        dd      :       array[0..maxn] of boolean;
        d       :       array[-1..maxn] of longint;
        a       :       array[1..maxn] of bg;
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
var     i,j     :       longint;
begin
        readln(f,n,h);
        for i:=1 to n do
         readln(f,a[i].x,a[i].y);
end;
procedure       nap(var ke:node;u:longint;w:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.w:=w;
        p^.next:=ke;
        ke:=p;
end;
function        kc(i,j:longint):longint;
var     t1,t2   :       int64;
begin
        t1:=int64(a[i].x-a[j].x);
        t2:=int64(a[i].y-a[j].y);
        exit(trunc(sqrt(sqr(t1)+sqr(t2))));
end;
procedure       init;
var     i,j,t     :       longint;
begin
        for i:=1 to n-1 do
         for j:=i+1 to n do
          begin
           t:=kc(i,j);
           nap(ke[i],j,t);
           nap(ke[j],i,t);
          end;
         for i:=1 to n do
          begin
           nap(ke[0],i,a[i].y);
           nap(ke[i],0,a[i].y);
           nap(ke[n+1],i,h-a[i].y);
           nap(ke[i],n+1,h-a[i].y);
          end;
end;
procedure       dj;
var     i,u       :       longint;
        p       :       node;
begin
        fillchar(dd,sizeof(dd),true);

        for i:=-1 to n+1 do
         d[i]:=maxx;
        d[0]:=0;
        repeat
         u:=-1;
         for i:=0 to n+1 do
          if dd[i] and (d[i]<d[u]) then u:=i;
          if (u=n+1)or(u=-1) then break;
          dd[u]:=false;
          p:=ke[u];
          while p<>nil do
           begin
            if (dd[p^.u])and(d[p^.u]>max(d[u],p^.w)) then
             d[p^.u]:=max(d[u],p^.w);
             p:=p^.next;
            end;
         until false;
         writeln(g,d[n+1]);
end;
begin
        mo;
        doc;
        init;
        dj;
        dong;
end.
