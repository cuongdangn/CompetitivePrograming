const   finp    =       '';
        fout    =       '';
type    mang    =       array[1..500] of int64;
        mang1   =       array[0..250001] of int64;
var     g,f     :       text;
        a,b,c,d,e:array[1..500] of int64;
        p,q     :       array[0..250001] of int64;
        n,k     :       longint;
        dem:int64;
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
procedure       doc(var a:mang);
var     i:longint;
begin
        for i:=1 to n do read(f,a[i]);
        readln(f);
end;
procedure       doc1;
begin
        readln(f,n,k);
        doc(a);doc(b);doc(c);doc(d);
        doc(e);
end;
procedure       QS(l,h:longint;var a:mang1);
var     i,j        :       longint;
        x,tg       :       int64;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while x>a[i] do inc(i);
                while x<a[j] do dec(j);
        if i<=j then
         begin
                tg:=a[i];
                a[i]:=a[j];
                a[j]:=tg;
                inc(i);
                dec(j);
         end;
         until  i>j;
        if i<h then QS(i,h,a);
        if j>l then QS(l,j,a);
end;
procedure       xuly;
var     i,j1,j2,x,m,j,jx,jy     :       longint;
begin
        m:=0;
        for i:=1 to n do
         for j:=1 to n do
          begin
             inc(m);
             q[m]:=a[i]+b[j];
          end;
        m:=0;
        for i:=1 to n do
         for j:=1 to n do
          begin
             inc(m);
             p[m]:=c[i]+d[j];
          end;
         QS(1,n*n,q);
         QS(1,n*n,p);
   for i:=1 to n do
   begin
        x:=k-e[i];j1:=1;j2:=n*n;
         While (j1<=n*n) and (j2>=1) do
   begin
  If p[j1]+q[j2]=x then
  begin
    jx:=j1;jy:=j2;
    while p[j1]=p[j1+1] do
        begin
                inc(j1);
         end;
     while q[j2]=q[j2-1] do
        begin
                dec(j2);
        end;
     dem:=dem+(j1-jx+1)*(jy-j2+1);
     inc(j1);
     dec(j2);
  end
  else if p[j1]+q[j2]>x then dec(j2)
  else if p[j1]+q[j2]<x then inc(j1);
end;
     end;
     writeln(g,dem);
end;
begin
        mo;
        doc1;
        xuly;
        dong;
end.
