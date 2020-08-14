const   finp    =       'DECODE.INP';
        fout    =       'DECODE.OUT';
var     g,f     :       text;
        k,i       :       byte;
        s       :       string;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
        readln(f,k);
        readln(f,s);
        for i:=1 to length(s) do
         begin
                if ord(s[i])-k<65 then write(g,char(90-(64-ord(s[i])+k)))
                else write(g,char(ord(s[i])-k));
         end;
        close(f);
        close(g);
end.