const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        s       :       ansistring;
        n,p     :       longint;
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
        readln(f,n,p);
        readln(f,s);
end;
function       tinh(s1,s2:ansistring):longint;
var     i,j     :       longint;
begin
        j:=0;
        for i:=1 to length(s1) do
         j:=j+min(abs(ord(s2[i])-ord(s1[i])),25-abs(ord(s2[i])-ord(s1[i])));
        exit(j);
end;
procedure       xuly1;
var     i,j     :       longint;
begin
        h:=n div 2;
        for i:=1 to h do
         s1:=s1+s[i];
        for i:=n downto (n+1)div 2+1 do
         s2:=s2+s[i];
        kq:=tinh(s1,s2);
        kq:=kq+n div 2-1+min(p-1,
end;
procedure       xuly;
var     i,j     :       longint;
begin
        if p<=(n+1) div 2 then xuly1
        else xyly2;
end;