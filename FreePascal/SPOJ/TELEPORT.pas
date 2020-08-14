const   finp    =       'TELEPORT.INP';
        fout    =       'TELEPORT.OUT';
var     g,f     :       text;
        dau,cuoi,n,m:       longint;
        a,b     :       array[1..50000] of longint;
        st,kq,kq1,dd      :       array[1..50000] of longint;
        sl      :       array[1..50000] of longint;
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
var     i       :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do
         read(f,a[i]);
        for i:=1 to m do
         read(f,b[i]);

end;
procedure       xuly;
var     i,j,l     :       longint;
begin
        // init
        dau:=1;
        cuoi:=0;
        for i:=1 to n do
         inc(sl[a[i]]);

        for i:=1 to m do
         if sl[i]=0 then
          begin
           inc(cuoi);
           st[cuoi]:=i;
          end;
        ///
        while dau<=cuoi do
         begin
           j:=st[dau];
           inc(dau);
           kq[j]:=1;
           if dd[b[j]]=0 then dec(sl[a[b[j]]]);
           if (dd[b[j]]=0)and(sl[a[b[j]]]=0) then
            begin
             inc(cuoi);
             st[cuoi]:=a[b[j]];
            end;
            dd[b[j]]:=1;
         end;
         for i:=1 to n do
          if dd[i]=0 then kq1[i]:=1;
          for i:=1 to n do write(g,kq1[i],' ');
          writeln(g);
          for i:=1 to m do write(g,kq[i],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

