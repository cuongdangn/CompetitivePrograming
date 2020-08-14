uses    math;
Const Fi        =       'POlY.inp';
      Fo        =       'POlY.out';
      Maxn      =       100;
Type toado      =       Record
        x,y:Integer;
     End;
     dt         =       Record
        P1,P2:toado;
     End;
      Pol=Array[0..Maxn] Of toado;

Var Po,Po1,Po2:Pol;
    D1,D2:toado;
    Cl,min1:Real;
    L1,l2,N:Integer;
    f,g:Text;
function f1(l : dt; d : toado): real;
    var a,b,c : real;
  begin
        a := l.p1.y-l.p2.y;
        b := l.p2.x-l.p1.x;
        c := l.p1.y*l.p2.x - l.p1.x*l.p2.y;
        f1 := a*d.x + b*d.y +c;
    end;
function diem_thuoc_doanthang(d: toado;l : dt) : boolean;
    var a,b,c : real;
        ok,ok1,ok2 : boolean;
    begin
        ok  := f1(l,d)=0;
        ok1 := (min(l.p1.x,l.p2.x)<=d.x) and (d.x<=max(l.p1.x,l.p2.x));
        ok2 := (min(l.p1.y,l.p2.y)<=d.y) and (d.y<=max(l.p1.y,l.p2.y));
        diem_thuoc_doanthang := ok and ok1 and ok2;
    end;
Procedure Mo;
Begin
  Assign(F,Fi);
  Reset(F);
  Assign(g,Fo);
  Rewrite(g);
End;

Procedure Dong;
Begin
  Close(F);
  Close(g);
End;

Procedure doc;
Var i:Byte;
Begin
  Readln(F,N);
  For i:=1 to n Do
      Readln(f,Po[i].x,Po[i].y);
End;

Procedure ktao;
Begin
  Min1:=999999999;
End;

Function s1(po:Pol;n:Byte):Real;
Var i,j:integer;S:Real;
Begin
    S:=0;
  Po[n+1]:=Po[1]; Po[0]:=Po[n];
  For i:=1 to n Do
     S:=S+((Po[i+1].x-Po[i].x)*(Po[i].y+Po[i+1].y)/2);
  s1:=Abs(S);
End;


Procedure       xuly;
Var i,j,k,i1,tam1,tam2,sd1,sd2,dem1:longint;
        dd      :dt;
        s       :       real;
Begin
        s:=s1(po,n);
        dem1:=0;
  For i:=1 to n-1 Do
      For j:=i+1 to n Do
         Begin
            D1:=Po[i];
            D2:=Po[j];
            dd.p1:=po[i];
            dd.p2:=po[j];
            dem1:=0;
            for i1:=1 to n do
             if diem_thuoc_doanthang(po[i1],dd) then inc(dem1);
             if dem1>=3 then break;
            Sd1:=j-i+1;
            Sd2:=n-sd1+2;
            Tam1:=0;Tam2:=0;
            For k:=i to j Do
               Begin
                  Tam1:=Tam1+1;
                  Po1[Tam1]:=Po[k];
               End;
            For k:=j to n Do
               Begin
                 Tam2:=Tam2+1;
                 Po2[Tam2]:=Po[k];
               End;
            for k:=1 to i do
                begin
                 tam2:=tam2+1;
                 po2[tam2]:=po[k];
                end;
            if abs(s-s1(Po1,sd1)-s1(Po2,sd2))<=1E-100 then
            begin
            Cl:=Abs(s1(Po1,Sd1)-s1(Po2,Sd2));
                 if cl<min1 then
                 begin
                  Min1:=Cl;
                   l1:=i;
                   l2:=j
                 end
            end;
         End;
      writeln(g,s:0:2);
End;

Procedure xuat;
Begin
  Writeln(g,L1,' ',L2);
End;

Begin
  Mo;
  doc;
  ktao;
  xuly;
  xuat;
  Dong;
End.
