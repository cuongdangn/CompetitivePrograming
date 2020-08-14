const   finp    =       'SUM.INP';
        fout    =       'SUM.OUT';
var     f,g     :       text;
        a       :       array[1..1000,1..1000] of longint;
        i,j,n,max:       longint;
        kq      :       array[-1001..1001] of longint;

procedure       mo;
begin
        assign(f,finp);
        assign(g,fout);
        reset(f);
        rewrite(g);
end;
procedure       doc;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        for j:=1 to n do
                                read(f,a[i,j]);
                        readln(f);
                end;
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       xuly;
begin
        fillchar(kq,sizeof(kq),0);
        for i:=1 to n do
                for j:=1 to n do
                        kq[i-j]:=kq[i-j]+a[i,j];
        max:=-maxint;
        for i:=1-n to n-1 do if kq[i]>max then max:=kq[i];
        write(g,max);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
