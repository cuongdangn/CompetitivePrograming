const   finp    =       'SERACH.INP';
        fout    =       'SERACH.OUT';
type    dinh    =       record
        x,y     :       byte;
        end;
var     g,f     :       text;
        a,b     :       array[1..50,1..50] of char;
        st      :       array[1..1000] of dinh;
        n,m     :       byte;
        dau,cuoi,k:longint;
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
procedure       push(i,j:byte);
begin
        inc(cuoi);
        st[cuoi].x:=i;
        st[cuoi].y:=j;
end;
procedure       doc;
var     i,j,u,v,cuoi1       :       longint;
        s:      string;
begin
        readln(f,n,m);dau:=1;cuoi:=0;
        for i:=1 to n do
         begin
         for j:=1 to m do
         begin
         read(f,a[i,j]);
         if a[i,j]='*' then push(i,j);
         end;
         readln(f);
        end;
        readln(f,k);
        for i:=1 to k do
         begin
                readln(f,s);
                cuoi1:=cuoi;
                if s='NORTH' then
                       while dau<=cuoi1 do
                       begin
                        u:=st[dau].x;
                        v:=st[dau].y;
                        a[u,v]:='.';
                        inc(dau);
                        while (a[u,v]<>'X')and(u>1) do
                          begin
                                 dec(u);
                                 if (a[u,v]<>'*')and(a[u,v]<>'X') then
                                 begin
                                  a[u,v]:='*';
                                  push(u,v);
                                 end;
                          end;
                      end;
                 if s='SOUTH' then
                   while dau<=cuoi1 do
                       begin
                        u:=st[dau].x;
                        v:=st[dau].y;
                        a[u,v]:='.';
                        inc(dau);
                        while (a[u,v]<>'X')and(u<n) do

                        begin
                        inc(u);
                         if (a[u,v]<>'*')and(a[u,v]<>'X') then
                                begin
                                        a[u,v]:='*';
                                        push(u,v);
                                end;
                        end;
                        end;
                 if s='WEST' then
                       while dau<=cuoi1 do
                       begin
                        u:=st[dau].x;
                        v:=st[dau].y;
                        a[u,v]:='.';
                        inc(dau);
                        while (a[u,v]<>'X')and(v>1) do
                        begin
                        dec(v);
                        if (a[u,v]<>'*')and(a[u,v]<>'X') then
                         begin
                        a[u,v]:='*';
                        push(u,v);
                         end;
                        end;
                        end;
                  if s='EAST' then
                       while (dau<=cuoi1)do
                       begin
                        u:=st[dau].x;
                        v:=st[dau].y;
                        a[u,v]:='.';
                        inc(dau);
                        while (a[u,v]<>'X')and(v<m) do
                        begin
                        inc(v);
                        if (a[u,v]<>'*')and(a[u,v]<>'X') then
                         begin
                        a[u,v]:='*';
                        push(u,v);
                         end;
                        end;
                        end;
                       end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to n do
         begin
          for j:=1 to m do write(g,a[i,j]);
          writeln(g);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



