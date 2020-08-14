const   finp    =       '';
        fout    =       '';
                        //ograda.out.10
var     g,f     :       text;
        a,d,h       :       array[0..1010000] of longint;
        dau,c,n,k   :       longint;
        kq1,kq2 :   int64;
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
var     i       :longint;
begin
        readln(f,n,k);
        for i:=1 to n do
                read(f,a[i]);
end;
procedure       pushmax(i:longint);
begin
        while (h[i]>h[d[c]])and(c>=dau) do dec(c);
        inc(c);
        d[c]:=i;
end;
procedure       pushmin(i:longint);
begin
        while (a[i]<a[d[c]])and(c>=dau) do dec(c);
        inc(c);
        d[c]:=i;
end;
procedure       xuly;
var     i,j:longint;
begin
        doc;
        dau:=1;
        c:=0;
        for i:=n downto n-k+2 do
                        pushmin(i);
        for i:=n-k+1 downto 1 do
         begin
                pushmin(i);
                if d[dau]>i+k-1 then inc(dau);
                h[i]:=a[d[dau]];

         end;
         j:=1;
         for i:=1 to n-k+1 do
          if (j+k<=i)or(h[i]>h[j])or(a[i+k]<h[i]) then
           begin
            j:=i;
            inc(kq1);
           end;
           dau:=1;
           c:=0;
           for i:=1 to n do
            begin

            if i<=n-k+1 then pushmax(i);
               if d[dau]<i-k+1 then inc(dau);
             kq2:=kq2+a[i]-h[d[dau]];
            end;
           writeln(kq2);
           writeln(kq1+1);
end;
begin
        mo;
        xuly;
        dong;
end.
