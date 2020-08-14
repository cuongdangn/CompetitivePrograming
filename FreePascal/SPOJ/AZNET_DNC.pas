{ thuat toan la:
  -tim amax la so canh thuoc nhom a toi da co the them vao cay khung
  -bmax la so canh toi da co the them vao cay khung
  -khi do thi goi k la so canh thuoc a trong cay khung can tim thi n-1-bmax<=k<=amax;
  -nhan thay voi moij k nam trong khoang nay thi luon tim duoc cay khung nen ta for k sao cho a[k]+b[n-1-k] min
toi tim cay khung thoa man k canh a va n-k-1 canh b , truoc tien ta add tat ca cac canh cua a co the vao, sau do thu add them cac canh b
vao sao cho tao thanh cay khung
.....(xem code phan (*) de hieu hon }

const   finp    =       '';
        fout    =       '';
        maxn    =       10000;
        maxm    =       100000;
type    bg      =       record
        x,y,cs     :       longint;
        end;
var     f,g     :       text;
        n,m1,m2,m:      longint;
        a,b     :       array[1..maxm]  of bg;
        a1,b1   :       array[0..maxn] of longint;
        cha     :       array[1..2,1..maxn] of longint;
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
var     i,u,v,t     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n-1 do
         read(f,a1[i]);
         readln(f);
        for i:=1 to n-1 do
         read(f,b1[i]);
         readln(f);
         m1:=0;
         m2:=0;
         for i:=1 to m do
          begin
           readln(f,u,v,t);
           if t=1 then
            begin
             inc(m1);
             a[m1].x:=u;
             a[m1].y:=v;
             a[m1].cs:=i;
            end
           else
            begin
            inc(m2);
             b[m2].x:=u;
             b[m2].y:=v;
             b[m2].cs:=i;
            end;
          end;
end;
function        fin(t,u:longint):longint;
var     tg      :longint;
begin
        if cha[t,u]<0 then exit(u);
        tg:=fin(t,cha[t,u]);
        cha[t,u]:=tg;
        exit(tg);
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to n do
         begin
          cha[1,i]:=-1;
          cha[2,i]:=-1;
         end;
end;
procedure       xuly;
var     i,j,k,res,cc,cd,cha1,cha2     :       longint;
begin
        cc:=0;
        cd:=0;
        init;
        for i:=1 to m1 do
         begin
          cha1:=fin(1,a[i].x);
          cha2:=fin(1,a[i].y);
          if cha1<>cha2 then
           begin
            inc(cc);
            cha[1,cha1]:=cha2;
           end;
         end;
        /////
        for i:=1 to m2 do
         begin
          cha1:=fin(1,b[i].x);
          cha2:=fin(1,b[i].y);
          if cha1<>cha2 then
           begin
            inc(cd);
            cha[1,cha1]:=cha2;
            cha1:=fin(2,b[i].x);
            cha2:=fin(2,b[i].y);
            cha[2,cha1]:=cha2;
           end;
         end;
         for i:=1 to m2 do
         begin
          cha1:=fin(2,b[i].x);
          cha2:=fin(2,b[i].y);
          if cha1<>cha2 then
           begin
            inc(cd);
            cha[2,cha1]:=cha2;
           end;
         end;
         cd:=n-1-cd;
         ////
         res:=maxlongint;
         for i:=cd to cc do
          if a1[i]+b1[n-1-i]< res then
           begin
            res:=a1[i]+b1[n-1-i];
            k:=i;
           end;
        /////  xuat
         init;
        for i:=1 to m1 do
         begin
          cha1:=fin(1,a[i].x);
          cha2:=fin(1,a[i].y);
          if cha1<>cha2 then
            cha[1,cha1]:=cha2;
         end;
        /////
        cd:=0;
        for i:=1 to m2 do
         begin
          cha1:=fin(1,b[i].x);
          cha2:=fin(1,b[i].y);
          if cha1<>cha2 then
           begin
            inc(cd);
            write(g,b[i].cs,' ');
            cha[1,cha1]:=cha2;
            cha1:=fin(2,b[i].x);
            cha2:=fin(2,b[i].y);
            cha[2,cha1]:=cha2;
           end;
         end;
         if cd<n-1-k then
        for i:=1 to m2 do
         begin
          cha1:=fin(2,b[i].x);
          cha2:=fin(2,b[i].y);
          if cha1<>cha2 then
           begin
            inc(cd);
            write(g,b[i].cs,' ');
            cha[2,cha1]:=cha2;
            if cd=n-1-k then break;
           end;
         end;
         ////
         for i:=1 to m1 do
          begin
           cha1:=fin(2,a[i].x);
           cha2:=fin(2,a[i].y);
           if cha1<>cha2 then
            begin
             write(g,a[i].cs,' ');
             cha[2,cha1]:=cha2;
            end;
         end;
         writeln(g);
end;
procedure       doc1;
var     t,i     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
           doc;
           xuly;
         end;
end;
begin
        mo;
        doc1;
        dong;
end.
