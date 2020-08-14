const   finp    =       'DC.INP';
        fout    =       'DC1.OUT';
        //DC.OUT
var     g,f     :       text;
        kq,n,m,kq1      :       longint;
        p               :       array[0..32769*2+1] of byte;
        a              :       array[0..20000] of longint;
        d,tr,res       :       array[0..20000] of longint;
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
        readln(f,n);
        for i:=1 to n do
                read(f,a[i]);
end;
procedure       sang;
var     i,j       :       longint;
begin
        m:=32768*2;
        p[1]:=1;
        fillchar(p,sizeof(p),0);
        fillchar(p,sizeof(p),0);
        for i:=2 to trunc(sqrt(m)) do
                        if p[i]=0 then
                                begin
                                    j:=i+i;
                                    while j<=m do
                                        begin
                                                p[j]:=1;
                                                j:=j+i;
                                        end;
                                end;
end;
procedure       xuly;
var     i,j       :       longint;
begin
        d[0]:=0;
        a[0]:=0;
        for i:=1 to n do
                begin
                        for j:=0 to i do
                        if p[a[i]+a[j]]=0 then
                                if d[i]<d[j]+1 then
                                        begin
                                                d[i]:=d[j]+1;
                                                tr[i]:=j;
                                        end;
                        if kq<d[i] then
                                begin
                                        kq1:=i;
                                        kq:=d[i];
                                end;
                end;
        writeln(g,kq);
        j:=0;
       if kq>0 then
       begin
       while kq1>0 do
                begin
                      inc(j);
                      res[j]:=kq1;
                      kq1:=tr[kq1];
                end;
        for i:=j downto 1 do write(g,res[i],' ');
        end;

end;
begin
        mo;
        doc;
        sang;
        xuly;
        dong;
end.
