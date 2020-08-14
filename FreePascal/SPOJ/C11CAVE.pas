const   finp    =       '';
        fout    =       '';
var     f,g     :       text;
        d       :      array[0..500001] of longint;
        n,h     :      longint;
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
procedure       xuly;
var     i,t,kq1,kq2       :       longint;
begin
        readln(f,n,h);
        kq1:=maxlongint;
        kq2:=0;
        for i:=1 to n do
         begin
                readln(f,t);
                if i mod 2=1 then
                 begin
                        d[1]:=d[1]+1;
                        d[t+1]:=d[t+1]-1;
                 end
                 else
                 begin
                        d[h-t+1]:=d[h-t+1]+1;
                        d[h+1]:=d[h+1]-1;
                 end;
         end;
         for i:=1 to h do
         begin
                d[i]:=d[i]+d[i-1];
                if d[i]<kq1 then
                 begin
                        kq1:=d[i];
                        kq2:=1;
                 end
                 else if d[i]=kq1 then
                  inc(kq2);
         end;
         writeln(g,kq1,' ',kq2);
end;
begin
        mo;
        xuly;
        dong;
end.
