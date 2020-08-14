uses    math;
const   finp    =       'SETNJA.INP';
        fout    =       'SETNJA.OUT';

var     g,f     :       text;
        n       :       int64;
        kq,nho  :       int64;
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
{function       add(a,b:bignum):bignum;
var     c:     bignum;
        n,i:longint;
        x,nho   :       int64;
begin
        fillchar(c,sizeof(c),0);
        n:=max(a[0],b[0]);
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
        exit(c);
end;
function       nhan(a:bignum;b:longint):bignum;
var     c      :        bignum;
        i,n  :        longint;
        x,nho   :     int64;
begin
        fillchar(c,sizeof(c),0);
        n:=a[0];
        for i:=1 to n do
                begin
                        x:=a[i]*b+nho;
                        nho:=x div cs;
                        c[i]:=x mod cs;
                end;
        if nho>0 then
                begin
                        inc(n);
                        c[n]:=nho;
                end;
                c[0]:=n;
        exit(c);
end;}

procedure      doc;
var     i,n      :        longint;
        c:     char;
        s       :string;
begin
        nho:=1;
        kq:=nho;
      while not seekeof(f) do
        begin
         read(f,c);
         if c='L' then kq:=kq*2
         else if c='P' then begin end
         else if c='R' then kq:=kq*2+nho
         else
                begin
                        kq:=kq*5+nho;
                        nho:=nho*3;
                end;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
