Uses    math;
Const 	finp    =	'tvsat.inp';
      	fout    =	'tvsat.out';
Type    diem 	= 	record
        x,y:real;
        End;
	tg = record
	a,b,c:real;
    	End;
Var n:longint;
    A:array[0..10009] of diem;
Procedure Mo;
Begin
        Assign(input,finp);
        Reset(input);
        Assign(output,fout);
        Rewrite(output);
End;
Procedure Dong;
Begin
        Close(input);
        Close(output);
End;
Procedure doc;
Var i,x,y:longint;
Begin
        Readln(n);
        For i:=1 to n do
        Begin
                Readln(x,y);
                A[i].x:=x;
                A[i].y:=y;
        End;
End;

Function duongthang(i,j:longint):tg;
Var d:tg;
Begin
        If A[i].x=A[j].x then
        Begin
                d.a:=1;
                d.b:=0;
                d.c:=-A[i].x;
                Exit(d);
        End;
        If A[i].y=A[j].y then
        Begin
                d.a:=0;
                d.b:=1;
                d.c:=-A[i].y;
                Exit(d);
        End;
        d.a:=A[i].y-A[j].y;
        d.b:=A[j].x-A[i].x;
        d.c:=A[i].x*A[j].y - A[j].x*A[i].y;
        Exit(d);
End;

Function tim(td:diem;d:tg):real;
Var x:real;
Begin
        x:=td.x*d.a+td.y*d.b;
        Exit(-x);
End;

Function giaodiem(d1,d2:tg):diem;
Var x:diem;
    d,dx,dy:real;
Begin
         d:=d1.a*d2.b-d2.a*d1.b;
                dx:=d2.c*d1.b-d1.c-d2.b;
                dy:=d2.a*d1.c-d1.a*d2.c;
                If d<>0 then
                Begin
                        x.x:=trunc(dx/d);
                        x.y:=trunc(dy/d);
                End;
         Exit(x);
End;

Function distance(x,y:diem):real;
Var p:real;
Begin
        p:=sqrt( sqr(x.x-y.x) + sqr(x.y-y.y));
        Exit(p);
End;

Procedure Xulitg;
Var d1,d2,d3,d4:tg;
    x,td:diem;
    p:real;
Begin
        d1:=duongthang(1,2);
        d2.a:=-d1.b;
        d2.b:=d1.a;
        td.x:=(A[1].x+A[2].x)/2;
        td.y:=(A[1].y+A[2].y)/2;
        d2.c:=tim(td,d2);
        d3:=duongthang(2,3);
        d4.a:=-d3.b;
        d4.b:=d3.a;
        td.x:=(A[2].x+A[3].x)/2;
        td.y:=(A[2].y+A[3].y)/2;
        d4.c:=tim(td,d4);
        x:=giaodiem(d2,d4);
        p:=distance(x,A[1]);
        Writeln(p:0:5);
        Writeln(x.x:0:5,' ',x.y:0:5);
End;


Procedure Xulicn;
Var maxx,maxy,minx,miny:real;
    i:longint;
    td,x:diem;
    p:real;
Begin
        maxx:=-maxlongint;
        maxy:=maxx;
        minx:=maxlongint;
        miny:=minx;
        For i:=1 to n do
        Begin
                minx:=min(minx,A[i].x);
                miny:=min(miny,A[i].y);
                maxx:=max(maxx,A[i].x);
                maxy:=max(maxy,A[i].y);
        End;
        td.x:=(minx+maxx)/2;
        td.y:=(miny+maxy)/2;
        x.x:=minx;
        x.y:=miny;
        p:=distance(td,x);
        Writeln(p:0:5);
        Writeln(td.x:0:5,' ',td.y:0:5);
End;

Procedure xuly;
Var x:diem;
    p:real;
Begin
        If n=1 then
        Begin
                WRiteln(0);
                Writeln(A[1].x:0:5,' ',A[1].y:0:5);
        End
        Else
        If n=2 then
        Begin
                x.x:=(A[1].x+A[2].x)/2;
                x.y:=(A[1].y+A[2].y)/2;
                p:=distance(x,A[1]);
                Writeln(p:0:5);
                Writeln(x.x:0:5,' ',x.y:0:5);
        End
        Else
        If n=3 then
                Xulitg
        Else xulicn;
End;

BEGIN
        Mo;
        doc;
        xuly;
        Dong;
END.
