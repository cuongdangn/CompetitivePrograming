const   finp    =       'CUBES.INP';
        fout    =       'CUBES.OUT';
        base    =       111539786;
var     g,f     :       text;
        n       :       int64;
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
procedure       xuly(n:int64);
var     t1,t2,t3        :       int64;
        kq      :       int64;
begin
        kq:=(4*n*(sqr(n+1) mod base)mod base+2*(n+1)*(1-n) mod base-1)mod base;
        t1:=n+1;
        t2:=2*n+1;
        t3:=n;
        if t1 mod 3=0 then t1:=t1 div 3
        else if t2 mod 3=0 then t2:=t2 div 3
        else t3:=t3 div 3;
        kq:=(kq-((4*t1*t2)mod base)*t3)mod base;
        writeln(g,(kq+base)mod base);
end;

procedure       doc;
var     i,j     :       longint;
begin
        while not seekeof(f) do
         begin
          readln(f,n);
          xuly(n);
         end;
end;
begin
        mo;
        doc;
        dong;
end.
