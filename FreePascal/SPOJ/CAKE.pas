const   finp    =       'CAKE.INP';
        fout    =       'CAKE.OUT';
type    toado   =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        a       :       array[0..3001] of toado;
        n       :longint;
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
        for i:=1 to n do
                        readln(f,a[i].x,a[i].y);
        for i:=n+1 to 2*n do a[i]:=a[i-n];
end;
function       S(a,b,c:toado):real;
var     s1      :       real;
begin
        s1:=abs((b.x-a.x)*(c.y-a.y)-(b.y-a.y)*(c.x-a.x))/2;
        exit(abs(s1));
end;
procedure       xuly;
var     i,j,ii,jj       :longint;
        kq,max1,max2      :       real;
begin
        ii:=2;
        jj:=4;
        kq:=-1;
        for i:=1 to n-2 do
        begin
        ii:=i+1;
        jj:=i+3;
         for j:=i+2 to n do
                begin
                    if ii<=i then ii:=i+1;
                    if jj<=j then jj:=j+1;
                    max1:=S(a[i],a[ii],a[j]);
                    inc(ii);
                    while (S(a[i],a[ii],a[j])>max1)and(ii<j) do
                        begin
                                max1:=s(a[i],a[ii],a[j]);
                                inc(ii);
                        end;
                    dec(ii);
                    max2:=S(a[i],a[j],a[jj]);
                    inc(jj);
                    while (S(a[i],a[j],a[jj])>max2)and(jj<i+n) do
                        begin
                                max2:=s(a[i],a[j],a[jj]);
                                inc(jj);
                        end;
                    dec(jj);
                    if max1+max2>kq then kq:=max1+max2;
                end;
         end;
        writeln(g,kq:0:1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
