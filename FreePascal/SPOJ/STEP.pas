const   finp    =       'STEP.INP';
        fout    =       'STEP.OUT';
        maxx    =       10000000;
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..5000] of node;
        n,m     :       longint;
        di,k,dau,cuoi     :       longint;
        dd      :       array[1..5000] of boolean;
        st      :       array[1..5010] of longint;
        d       :       array[1..5000,1..5000] of longint;
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
procedure       nap(var ke: node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,j,u,v     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
          readln(f,u,v);
          nap(ke[u],v);
          nap(ke[v],u);
         end;
end;
procedure       xuly1;
var     t,i       :       longint;
begin
        t:=d[1,di];
        if t>k then
         begin
          writeln(g,0);
          exit;
         end;
        for i:=2 to n do
        if (d[1,i]<maxx)and(d[i,di]<maxx) then
         if k>=d[1,i]+d[i,di] then
          begin
           if (k-d[1,i]-d[i,di])mod 2=0 then
            begin
             writeln(g,1);
             exit;
            end;
          end;
        writeln(g,0);
end;
procedure       BFS(u:longint);
var     p       :       node;
        v       :       longint;
begin
        dd[u]:=false;
        st[1]:=u;
        dau:=1;
        cuoi:=1;
        while dau<=cuoi do
         begin
          v:=st[dau];
          inc(dau);
          p:=ke[v];
          while p<>nil do
           begin
             if dd[p^.u] then
              begin
               d[u,p^.u]:=d[u,v]+1;
               dd[p^.u]:=false;
               inc(cuoi);
               st[cuoi]:=p^.u;
              end;
              p:=p^.next;
           end;
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do
         for j:=1 to n do
          d[i,j]:=maxx;
         for i:=1 to n do
          d[i,i]:=0;
         for i:=1 to n do
         begin
          for j:=1 to n do dd[j]:=true;
          BFS(i);
         end;
end;
procedure       xuly;
var     i,p     :       longint;
begin

        init;
        readln(f,p);
        for i:=1 to p do
         begin
          readln(f,di,k);
          xuly1;
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.