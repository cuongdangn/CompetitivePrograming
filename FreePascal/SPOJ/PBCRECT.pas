uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        kq,kq2  :       longint;
        n,m     :       longint;
        a       :       array[1..15000] of ansistring;
        st,d,dd,cs1,cs:    array[0..1501] of longint;
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
        c:      char;
begin
        readln(f,m,n);
        for i:=1 to m do
         readln(f,a[i]);
end;
procedure       truykq2(min1:longint);
var     i,dem       :       longint;
begin
        dem:=0;

        if kq<=d[min1]*min1 then
        begin
        for i:=1 to n do dd[i]:=0;
        for i:=1 to min1 do
         dd[cs1[i]]:=1;
        for i:=1 to min1 do dem:=dem+dd[i];
        if kq=d[min1]*min1 then kq2:=min(kq2,min1-dem) else kq2:=min1-dem;
        kq:=d[min1]*min1;
        for i:=min1+1 to n do
         begin
          dec(dem,dd[i-min1]);
          inc(dem,dd[i]);
          kq2:=min(kq2,min1-dem);
         end;
        end;
end;
procedure       swap(var a,b    :       longint);
var     tg      :       longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       sapxep;
var     i,j,dau,cuoi    :       longint;
begin
        dau:=1;
        cuoi:=0;
        for i:=1 to n do
         begin
          if d[i]>0 then
          begin
           if dau<=cuoi then
            begin
             swap(d[st[dau]],d[i]);
             swap(cs1[st[dau]],cs1[i]);
             cs[cs1[st[dau]]]:=st[dau];
             cs[cs1[i]]:=i;
             inc(cuoi);
             st[cuoi]:=i;
             inc(dau);
            end
           end
           else begin inc(cuoi);st[cuoi]:=i end;
          end;
end;


procedure       xuly;
var     i,j,min1    :       longint;
begin
        for i:=1 to n do cs[i]:=i;
        for i:=1 to n do cs1[i]:=i;
        for i:=1 to m do
         begin
          for j:=1 to n do
          begin
           if a[i,j]='1' then d[cs[j]]:=d[cs[j]]+1
           else d[cs[j]]:=0;
          end;
          ///////////////////////
          sapxep;
          //////////////////
          j:=1;
          min1:=0;
          while (j<=n) do
           begin
            if d[j]=0 then break;
            if d[j]*j>d[min1]*min1 then
             min1:=j;
            inc(j);
           end;
          //////////////////////
          truykq2(min1);
         end;
         writeln(g,kq);
         writeln(g,kq2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
{  d la do cao cac cot den hang thu i
  ta se sap xep d[i] theo thu tu giam dan bang cach ke thua viec sap xep cuar mang d truoc do
  tim so buoc di chuyen min ta se dich chuyen voi min1 chin la chuyen rong cua hinh chu nhat can tim ta dich chuyen chung tren cac mang de xem co bao nhieu o ko bi dd ( tuc ko can thay doi vi tri ))
  }
