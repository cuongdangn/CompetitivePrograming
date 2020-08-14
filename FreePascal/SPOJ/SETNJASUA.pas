{$MODE OBJFPC}
uses    math;
const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
        cs    =      1000000000000000;
        sl    =         15;
type    bignum     =       array[0..5000] of int64;
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
function       add(a,b:bignum):bignum;
var     c:     bignum;
        n,i:longint;
        x,nho   :       int64;
begin
        n:=max(a[0],b[0]);
        nho:=0;
        for i:=1 to n do
                begin
                      x:=a[i]+b[i]+nho;
                      nho:=x div cs ;
                      c[i]:=x mod cs;
                end;
       while nho>0 do
                begin
                        inc(n);
                        c[n]:=nho mod cs;
                        nho:=nho div cs
                end;
                c[0]:=n;
        exit(c);
end;
function       nhan(a:bignum;b:int64):bignum;
var     c      :        bignum;
        i,n  :        longint;
        x,nho   :     int64;
begin

        n:=a[0];
        nho:=0;
        for i:=1 to n do
                begin
                        x:=int64(a[i]*b)+nho;
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
        exit(c);
end;

procedure      doc;
var     i,n      :        longint;
        c:     char;
        s       :string;
begin
        nho[0]:=1;
        nho[1]:=1;
        kq:=nho;
      while not seekeof(f) do
        begin
         read(f,c);
         if c='L' then kq:=nhan(kq,2)
         else if c='R' then
         begin
         kq:=nhan(kq,2);
         kq:=add(kq,nho);
         end
         else
          if c='*' then
                begin
                        kq:=nhan(kq,5);
                        kq:=add(kq,nho);
                        nho:=nhan(nho,3);
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




