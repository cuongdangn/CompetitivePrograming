uses    math;
const   finp    =       'AQUARIUM.INP';
        fout    =       'AQUARIUM.OUT';
type    arr     =       array[1..1000001] of double;
var     g,f     :       text;
        a,b,c   :       array[1..1000001] of double;
        y       :       array[1..100000] of int64;
        n,m,h   :       longint;
        kq      :       double;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,m,h);
        for i:=1 to m+1 do
         read(f,y[i]);
end;
procedure       add(var a:arr;i,j:longint;x:double);
begin
        a[i]:=a[i]+x;
        a[j+1]:=a[j+1]-x;
end;
procedure       xuly;
var     i,j     :       longint;
        mi,ma   :       int64;
begin
        for i:=1 to m do
         begin
          ma:=max(y[i],y[i+1]);
          mi:=min(y[i],y[i+1]);
          if mi<ma then
           begin
            add(a,mi+1,ma,1/(2*(ma-mi)));
            add(b,mi+1,ma,-mi/(ma-mi));
            add(c,mi+1,ma,mi*mi/(2*(ma-mi)));
           end;
          add(c,ma+1,h,-(ma+mi)/2);
          add(b,ma+1,h,1);
         end;
         for i:=2 to h do
          begin
           a[i]:=a[i-1]+a[i];
           b[i]:=b[i-1]+b[i];
           c[i]:=c[i-1]+c[i];
          end;
         readln(f,n);
         for i:=1 to n do
          begin
            readln(f,h);
            kq:=a[h]*h*h+b[h]*h+c[h];
            writeln(g,kq:0:4);
          end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.