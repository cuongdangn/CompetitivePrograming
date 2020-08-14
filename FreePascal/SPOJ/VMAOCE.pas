const   finp    =       'DNC.INP';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
        bg      =       record
        gt,cs    :       longint;
        end;
var     n,goc,m       :       longint;
        f,g     :       text;
        ke      :       array[1..100010] of node;
        dd      :       array[1..100010] of boolean;
        slc     :       array[1..100010] of longint;
        loai    :       array[1..100010] of byte;
        slmau,c       :       array[1..3] of longint;
        a       :       array[1..100000] of bg;
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
var     i,u,v   :       longint;
begin
        readln(f,n);
        while not seekeof(f) do
         begin
          readln(f,u,v);
          nap(ke[u],v);
          nap(ke[v],u);
         end;
end;
procedure       xuatxau;
begin
        writeln(g,-1);
        dong;
        halt;
end;
procedure       timdi(i:longint);
var     p       :       node;
        dem,u     :       longint;
begin
        dd[i]:=false;
        p:=ke[i];
        dem:=0;
        while p<> nil do
         begin
          u:=p^.u;
          if dd[u] then
           begin
            timdi(u);
            if goc>0 then exit;
            inc(dem);
            slc[i]:=slc[i]+slc[u];
            if slc[u]>n div 2 then xuatxau;
           end;
           p:=p^.next;
          end;
         if ((dem=2)and(((n-slc[i]-1)<=(n div 2))and((n-slc[i]-1)>0)))or(dem>2) then
          begin
           goc:=i;
           exit;
          end;
         slc[i]:=slc[i]+1;
end;
procedure       DFS(i,ta:longint);
var     p       :       node;
        u       :       longint;
begin
        dd[i]:=false;
        loai[i]:=ta;
        p:=ke[i];
        while p<> nil do
         begin
          u:=p^.u;
          if dd[u] then
            dfs(u,ta);
           p:=p^.next;
          end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t].gt;
        repeat
                while a[i].gt>x do inc(i);
                while a[j].gt<x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       xuly;
var     i,ta,u       :       longint;
        ok      :    boolean;
        p       :       node;
begin
        goc:=0;
        for i:=1 to n do dd[i]:=true;
        timdi(1);
        if goc=0 then xuatxau;
        p:=ke[goc];
        ta:=1;
        for i:=1 to n do dd[i]:=true;
        dd[goc]:=false;
        ta:=1;
        while p<> nil do
         begin
          u:=p^.u;
          if slc[u]=0 then slc[u]:=n-slc[goc]-1;
          inc(m);
          a[m].gt:=slc[u];
          a[m].cs:=u;
          p:=p^.next;
         end;
         QS(1,m);
         ///
         for i:=1 to m do
          begin
           if a[i].gt+c[ta]>n div 2 then inc(ta);
           c[ta]:=c[ta]+a[i].gt;
           dfs(a[i].cs,ta);
           inc(slmau[ta]);
           if ta=2 then inc(ta);
          end;
          //////////////
         fillchar(dd,sizeof(dd),true);
         ok:=false;
        if slmau[3]=0 then ok:=true;
          if ok then
           begin
            p:=ke[goc];
            dd[goc]:=false;
            while true do
            begin
            if slmau[loai[p^.u]]>1 then
             begin
              dfs(p^.u,3);
              break;
             end;
            p:=p^.next;
           end;
          end;
         for i:=1 to n do write(g,loai[i],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
