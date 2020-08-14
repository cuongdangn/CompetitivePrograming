const   finp    =       '';
        fout    =       '';
        cs    =      10000000000000000;
        sl    =         16;
type    bignum     =       array[0..440] of int64;
var     g,f     :       text;
        kq,nho  :       bignum;
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
procedure       add(var a,b:bignum;var c:bignum);
var
        n,i:longint;
        x,nho   :       int64;
begin
        n:=a[0];
        nho:=0;
        for i:=1 to n do
                begin
                      x:=a[i]+b[i]+nho;
                      nho:=x div cs ;
                      c[i]:=x mod cs;
                end;
        if nho>0 then
                begin
                        inc(n);
                        c[n]:=nho;
                end;
                c[0]:=n;

end;
procedure       nhan(a:bignum;b:longint;var c:bignum);
var
        i,n  :        longint;
        x,nho   :     int64;
begin
        n:=a[0];
        nho:=0;
        for i:=1 to n do
                begin
                        x:=a[i]*b+nho;
                        nho:=x div cs;
                        c[i]:=x mod cs;
                end;
        while nho>0 do
                begin
                        inc(n);
                        c[n]:=nho mod cs;
                        nho:=nho div cs
                end;
                c[0]:=n;
end;
procedure      doc;
var     i,n      :        longint;
        c:     char;
        s       :string;
begin
        nho[0]:=1;
        nho[1]:=1;
        kq[0]:=1;
        kq[1]:=1;
      while not seekeof(f) do
        begin
         read(f,c);
         if c='L' then nhan(kq,2,kq)
         else if c='R' then
         begin
         nhan(kq,2,kq);
         add(kq,nho,kq);
         end
         else
          if c='*' then
                begin
                       nhan(kq,5,kq);
                        add(kq,nho,kq);
                        nhan(nho,3,nho);
                end;
         end;
         n:=kq[0];
         write(g,kq[n]);
         for i:=n-1 downto 1 do
                begin
                        str(kq[i],s);
                        while length(s)<sl do s:='0'+s;
                        write(g,s);
                end;

end;
begin
        mo;
        doc;
        dong;
end.



