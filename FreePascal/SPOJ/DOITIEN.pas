const   finp    =       'DNC.inp';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        a,d,luu,b       :       array[0..10000] of longint;
        m,n     :longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
        fillchar(b,sizeof(b),0);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i:longint;
begin
        read(f,n,m);
        for i:=1 to n do read(f,a[i]);
end;
procedure       QHD;
var     i,j,u:longint;
begin
        for i:=1 to n do
        begin
                d[a[i]]:=1;
                luu[a[i]]:=i;
        end;
        for i:=1 to m do
        for j:=1 to n do
                if i>a[j] then
                 begin
                    u:=i-a[j];
                    if (d[u]<>0)and((d[i]=0)or(d[i]>d[u]+1)) then
                     begin
                        d[i]:=d[u]+1;
                        luu[i]:=j;
                     end;
                 end;
end;
procedure       xuat;
var     i,j:longint;
begin
        if d[m]=0 then write(g,0) else
        begin
                writeln(g,d[m]);
                i:=m;
                while i<>0 do
                begin
                        inc(b[luu[i]]);
                        i:=i-a[luu[i]];
                end;
        for j:=1 to n do write(g,b[j],' ');
        end;
end;
begin
        mo;
        doc;
        QHD;
        xuat;
        dong;
end.

