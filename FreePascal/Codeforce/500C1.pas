const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m     :       longint;
        kq      :       int64;
        a,st       :       array[1..1000] of longint;
        b       :       array[1..1010] of longint;
        sl,vt      :       array[1..1010] of longint;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
        for i:=1 to m do read(f,b[i]);
        j:=0;
        for i:=1 to m do
         if sl[b[i]]=0 then
          begin
                inc(j);st[j]:=b[i];
                vt[b[i]]:=j;sl[b[i]]:=1;
          end;
end;
procedure       xuly;
var     i,j,t     :       longint;
begin
        for i:=1 to m do
         begin
                t:=vt[b[i]];
                for j:=t downto 2 do
                begin
                   if j<>t then kq:=kq+a[st[j]];
                   vt[st[j-1]]:=j;st[j]:=st[j-1];
                end;
                if t<>1 then inc(kq,a[st[1]]);
                 st[1]:=b[i];vt[b[i]]:=1;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.