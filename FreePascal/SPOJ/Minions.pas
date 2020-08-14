const   finp    =       'Minions.INP';
        fout    =       'Minions.OUT';
var     g,f     :       text;
        n,p     :       int64;
        kq      :       int64;
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
var     t,c:int64;
begin
        readln(f,n,p);
        if p*2>n then p:=n-p+1;
        if  p>1 then kq:=p*(p-1) div 2;
        t:=p*2-1;
        if n mod 2 =1 then
                begin
                        n:=n+1;
                        c:=(n-t+1)div 2;
                        kq:=kq+(((p+c-1)+p)*c) -(p+c-1);
                end
        else
                begin
                        c:=(n-t+1)div 2;
                        kq:=kq+(((p+c-1)+p)*c);
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
