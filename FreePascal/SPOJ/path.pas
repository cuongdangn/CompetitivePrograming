uses    math;
const   finp    =       'path.inp';
        fout    =       'path.out';
        maxn    =       100001;
type    node    =       ^re;
        re      =       record
        v       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        ke      :       array[1..maxn] of node;
        fx      :       array[1..maxn] of longint;
        dd      :       array[1..maxn] of boolean;
        n       :       longint;
        kq,ti   :       int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure     dong;
begin
        close(f);
        close(g);
end;
procedure       nap(var ke:node;v:longint);
var     p       :       node;
begin
        new(p);
        p^.v:=v;
        p^.next:=ke;
        ke:=p;
end;

procedure       doc;
var     i,u,v       :       longint;
begin
        readln(f,n);
        for i:=1 to n-1 do
          begin
                readln(f,u,v);
                nap(ke[u],v);
                nap(ke[v],u);
          end;
end;

procedure       DFS(u:longint);
var     p       :       node;
begin
        dd[u]:=false;
        p:=ke[u];
        while p<>nil do
         begin
                if dd[p^.v] then
                 begin
                      DFS(p^.v);
                      fx[u]:=fx[u]+fx[p^.v]+1;
                 end;
                p:=p^.next;
         end;
end;
procedure       xuly;
var     i       :       longint;
begin
        fillchar(dd,sizeof(dd),true);
        DFS(1);
        for i:=1 to n do
          begin
                ti:=int64(fx[i]+1)*int64(n-fx[i]-1);
                kq:=max(kq,ti);
          end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.