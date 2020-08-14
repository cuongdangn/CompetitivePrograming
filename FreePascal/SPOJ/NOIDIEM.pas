const   finp   =       'NOIDIEM.INP';
        fout   =       'NOIDIEM.OUT';
var     g,f     :text;
        a,p,d   :        array[0..1000000] of longint;
        n       :longint;
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
var     i:longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,j,k,cs:longint;
begin
        d[0]:=0; a[0]:=-1000000;
        p[0]:=0; a[n+1]:=1000000;
        for i:=1 to n+1 do
                begin
                        k:=0;
                        for j:=i-1 downto 1 do
                         if (a[j]<a[i])and(d[k]<d[j]) then k:=j;
                         d[i]:=d[k]+1;
                         p[i]:=k;
                end;
        writeln(g,d[n+1]-1);
        cs:=n+1;
        while cs>0 do
        begin
                cs:=p[cs];
                d[cs]:=-d[cs];
        end;
        for i:=1 to n do if d[i]<0 then write(g,a[i],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
