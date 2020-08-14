uses    math;
const   finp    =       'RECT.INP';
        fout    =       'RECT.OUT';
type    bg      =       record
        x,y     :       longint;
        end;
        node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n       :       longint;
        dem,kq  :       longint;
        a       :       array[1..1000,1..5] of bg;
        ke      :       array[1..1000] of node;
        dd      :       array[1..1000] of boolean;

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
        readln(f,n);
        for i:=1 to n do
         begin
                for j:=1 to 4 do read(f,a[i][j].x,a[i,j].y);
                readln(f);
         end;
end;

function        ccw(a,b,c:bg):longint;
var     t,x1,x2,y1,y2:   int64;
begin
        x1:=b.x-a.x;
        y1:=b.y-a.y;
        x2:=c.x-b.x;
        y2:=c.y-b.y;
        t:=x1*y2-x2*y1;
        if t=0 then  exit(0);
        if t<0 then exit(-1)
        else exit(1);
end;

function        ktra(x,y:longint):boolean;
var     i,j,t,k ,t1    :       longint;
        ok      : boolean;
begin
        a[x][5]:=a[x][1];
        for i:=1 to 4 do
         begin
          if i=1 then j:=3 else
           if i=4 then j:=2 else j:=1;
          t:=ccw(a[x][i],a[x][i+1],a[x][j]);
          ok:=true;
          for k:=1 to 4 do
          begin
           t1:=ccw(a[x][i],a[x][i+1],a[y][k]);
           if t1*t>=0 then ok:=false;
          end;
           if ok then exit(false);

          end;
          exit(true);
end;
procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n-1 do
          for j:=i+1 to n do
          if ktra(i,j)and ktra(j,i) then
           begin
            nap(ke[i],j);
            nap(ke[j],i);
           end;
end;
procedure       dfs(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        inc(dem);
        while p<>nil do
         begin
          if dd[p^.u] then
           dfs(p^.u);
           p:=p^.next;
         end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        init;
        fillchar(dd,sizeof(dd),true);
        for i:=1 to n do
         if dd[i] then
          begin
           dem:=0;
           dfs(i);
           kq:=max(kq,dem);
          end;
          writeln(g,kq)
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.