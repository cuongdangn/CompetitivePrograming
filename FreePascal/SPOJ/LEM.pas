uses    math;

const   fi='';
        fo='';

type    Point=record
                x,y:longint;
                end;
        Line=record
                p1,p2:point;
                end;

var     f:text;
        n,m:longint;
        a:array[0..1001] of point;
        b:array[0..1001] of point;
        t,s:array[0..1001] of line;

procedure input;
var     i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to n do
            begin
                readln(f,a[i].x,a[i].y);
                s[i-1].p2:=a[i];
                s[i].p1:=a[i];
            end;
        for i:=1 to m do
            begin
                readln(f,b[i].x,b[i].y);
                t[i-1].p2:=b[i];
                t[i].p1:=b[i];
            end;
        close(f);
end;

function kc(i,j:point):double;
begin
        kc:=sqrt(sqr(i.x-j.x)+sqr(i.y-j.y));
end;

procedure extract(p1,p2:Point;var a,b,c:double);
begin
        a := p1.y-p2.y;
        b := p2.x-p1.x;
        with p1 do c:=-(a*x+b*y);
end;

procedure process;
var     i,j:longint;
        res,d,ab,ac,bc,cosB,cosC,aa,bb,cc:real;
begin
        res:=30000;
        for i:=1 to m do
            for j:=1 to n-1 do
                begin
                     bc:=kc(s[j].p1,s[j].p2);
                     ab:=kc(s[j].p1,b[i]);
                     ac:=kc(s[j].p2,b[i]);
                     cosB:=(sqr(ab)+sqr(bc)-sqr(ac))/(2*ab*bc);
                     cosC:=(sqr(ac)+sqr(bc)-sqr(ab))/(2*ac*bc);
                     if ((cosB>=0)and(cosC>0))or((cosB>0)and(cosC>=0)) then
                        begin
                             extract(s[j].p1,s[j].p2,aa,bb,cc);
                             d:=(abs(aa*b[i].x+bb*b[i].y+cc))/(sqrt(sqr(aa)+sqr(bb)));
                             res:=min(res,d);
                        end
                     else res:=min(res,min(ab,ac));
                end;
        for i:=1 to n do
            for j:=1 to m-1 do
                begin
                     bc:=kc(t[j].p1,t[j].p2);
                     ab:=kc(t[j].p1,a[i]);
                     ac:=kc(t[j].p2,a[i]);
                     cosB:=(sqr(ab)+sqr(bc)-sqr(ac))/(2*ab*bc);
                     cosC:=(sqr(ac)+sqr(bc)-sqr(ab))/(2*ac*bc);
                     if ((cosB>=0)and(cosC>0))or((cosB>0)and(cosC>=0)) then
                        begin
                             extract(t[j].p1,t[j].p2,aa,bb,cc);
                             d:=(abs(aa*a[i].x+bb*a[i].y+cc))/(sqrt(sqr(aa)+sqr(bb)));
                             res:=min(res,d);
                        end
                     else res:=min(res,min(ab,ac));
                end;
        assign(f,fo);
        rewrite(f);
        write(f,res:0:3);
        close(f);
end;

BEGIN
        input;
        process;
END.