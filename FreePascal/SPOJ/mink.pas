const   finp    =       '';
        fout    =       '';
var     g,f      :       text;
        n,k,dau,cuoi       :       longint;
        q       :array[1..20000] of longint;
        a       :       array[1..20000] of longint;
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
procedure       push(i:longint);
begin
        while (cuoi>=dau)and(a[i]<=a[q[cuoi]]) do dec(cuoi);
        inc(cuoi);
        q[cuoi]:=i;
end;
procedure doc;
var     i :     longint;
begin
        readln(f,n,k);
        dau:=1;
        cuoi:=0;
        for i:=1 to n do
                read(f,a[i]);
                readln(f);
        q[dau]:=1;
        for i:=1 to n do
         begin
                push(i);
                if i>K then if i-q[dau]+1>k then inc(dau);
                if i>=k then write(g,a[q[dau]],' ');
         end;
         writeln(g);
end;
procedure       xuly;
var     t,i     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
                doc;
         end;
end;
begin
        mo;
        xuly;
        dong;
end.