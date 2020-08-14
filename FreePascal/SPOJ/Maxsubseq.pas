uses    math;
const   finp    =       'Maxsubseq.inp';
        fout    =       'Maxsubseq.out';
var     g,f     :       text;
        s       :       array[0..1000001] of int64;
        d       :       array[0..1000001] of longint;
        a       :       array[0..1000001] of int64;
        n,l1,l2,dau,cuoi :       longint;
        kq      :       int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n,l1,l2);

        for i:=1 to n do read(f,a[i]);

        for i:=1 to n do s[i]:=s[i-1]+a[i];
end;
procedure add(i:longint);
begin
        while (cuoi>=dau) and (s[d[cuoi]]>=s[i])do dec(cuoi);
        inc(cuoi);
        d[cuoi]:=i;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        dau:=1;
        cuoi:=0;
        kq:=s[l1];
        for i:=l1 to n do
         begin
            add(i-l1);
            kq:=max(kq,s[i]-s[d[dau]]);
            if i>=l2 then
             while d[dau]<=i-l2 do inc(dau);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

