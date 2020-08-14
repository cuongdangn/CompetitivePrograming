uses math;
const fi='DNC.INP';
      fo='';
var   f,z:text;
      canh,canh1:array [0..10100,1..3] of longint;
      tdoi      :       array[1..102] of longint;
      cha:array [0..1010] of longint;
      n,m,q,ki:longint;
      kq        :       boolean;

{++++++++++++++++++++++++++++++}

{++++++++++++++++++++++++++++++}

procedure ghi;
begin
     assign(z,fo);
     rewrite(z);

      if kq then writeln(z,'NO')
         else writeln(z,'YES');

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
                      kq:=i=ki;

                 end;
         end;
end;

{++++++++++++++++++++++++++++++}
procedure doc;
var i,j,j1:longint;
begin
     readln(f,n,m,q);
     for i:=1 to m do
         readln(f,canh1[i][1],canh1[i][2],canh1[i][3]);
         canh:=canh1;
     for i:=1 to q do
        begin
            read(f,ki);
            read(f,j);
            for j1:=1 to j do
            begin
            read(f,tdoi[j1]);
            read(f,canh[tdoi[j1]][3]);
            end;
            lam;
            ghi;
            canh:=canh1;
        end;
end;
procedure       doc1;
var     t,i       :       longint;
begin
         assign(f,fi);
     reset(f);
        readln(f,t);
        for i:=1 to t do
                        doc;
        close(f);
end;
////////////////////////////////
begin
     doc1;
end.
