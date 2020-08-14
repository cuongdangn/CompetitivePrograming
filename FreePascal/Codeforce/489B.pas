const   finp    =       '';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;

var     g,f     :       text;
        a,b,match   :       array[1..100] of longint;
        n,m     :       longint;
        ke      :       array[1..100] of node;
        dd      :       array[1..100] of boolean;
        list    :       array[1..100] of longint;
        nl,kq      :       longint;
        ok      :       boolean;

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
        for i:=1 to n do read(f,a[i]);
        readln(f,m);
        for i:=1 to m do read(f,b[i]);
end;

procedure       DFS(u:longint);
var     p       :       node;
        v       :       longint;
begin
        p:=ke[u];
        while p<>nil do
         begin
          v:=p^.u;
          if not dd[v] then
          begin
           dd[v]:=true;
           if match[v]<>0 then
             DFS(match[v])
           else ok:=true;
           if ok then begin match[v]:=u;exit; end;
          end;
          p:=p^.next;
         end;
end;
procedure       xuly;
var    i,j     :       longint;
        old    :       longint;
begin
        for i:=1 to n do
         list[i]:=i;
         nl:=n;
        repeat
               old:=nl;
               fillchar(dd,sizeof(dd),false);
               for i:=nl downto 1 do
                begin
                 ok:=false;
                 DFS(list[i]);
                 if ok then
                  begin
                   list[i]:=list[nl];
                   dec(nl);
                  end;
                end;
        until   nl=old;
end;

procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       xuat;
var     i,j     :       longint;
begin
        for i:=1 to m do
         if match[i]<>0 then inc(kq);writeln(g,kq);
end;

procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do
         for j:=1 to m do
           if abs(a[i]-b[j])<=1 then nap(ke[i],j);
end;
begin
        mo;
        doc;
        init;
        xuly;
        xuat;
        dong;
end.