const   finp    =       '';fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;n,m     :       longint;
        sl       :       array[1..3000] of int64;
        ke      :       array[1..3000] of node;
        kq      :       int64;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
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
        readln(f,n,m);
        for i:=1 to m do
         begin
          readln(f,u,v);
          nap(ke[u],v);
         end;
end;
procedure       duyet(goc,i,j:longint);
var     p       :       node;
        u       :       longint;
begin
        if j=3 then
         begin
          inc(sl[i]);
          exit;
         end;
         p:=ke[i];
         while p<>nil do
          begin
           u:=p^.u;
           if u<>goc then duyet(goc,u,j+1);
           p:=p^.next;
          end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to n do
         begin
          fillchar(sl,sizeof(sl),0);
          duyet(i,i,1);

          for j:=1 to n do
           kq:=kq+(sl[j]*(sl[j]-1) div 2);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
