const   finp    =       '';
        fout    =       '';
        eps     =       1e-10;
        maxn    =       100010;
type    diem    =       record
        x,y,go,kc  :   double;
        end;
var     g,f     :       text;
        n,m       :       longint;
        b,c       :       array[1..maxn] of diem;
        a       :       array[1..maxn] of longint;
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
         read(f,a[i]);
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do
          begin
                b[i].x:=i;
                b[i].y:=a[i];
          end;
        b[n+1].x:=1;
        b[n+2].x:=n;
        n:=n+2;
end;
procedure       swap(var a,b        :       diem);
var     tg      :       diem;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
function        bang(a,b:double):boolean;
begin
        if abs(a-b)<=eps then exit(true);
        exit(false);
end;
procedure       QS(l,h:longint);
var     i,j     :       longint;
        x       :       diem;
begin
        i:=l;
        j:=h;
        x:=b[random(h-l+1) +l];
        repeat
                while (b[i].go<x.go)or(bang(b[i].go,x.go)and (b[i].kc<x.kc)) do inc(i);
                while (b[j].go>x.go)or(bang(b[j].go,x.go)and (b[j].kc>x.kc)) do dec(j);
                if i<=j then
                        begin
                                swap(b[i],b[j]);
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
        if j>l then QS(l,j);
        if i<h then QS(i,h);
end;
function        kc(a,b:diem):double;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
function        ccw(a,b,c:diem):longint;
var     c1,d,e,f,t1 :       double;
begin
        c1:=b.x-a.x;
        d:=b.y-a.y;
        e:=c.x-b.x;
        f:=c.y-b.y;
        t1:=c1*f-d*e;
        if t1<0 then exit(1);
        if t1>0 then exit(-1);
        exit(0);
end;

procedure       timbaoloi;
var     i,j     :       longint;
begin
        swap(b[1],b[n-1]);
        for i:=2 to n do
          begin
                b[i].go:=(b[i].x-b[1].x)/kc(b[1],b[i]);
                b[i].kc:=kc(b[1],b[i]);
          end;
        randomize;
        QS(2,n);
        c[1]:=b[1];
        c[2]:=b[2];
        m:=2;
        for i:=3 to n do
         begin
                while (m>=2)and(ccw(c[m-1],c[m],b[i])<0) do dec(m);
                inc(m);
                c[m]:=b[i];
         end;
      //   for i:=1 to n do writeln(c[i].x:0:0,' ',c[i].y:0:0);
end;
function        tinh(i,x:longint):double;
var     tg      :       diem;
begin
        tg.x:=0;
        tg.y:=x;
        exit((x-c[i].y)/kc(c[i],tg));
end;
procedure       xuly;
var     i,t,luu,x       :       longint;
        dau,giua1,giua2,cuoi    :       longint;
        t1,t2   :       double;
begin
        init;
        timbaoloi;
        readln(f,t);
        for i:=1 to t do
         begin
                read(f,x);
                dau:=1;cuoi:=m;
                luu:=1;
                while (dau<cuoi) do
                 begin
                        giua1:=dau+(cuoi-dau) div 3;
                        giua2:=cuoi-(cuoi-dau) div 3;
                        t1:=tinh(giua1,x);
                        t2:=tinh(giua2,x);
                        if t1>=t2 then
                         begin
                                luu:=giua2;
                                dau:=giua1+1;
                         end
                        else
                         begin
                                luu:=giua1;
                                cuoi:=giua2-1;
                         end;
                 end;
                 writeln(g,c[luu].x/(c[luu].y-x):0:6);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
