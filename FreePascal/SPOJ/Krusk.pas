uses math;
const fi='';
      fo='';
var   f,z:text;
      canh:array [0..10100,1..3] of longint;
      cha:array [0..1010] of longint;
      n,m,kq:longint;

{++++++++++++++++++++++++++++++}

procedure doc;
var i:longint;
begin
     assign(f,fi);
     reset(f);

     read(f,n,m);
     for i:=1 to m do
         read(f,canh[i][1],canh[i][2],canh[i][3]);

     close(f);
end;

{++++++++++++++++++++++++++++++}

procedure ghi;
begin
     assign(z,fo);
     rewrite(z);

     writeln(z,kq);

     close(z);
end;

{++++++++++++++++++++++++++++++}

procedure sort(dau,cuoi:longint);
var d,c,x,tam:longint;
begin
     d:=dau;
     c:=cuoi;
     x:=canh[(d+c) shr 1][3];

     repeat
           while (canh[d][3]<x) do inc(d);
           while (canh[c][3]>x) do dec(c);
           if (d<=c) then
              begin
                   tam:=canh[d][1];
                   canh[d][1]:=canh[c][1];
                   canh[c][1]:=tam;

                   tam:=canh[d][2];
                   canh[d][2]:=canh[c][2];
                   canh[c][2]:=tam;

                   tam:=canh[d][3];
                   canh[d][3]:=canh[c][3];
                   canh[c][3]:=tam;

                   inc(d);
                   dec(c);
              end;
     until d>c;

     if (d<cuoi) then sort(d,cuoi);
     if (c>dau) then sort(dau,c);
end;

{++++++++++++++++++++++++++++++}

function tim(i:longint):longint;
begin
     if (cha[i]<0) then exit(i);
     cha[i]:=tim(cha[i]);
     exit(cha[i]);
end;

{++++++++++++++++++++++++++++++}

procedure lam;
var i,cha1,cha2:longint;
begin
     sort(1,m);
     for i:=1 to n do
         cha[i]:=-1;
     for i:=1 to m do
         begin
              cha1:=tim(canh[i][1]);
              cha2:=tim(canh[i][2]);
              if (cha1<>cha2) then
                 begin
                      cha[cha1]:=cha2;
                      kq:=kq+canh[i][3];
                 end;
         end;
end;

{++++++++++++++++++++++++++++++}

begin
     doc;
     lam;
     ghi;
end.


