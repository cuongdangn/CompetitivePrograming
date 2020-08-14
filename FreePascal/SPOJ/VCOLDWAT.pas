const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        a       :       array[1..1000000] of bg;
        n,dau,cuoi       :       longint;
        st,s      :       array[1..1000000] of longint;
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
var     i,k,j       :       longint;
begin
        readln(f,n,k);
        for i:=1 to k do
        readln(f,j,a[j].x,a[j].y);
end;
procedure       push(a:longint);
begin
        inc(cuoi);
        st[cuoi]:=a;
end;
procedure       bfs;
var      i,t     :       longint;
begin
        dau:=1;cuoi:=0;
        push(1);
        s[1]:=1;
        while dau<=cuoi do
          begin
                for i:=1 to cuoi-dau+1 do
                 begin
                      t:=st[dau];
                      inc(dau);
                      if (a[t].x > 0) and (a[t].y>0) then
                      begin
                      s[a[t].x]:=s[t]+1;
                      s[a[t].y]:=s[t]+1;
                      push(a[t].x);
                      push(a[t].y);
                      end;
                 end;
          end;
        for i:=1 to n do writeln(g,s[i]);
end;
begin
        mo;
        doc;
        bfs;
        dong;
end.


end;

