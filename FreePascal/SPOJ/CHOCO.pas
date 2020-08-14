const   finp    =       'CHOCO.INP';
        fout    =       'CHOCO.OUT';
var     g,f     :       text;
        k       :       longint;
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
var     i,l,r,t       :       longint;
begin

        readln(f,k);
        t:=k; r:=0;l:=0;
        while t>1 do
                begin
                        if t mod 2=1 then break;
                        inc(r);
                        t:= t div 2;
                end;
        t:=k;
        while t>1 do
        begin
                inc(l);
                t:=t div 2;
        end;
        if l=r then writeln(g,1 shl r,' ',0)
        else writeln(g, 1 shl (l+1),' ',l-r+1);
end;
begin
        mo;
        doc;
        dong;
end.

end;


