const   finp    =       '';
        fout    =       '';
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
procedure       doc;
var     i       :       longint;
begin
        readln(f,a);
        while a>0 do
         begin
                inc(n);
                b[n]:=a mod 10;
                a:=a div 10;
         end;
        for i:=1 to n do
         if (b[i]=4) then b[i]:=1
         else b[i]:=2;
end;
function       duyet(i:longint;ok:boolean):longint;
var     dem,cu    :        longint;
begin
        if (i=0) then exit(1);
        if d[i][ok]<>-1 then exit(d[i][ok]);
        if ok then cu:=2;
        dem:=0;
        for j:=0 to cu do
         dem:=dem+duyet(i-1,ok or (j<b[i]));
         d[i][ok]:=dem;
        exit(dem);
end;