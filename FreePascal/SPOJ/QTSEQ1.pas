uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        a      :       array[1..1000010] of longint;
        slmin,slmax,t,kq,maxx,minn,tong,kq1      :       int64;
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
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
        begin
         read(f,a[i]);
         tong:=tong+a[i];
        end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        maxx:=a[1];
        minn:=a[1];
        slmin:=1;
        slmax:=1;
        t:=a[1];
        for i:=2 to n do
         begin
          if kq<abs(minn-tong+t) then
           begin
            kq1:=slmin;
            kq:=abs(minn-tong+t);
           end
           else if kq=abs(minn-tong+t) then
             kq1:=kq1+slmin;
           //////////////////////////
           if kq<abs(maxx-tong+t) then
           begin
            kq1:=slmax;
            kq:=abs(maxx-tong+t);
           end
           else if (kq=abs(maxx-tong+t))and(maxx<>minn) then
             kq1:=kq1+slmax;
           t:=t+a[i];
           if maxx<t then begin maxx:=t;slmax:=1 end else
            if maxx=t then inc(slmax);
           if minn>t then begin minn:=t;slmin:=1 end else
            if minn=t then inc(slmin);
         end;
         writeln(g,kq,' ',kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

