uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :text ;
        d       :array[0..5000001] of longint;
        vt      :       array['A'..'Z'] of longint;
        s       :       ansistring;
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
begin
        readln(f,s);
        while s[1]=' ' do delete(s,1,1);
end;
procedure       xuly;
var     i,n     :       longint;
begin
        d[1]:=2;
        n:=length(s);
        vt[s[1]]:=1;
        for i:=2 to n do
                begin
                 if vt[s[i]]=0 then  d[i]:=d[i-1]+2
                 else d[i]:=min(d[i-1]+2,d[vt[s[i]]]+2*(i-vt[s[i]]-1)+1);
                 vt[s[i]]:=i;
                end;
        writeln(g,d[n])
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
