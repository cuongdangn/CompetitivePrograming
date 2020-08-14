uses    math;
const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y,r     :       longint;
        end;
var     g,f     :       text;
        n,m,dem,kq,s :       longint;
        a       :       array[-105..1101,-105..1101] of longint;
        a1      :       array[1..110] of bg;
        d,l,r       :       array[0..1010] of longint;
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
        readln(f,n,m);
        for i:=1 to m do
         readln(f,a1[i].x,a1[i].y,a1[i].r);
end;

procedure       dd(k,i,j:longint);
begin
        a[k,i]:=a[k,i]+1;
        a[k,j+1]:=a[k,j+1]-1;
end;
procedure       QHD;
var     i,j     :       longint;
begin
        d[0]:=-maxlongint;
        d[n+1]:=-maxlongint;
        for i:=1 to n do
         begin
           j:=i-1;
          while d[j]>=d[i] do j:=l[j];
          l[i]:=j;
         end;
        ///;
        for I:=n downto 1 do
         begin
           j:=i+1;
           while d[j]>=d[i] do j:=r[j];
           r[i]:=j;
         end;
        ///;
        for i:=1 to n do
         begin
          s:=d[i]*(r[i]-l[i]-1);
          kq:=max(kq,s);
         end;
end;
procedure       xuly1;
var     i,j     :       longint;
begin
        for i:=1 to n do
         begin
          for j:=1 to n do
           if a[i,j]=0 then d[j]:=d[j]+1
           else d[j]:=0;
          qhd;
         end;
         write(g,kq,' ');
end;
procedure       xuly;
var     i,j,da,cu,dau,cuoi     :       longint;
begin
        for i:=1 to m do
         begin
           da:=a1[i].x-a1[i].r+1;
           cu:=a1[i].x+a1[i].r-1;
           for j:=da to cu do
            begin
              dau:=a1[i].y-a1[i].r+1;
               while sqrt(sqr(a1[i].y-dau-0.5)+sqr(abs(a1[i].x-j)-0.5))<a1[i].r-0.5 do dec(dau);
               while (dau<a1[i].y)and(sqrt(sqr(a1[i].y-dau-0.5)+sqr(abs(a1[i].x-j)-0.5))>a1[i].r-0.5) do inc(dau);
              dd(j,dau,2*a1[i].y-dau);
            end;
         end;
       //////////////////////////
       for i:=-103 to n do
          for j:=-103 to n do a[i,j]:=a[i,j-1]+a[i,j];
       /////////////////////////
      {for i:=1 to n do
       begin
        for j:=1 to n do
         if a[i,j]>0 then write(g,1,' ')
         else write(g,0,' ');
         writeln(g);
       end;  }
       for i:=1 to n do
        for j:=1 to n do
         if a[i,j]>0 then inc(dem);
        xuly1;
         writeln(g,dem);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

