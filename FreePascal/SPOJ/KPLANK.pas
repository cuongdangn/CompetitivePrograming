const   finp    =       '';
        fout    =       '';
var     n       :       longint;
        d,l,r       :       array[1..1000000] of longint;
        g,f     :text;
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
var     i       : longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,d[i]);
end;
procedure       xuly;
var     i,j,k,max:longint;
begin
        max:=0;
        for i:=1 to n do
        begin
                l[i]:=i;k:=i-1;
                while (k>0) and(d[i]<=d[k]) do
                        begin
                                l[i]:=l[k];
                                k:=l[k]-1;
                        end;
        end;
        for i:=n downto 1 do
        begin
                r[i]:=i;k:=i+1;
                while (k<=n) and(d[i]<=d[k]) do
                        begin
                                r[i]:=r[k];
                                k:=r[k]+1;
                        end;
        end;
        for i:=1 to n do
        begin
        if (d[i]>max) and (d[i] <= abs(r[i]-l[i])+1) then max:=d[i];
        end;
        writeln(g,max);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
