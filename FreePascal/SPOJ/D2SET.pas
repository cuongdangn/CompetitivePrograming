const   finp    =       'D2SET.INP';
        fout    =       'D2SET.OUT';

var     g,f     :       text;
        n,k,dem       :       int64;
        a       :       array[1..1000000] of int64;
        d,sl       :       array[1..1000000] of int64;

        tong,sc    :       int64;
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
procedure       QS(l,h:int64);
var     i,j,tg,x        :       int64;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2];
        repeat
                while x>a[i] do inc(i);
                while x<a[j] do dec(j);
                 if i<=j then
                 begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function          chat(x,i,j:int64):int64;
var     d,c,m     :       int64;
begin
        d:=i;
        c:=j;
        while d<=c do
                begin
                        m:=(d+c) div 2;
                        if a[m]=x then exit(m);
                        if a[m]<x then d:=m+1
                        else c:=m-1;
                end;
        exit(0);
end;
procedure       sub2;
var     i,j:longint;
        t:int64;
begin
        fillchar(d,sizeof(d),0);
        QS(1,n);
        dem:=0;
        for i:=1 to n do
                if d[i]=0 then
                begin
                      inc(dem);
                      sl[dem]:=1;
                      d[i]:=DEM;
                      j:=i;
                      t:=a[i]*2;
                      repeat

                             j:=chat(t,j+1,n);
                             if j>0 then
                                begin
                                        inc(sl[dem]);
                                        d[j]:=DEM;
                                        T:=T*2;
                                end;

                      until     j=0;
                END;
                      sc:=1;
                      TONG:=0;
                for i:=1 to dem do
                        begin
                                if sl[i] mod 2=1 then
                                begin
                                tong:=tong+sl[i] div 2 +1;
                                end
                                else
                                begin
                                tong :=tong+sl[i] div 2;
                                sc:=(sc mod k)*(((SL[I]+2) div 2)mod k) mod k;
                                end;
                        end;
                writeln(g,tong,' ',sc);
end;
function        g1(m:longint):longint;
var  ti:longint;
        kq:int64;
begin
       ti:=m;
       kq:=0;
       while ti<=n do
        begin

                inc(kq);

                ti:=ti*2;
        end;

        exit(kq);

end;
function          chat2(x,i,j:longint):longint;
var     d,c,m,kq     :       longint;
begin
        d:=i;
        c:=j;
        while d<=c do
                begin
                        m:=(d+c) div 2;
                        if m mod 2=0 then m:=m+1;
                        if g1(m)<=x then
                        begin
                                kq:=m;
                                d:=m+1;
                        end
                        else c:=m-1;
                end;
       if kq mod 2=0 then exit(kq-1) else exit(kq);
end;
function       pow(a,b:longint):int64;
var     m:int64;
begin
        if b=1 then exit(a mod k);
        m:=pow(a,b div 2) mod k;
        m:=m*m mod k;
        if b mod 2 =1 then m:=m*a mod k;
        exit (m);
end;
procedure       sub3;
var     i,j     :longint;
        t       :       int64;
begin
        i:=1;  sc:=1;     tong:=0;
        while i<=n do
        begin
        j:=chat2(g1(i),i,n);
        t:=g1(i);
        if j>n then  j:=i;
        if t mod 2 = 1 then
                begin
                        tong:=tong+t div 2+1;
                end
                else
                        BEGIN
                                tong:=tong+g1(i) div 2;
                                sc:=(sc mod k)*pow(((t+2)div 2),(j-i)div 2 +1) mod k;
                        END;
                I:=J+2;
        end;
        writeln(g,tong,' ',sc);
end;
procedure       doc;
var     i:longint;
begin
        readln(f,n,k);
        if seekeof(f) then sub3 else
                begin
                for i:=1 to n do read(f,a[i]);
                sub2;
                end;
end;
begin
        mo;
        doc;
        dong;
end.
