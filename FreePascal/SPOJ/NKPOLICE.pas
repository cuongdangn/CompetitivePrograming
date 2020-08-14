uses    math;
const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m     :       longint;
        e       :       array[1..500010] of bg;
        ke      :       array[1..100000] of node;
        cha,tr,sau,low:       array[1..100000] of longint;
        dem1    :       longint;
        khop,cau:       array[1..1000000] of boolean;
        dd      :       array[1..500010] of boolean;

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
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
                readln(f,e[i].x,e[i].y);
                nap(ke[e[i].x],i);
                nap(ke[e[i].y],i);
         end;
end;
procedure       dfs(v:longint);
var     p       :       node;
        u,t     :       longint;
begin
        p:=ke[v];
        inc(dem1);
        tr[v]:=dem1;
        low[v]:=maxlongint;
        while p<>nil do
         begin
          u:=p^.u;
          if dd[u] then
           begin
           dd[u]:=false;
            t:=e[u].x+e[u].y-v;
            if cha[t]<>0 then
             low[v]:=min(low[v],tr[t])
            else
             begin
              cha[t]:=v;
              dfs(t);
              low[v]:=min(low[v],low[t]);
             end;
           end;
          p:=p^.next;
          end;
          inc(dem1);
          sau[v]:=dem1;
end;
procedure               init;
var     i,j,dem             :       longint;
begin
        dem:=0;
        fillchar(dd,sizeof(dd),true);
        dem1:=0;
        cha[1]:=-1;
        dfs(1);
        fillchar(cau,sizeof(cau),false);
        fillchar(khop,sizeof(khop),false);
        for i:=1 to n do
         if cha[i]=1 then inc(dem);
        if dem>1 then khop[1]:=true;
        for i:=1 to n do
         if cha[i]<>-1 then
            cau[i]:=low[i]>=tr[i];
        for i:=1 to n do
         if (cha[i]<>-1)and(cha[cha[i]]<>-1) then
          khop[cha[i]]:=tr[cha[i]]<=low[i];
end;
function       kothuoc(a,b:longint):boolean;
begin
        exit(not((tr[a]<=sau[b])and(tr[a]>=tr[b])));
end;
procedure       truyvan2(a,b,c,d:longint);
var     i,j     :       longint;
        ok1,ok2,okk :       boolean;
begin
        if (cha[d]<>c)and(cha[c]<>d) then  begin writeln(g,'yes');exit end;
        if cha[d]=c then c:=d;
        if (not cau[c]) then begin writeln(g,'yes');exit end;

        ok1:=kothuoc(a,c);ok2:=kothuoc(b,c);
        if ok1 and ok2 then begin writeln(g,'yes');exit end;
       if not((not ok1)and(not ok2)) then begin okk:=false;if ok1 then begin if low[b]>=tr[a] then okk:=true;end else if low[a]>=tr[b] then okk:=true; if okk then writeln(g,'no') else writeln(g,'yes');exit end;
        writeln(g,'yes');
end;
procedure       truyvan1(a,b,c:longint);
var     i,j     :       longint;
        ok1,ok2,okk :       boolean;
begin
        if (not khop[c]) then begin writeln(g,'yes');exit end;
        ok1:=kothuoc(a,c);ok2:=kothuoc(b,c);
        if ok1 and ok2 then begin writeln(g,'yes');exit end;
        if not((not ok1)and(not ok2)) then begin okk:=false;if ok1 then begin if low[b]>=tr[a] then okk:=true;end else if low[a]>=tr[b] then okk:=true; if okk then writeln(g,'no') else writeln(g,'yes');exit end;
        if kothuoc(a,b)and((low[a]>=tr[c])or(low[b]>=tr[c])) then writeln(g,'no') else writeln(g,'yes');
end;
procedure       xuly;
var     i,u,v,t,l,tg   :       longint;
begin
        init;
        readln(f,t);
        for i:=1 to t do
         begin
           read(f,l);
           if l=2 then
            begin
             read(f,u,v,tg);
             truyvan1(u,v,tg);
            end
            else
             begin
              read(f,u,v,l,tg);
              truyvan2(u,v,l,tg);
             end;
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong
end.