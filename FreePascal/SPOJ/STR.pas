const   finp    =       'STR.INP';
        fout    =       'STR.OUT';
var     g,f     :       text;
        s       :       ansistring;
        k       :       longint;
        d       :       array[0..1000001] of longint;
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
var     i,l,t,kq       :longint;
begin
        readln(f,k);
        readln(f,s);
        l:=length(s);
        kq:=0;
        t:=0;
        d[k]:=1;
        for i:=1 to l do
                begin
                        if s[i]='1' then t:=t+1;
                        kq:=kq+d[t];
                        inc(d[t+k]);
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
