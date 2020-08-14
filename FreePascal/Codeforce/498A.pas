const   finp    =       '';
        fout    =       '';
        eps     =       1e-6;
type    die     =       record
        x,y     :       double;
        end;
var     g,f     :       text;
        diem    :       array[1..2] of die; n       :       longint;
        a,b,c   :       array[0..3000] of double;
procedure       mo;
begin
        assign(f,finp); reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,diem[1].x,diem[1].y);
        readln(f,diem[2].x,diem[2].y);
        readln(f,n);
        for i:=1 to n do
                readln(f,a[i],b[i],c[i]);
end;
function        diemgiao(i:longint):die;
var    tg       :       die;
begin
        tg.y:=(c[i]*a[0]-a[i]*c[0])/(a[i]*b[0]-b[i]*a[0]);
        tg.x:=(c[i]*b[0]-b[i]*c[0])/(b[i]*a[0]-b[0]*a[i]);
        exit(tg);
end;
function        kc(a,b  :       die):double;
begin
        exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
function        bang(a,b        :       double):boolean;
begin
        if abs(a-b)<=eps then exit(true)
        else exit(false);
end;
procedure       xuly;
var     i,j,kq     :       longint;
        tg      :  die;
begin
        a[0]:=diem[2].y-diem[1].y;
        b[0]:=diem[1].x-diem[2].x;
        c[0]:=diem[1].y*diem[2].x-diem[1].x*diem[2].y;
        kq:=0;
        for i:=1 to n do
         begin
                if abs(a[0]*b[i]-b[0]*a[i])<=eps then continue;
                tg:=diemgiao(i);
                if bang(kc(tg,diem[1])+kc(tg,diem[2]),kc(diem[1],diem[2])) then inc(kq);
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
