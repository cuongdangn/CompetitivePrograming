const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,k     :       longint;
        a,sum,d       :       array[0..2000000] of longint;
        dau,cuoi      :       longint;

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
var     c:char;i:longint;
begin
        readln(f,n,k);
        for i:=1 to n do
                begin
                        read(f,c);
                        if c='1' then sum[i]:=sum[i-1]+1 else
                        sum[i]:=sum[i-1];
                end;
end;
procedure       xuly;
var     i,j:longint;
begin

        dau:=1;
        cuoi:=0;
        while (cuoi>=dau)and(a[d[cuoi]]>=a[0]) do dec(cuoi);
        inc(cuoi);
        d[cuoi]:=0;
        for i:=1 to n do
        begin
        a[i]:=sum[i]-a[d[dau]];
        while (cuoi>=dau)and(a[d[cuoi]]>=a[i]) do dec(cuoi);
        inc(cuoi);
        d[cuoi]:=i;
        if i>=k then
        if d[dau]<i-k+1 then inc(dau);
        end;
        if 2*a[n]=sum[n] then writeln(g,'NO')
        else
        begin
        writeln(g,'YES');
        if a[n]>sum[n]-a[n] then writeln(g,sum[n]-a[n])
        else writeln(g,a[n]);
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
