CONST   FINP    =       'cows.inp';
        fout    =       'cows.out';
var     g,f     :       text;
        a      :       array[0..2*100000+1] of longint;
        sl,n   :       longint;
        tb      :       real;
        tong                    :       int64;
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
procedure       xuly;
var     i,m,k,p       :longint;
begin
        readln(f,n);
        sl:=1;
        for i:=1 to n do
                begin
                        read(f,m);
                        if m=1 then
                                begin
                                        read(f,k,p);
                                        a[k]:=a[k]+p;
                                        if k>sl then sl:=k;
                                        tong:=tong+k*p;
                                end;
                        if m=2 then
                               begin
                                        read(f,k);
                                        inc(sl);
                                        a[sl]:=a[sl]+k;
                                        a[sl-1]:=a[sl-1]-k;
                                        tong:=tong+k;
                                end;
                        if m=3 then
                                begin
                                        a[sl]:=a[sl]+a[sl+1];
                                        tong:=tong-a[sl];
                                        dec(sl);
                                end;
                        tb:=tong/sl;
                        writeln(g,tb:0:6);
end;
end;
begin
        mo;
        xuly;
        dong;
end.

