const   finp    =       'VDU3.INP';
        fout    =       'VDU3.OUT';
var     a       :array[0..10000] of byte;
        b       :array[1..10000] of longint;
        n,n1       :       longint;
        g,f     :       text;
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
        readln(f,n1);
        while not seekeof(f) do
        begin
                inc(n);
                read(f,b[n]);
        end;
        a[0]:=1;
        for i:=1 to n1 do
                begin
                      a[i]:=1;
                      for j:=1 to n do
                        if i>=b[j] then
                        if a[i-b[j]]=1 then
                        begin
                                a[i]:=0;
                                break;
                        end;
                      if a[i]=1 then write(g,i,' ');
                end;
        writeln(g,1-a[n1])

end;
begin
        mo;
        doc;
        dong;
end.