const   finp    =       'CAR.INP';
        fout    =       'CAR.OUT';
var     g,f     :       text;
        d       :       array[0..1000] of real;
        luu,kq,w,v     :       array[0..1000] of longint;
        n,p,l   :  longint;
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
var     i:longint;
begin
        readln(f,n,p,l);
        for i:=1 to n do readln(f,w[i],v[i]);
end;
function        cc(a:longint):longint;
var i,j:longint;
begin
       i:=a;j:=w[a];
       while ( j<=p )and(i>0) do
       begin
                dec(i);
                inc(j,w[i]);
       end;
       cc:=i+1;
end;
function        min(i,j:longint):longint;
var     a,b:longint;
begin
        a:=i;
        for b:=i+1 to j do if v[b]<v[a] then a:=b;
        min:=v[a];
end;
procedure       QHD;
var   i,j,k:longint;t:real;
begin
        d[1]:=l/v[1];d[0]:=0;luu[0]:=0; luu[1]:=0;
        for i:=2 to n do
        begin
                k:=cc(i);
                d[i]:=10000000000;
                for j:=i downto k do
                begin
                        t:=l/min(j,i);
                        if d[j-1]+t<d[i] then
                        begin
                                d[i]:=t+d[j-1];
                                luu[i]:=j;
                        end;
                end;
        end;
end;
procedure       xuat;
var     u,v:longint;
begin
        writeln(g,d[n]:0:2);
       u:=n;v:=0;
        while u>0 do
        begin
        inc(v);
        kq[v]:=u;
        u:=luu[u]-1;
        end;
for u:=v downto 1 do write(g,kq[u],' ');
end;
begin
        mo;
        doc;
        QHD;
        xuat;
        dong;
end.
