const   finp    =       'SUB.INP';
        fout    =       'SUB.OUT';
var     g,f     :       text;
        s   :       ansistring;
        kq  :       array[0..1000000] of char;
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
var     l,n,i:longint;
begin
        readln(f,s);
        n:=length(s);
        l:=1;
         for i:=1 to n do
               begin
                while (s[i]>kq[l])and(l>=1) do dec(l);
                inc(l);
                kq[l]:=s[i];
               end;
         for i:=1 to l do write(g,kq[i]);
end;
begin
        mo;
        doc;
        dong;
end.