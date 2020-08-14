const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
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
begin
end;
function        dth(x,y:diem):dt;
var     c:dt;
begin
        with c do
         begin
                a:=y.y-x.y;
                b:=x.x-y.x;
                c:=x.y*y.x-x.x*y.y;
         end;
         exit(c);
end;
function        kc(a,b:diem):extended;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
function        goc(a,b:dt):extended;
begin
        exit(a.a*b.a+a.b*b.a)/(sqrt(sqr(a.a)+sqr(a.b))*sqrt(sqr(b.a)+sqr(b.b))));
end;
function        giaodiem(x,y:dt;var tg:diem):longint;
begin
        d:=x.a*y.b-x.b*y.a;
        dx:=x.b*y.c-x.c*y.b;
        dy:=x.a*y.c-x.c*y.a;
        if d<>0 then
         begin
                tg.x:=dx/d;
                tg.y:=-dy/d;
                exit(0);
         end
        else
         begin
                if (dx=dy)and(dx=0) then exit(1);
                exit(-1);
         end;
end;
function        ccw(a,b,c:diem):longint;
var     x1,y1,x2,y2:    extended;
begin
        x1:=b.x-a.x;
        y1:=b.y-a.y;
        x2:=c.x-b.x;
        y2:=c.y-b.y;
        t:=x1*y2-x2*y1;
        if t=0 then exit(0)
         else
          if t<0 then exit(-1)
          else exit(1);
end;
function        sdagiac:extended;
var     i       :       longint;
        s       :       extended;
begin
        s:=0;
        for i:=2 to n do
         s:=s+(a[i].x-a[i-1].x)*(a[i].y+a[i-1].y);
        s:=s+(a[1].x-a[n].x)*(a[1].y+a[n].y);
        exit(abs(s)/2);
end;
begin
