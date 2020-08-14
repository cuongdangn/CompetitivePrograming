uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        maxc    =       1000000;

var     a     :array[0..50001] of longint;
        n       :       longint;
        res   :       longint;
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
var     i,u,v,k       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                read(f,a[i]);

end;
procedure       xuly;
var     i,q,s,j       :       longint;
        u,v       :       longint;
begin
        readln(f,q);
        for i:=1 to q do
         begin
         readln(f,u,v);
         res:=-maxc;  s:=0;
        For j:=u to v do
	Begin
		s:=s+a[j];
		res:=max(res,s);
		If s<0 then s:=0;
	End;
         writeln(g,res);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.