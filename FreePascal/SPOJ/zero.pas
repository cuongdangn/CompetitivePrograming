program zero;
uses    math;
const   finp    =       'zero.inp';
        fout    =       'zero.out';
var     g,f     :       text;
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
procedure       luu(s:string);
var     i,n,kq     :       longint;
        s1       :       string;
begin
        n:=length(x);
        for i:=1 to n do
                begin
                        s1:='';
                        while ((s[i]>='0')and(s[i]<='9'))and(i<=n)do
                              begin
                                s1:=s1+s[i];
                                inc(i);
                              end;

                end;
procedure       doc;
var     i,j     :       longint;
begin



