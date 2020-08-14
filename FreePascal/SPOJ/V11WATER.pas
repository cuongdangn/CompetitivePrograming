const   finp    =       '';
        fout    =       '';
var     n       :       longint;
        g,f     :   text;
        a,max1,max2       :   array[0..100001] of longint;
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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
function        max(a,b:longint):longint;
begin
        max:=(abs(a-b)+a+b) div 2;
end;
function        min(a,b:longint):longint;
begin
        min:=(-abs(a-b)+a+b) div 2;
end;
procedure       xuly;
var     i,m       :       longint;
        t       :       int64;
begin
        t:=0;
        for i:=1 to n do max1[i]:=Max(max1[i-1],a[i]);
        for i:=n downto 1 do max2[i]:=max(max2[i+1],a[i]);
        for i:=1 to n do
        begin
        m:=min(max1[i],max2[i]);
        if m>a[i] then t:=t+m-a[i];
        end;
        writeln(g,t);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.