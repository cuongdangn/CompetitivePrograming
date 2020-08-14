const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..1000010] of longint;
        kq      :       int64;
        dem,dem1        :       int64;
        luu     :       array[1..1000010] of int64;
        m,k       :       longint;
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
        readln(f,n,k);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,j     :       longint;
        t       :       int64;
begin
        for i:=1 to n do
         if a[i]<k then begin inc(dem);inc(dem1) end
          else
         if a[i]=k then
          begin
           inc(m);
           luu[m]:=dem;
           dem:=0;
           dem1:=dem1+1;
          end
         else
          begin
            t:=-1;
            for j:=1 to m do
            begin
            t:=t+luu[j]+1;
             kq:=kq+(luu[j]+1)*(dem1-t);
             end;
             m:=0;
             dem:=0;
             dem1:=0;
          end;
          t:=-1;
           for j:=1 to m do
            begin
            t:=t+luu[j]+1;
             kq:=kq+(luu[j]+1)*(dem1-t);
             end;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.