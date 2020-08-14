const   finp    =       'PUZZLES.INP';
        fout    =       'PUZZLES.OUT';
var     g,f     :       text;
        n,res       :       longint;
        s       :       string;
        d       :       array['a'..'z','a'..'z'] of int64;
procedure       mo;
begin
        assign(f,finp);reset(F);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
function        max(a,b:int64):int64;
begin
        if a>b then exit(a);
        exit(b);
end;
procedure      xuly;
var     i     :longint;
        j     : char;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        readln(f,s);
                        for j:='a' to 'z' do
                        if d[j,s[1]]<>0 then
                         begin
                         d[j,s[length(s)]]:=max(d[j,s[length(s)]],d[j,s[1]]+length(s));
                         res:=max(res,d[j,s[length(s)]]);
                         end;
                         d[s[1],s[length(s)]]:=max( d[s[1],s[length(s)]],length(s));
                         res:=max(res, d[s[1],s[length(s)]]);
                end;
                writeln(g,res);
end;
begin
        mo;
        xuly;
        dong;
end.