const   finp    =       'STEP.INP';
        fout    =       'STEP.OUT';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
        bg      =       record
        gt,l    :       longint;
        end;
var     g,f     :       text;
        n,m     :       longint;
        ke      :       array[1..5010] of node;
        sb      :       array[1..5010,0..1] of longint;
        dd      :       array[1..5010,0..1] of boolean;
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
var     i,u,v     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
         begin
          readln(f,u,v);
          nap(ke[u],v);
          nap(ke[v],u);
         end;
end;
procedure       bfs;
var     dau,cuoi,i,t        :       longint;
        st      :       array[1..10010] of bg;
        u       :       bg;
        p       :       node;
begin
        dau:=1;
        cuoi:=1;
        st[dau].gt:=1;
        st[dau].l:=0;
        fillchar(dd,sizeof(dd),true);
        for i:=2 to n do
         begin
          sb[i,0]:=-1;
          sb[i,1]:=-1;
         end;
        dd[1,0]:=false;
        sb[1,0]:=0;
        sb[1,1]:=-1;
        while dau<=cuoi do
         begin
           u:=st[dau];
          inc(dau);
          p:=ke[u.gt];
          t:=sb[u.gt,u.l];
          while p<>nil do
           begin
            if dd[p^.u,(t+1)mod 2] then
             begin
              sb[p^.u,(t+1)mod 2]:=t+1;
              dd[p^.u,(t+1)mod 2]:=false;
              inc(cuoi);
              st[cuoi].l:=(t+1) mod 2;
              st[cuoi].gt:=p^.u;
             end;
            p:=p^.next;
           end;
         end;
end;
procedure       xuly;
var    i,d,k    :       longint;
begin
        bfs;
        readln(f,m);
        for i:=1 to m do
         begin
          readln(f,d,k);
          if (sb[d,k mod 2]>k)or(sb[d,k mod 2]=-1) then writeln(g,0)
          else writeln(g,1);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

