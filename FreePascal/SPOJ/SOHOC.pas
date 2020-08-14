function        UCLN(a,b:longint);
var     m,n,r   :       longint;
begin
        m:=a;
        n:=b;
        while n<>0 do
         begin
                r:=m mod n;
                m:=n;
                n:=r;
         end;
         exit(m);
end;
//tim nghiem nguyen phuong trinh ax+by=d=UCLN(a,b);
procedure        nghiem(a,b:longint);
var     r,q,n,m,x,y,xn,yn,xm,ym,xr,yr :longint;
begin
        m:=a;
        n:=b;
        xm:=1;
        ym:=0;
        xn:=0;
        yn:=1;
        while n<>0 do
         begin
                q:=m div n;
                r:=m-n*q;
                m:=n;
                n:=r;
                xr:=xm-xn*q;
                yr:=ym-yn*q;
                xm:=xn;
                ym:=yn;
                xn:=xr;
                yn:=yr;
         end;
         writeln(g,xm,' ',ym);
end;
//C[i,j]=c[i-1,j-1]+c[i,j-1]
procedure       sang(n:longint);
var     i,j     :       longint;
begin
        for i:=2 to n do
         if p[i]=0 then
          begin
                j:=i+i;
                while j<=n do
                 begin
                        p[j]:=i;
                        j:=j+i;
                 end;
          end;
end;