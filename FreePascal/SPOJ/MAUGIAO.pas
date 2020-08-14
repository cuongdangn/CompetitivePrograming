uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..20,1..20] of longint;
        d,sc       :       array[0..1048577] of int64;
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
        readln(f,n);
        for i:=1 to n do
         for j:=1 to n do read(f,a[i,j]);
end;
function        tinh(i,t:longint):int64;
var     dem,sc1     :       int64;
        j       :       longint;
begin
        if i=n+1 then begin sc[t]:=1;exit(0);end;
        if d[t]<>-1 then exit(d[t]);
        dem:=0;
        sc1:=0;
        for j:=1 to n do
         if (t shr (j-1) and 1)=0 then
            if dem<tinh(i+1,t or (1 shl (j-1)))+a[i,j] then begin dem:=tinh(i+1,t or (1 shl (j-1)))+a[i,j];sc1:=sc[t or (1 shl (j-1))]end
         else if dem=tinh(i+1,t or (1 shl (j-1)))+a[i,j] then sc1:=sc1+sc[t or (1 shl (j-1))];
        d[t]:=dem;
        sc[t]:=sc1;
        exit(dem);
end;
procedure       xuly;
var     i,j     :       longint;
        kq      :       int64;
begin
         for j:=0 to 1 shl n-1 do d[j]:=-1;
        kq:=tinh(1,0);
        writeln(g,kq,' ',sc[0]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


