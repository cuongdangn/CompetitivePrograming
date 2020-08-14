{Giong nhu day fibonaci nhung
 fx[i]=fx[i-1]+fx[i-2]+g[i mod 2];
 voi g[i] la so luong xau tao thanh khi ket hop dau xau i-2 vs cuoi xau i-1
 nhan thay g[i] co tinh lap laij chan le'
 }
uses    math;
const   finp    =       '';
        fout    =       '';
        cs      =       16;
        ba      =       trunc(1e16);
type    st      =       ansistring;
        big      =       array[0..15] of int64;
var     g,f     :       text;
        s       :       array[1..3] of st;
        n       :       longint;
        sm      :       st;
        fx      :       array[1..1000] of big;
        chan,le :       big;
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
begin
        readln(f,n);
        readln(f,s[1]);
        readln(f,s[2]);
        readln(f,sm);
end;
function        sl(a,b:st):int64;
var     i,m1,m2     :       longint;
        dem     :   int64;
begin
        m1:=length(a);
        m2:=length(b);
        dem:=0;
        if m1>m2 then exit(0);
        for i:=1 to m2-m1+1 do
         if copy(b,i,m1)=a then inc(dem);
        exit(dem);
end;
procedure       init;
var     i,j     :       longint;
begin
        fx[1][1]:=sl(sm,s[1]);
        fx[1][0]:=1;
        fx[2][0]:=1;
        fx[2][1]:=sl(sm,s[2]);
        for i:=3 to 20 do
         begin
          s[3]:=s[2]+s[1];
          fx[i][1]:=sl(sm,s[3]);
          fx[i][0]:=1;
          s[1]:=s[2];
          s[2]:=s[3];
         end;
end;
function        add(a,b:big):big;
var     nho     :       int64;
        m,i       :       longint;
        c       :       big;
begin
        fillchar(c,sizeof(c),0);
        m:=max(a[0],b[0]);
        nho:=0;
        for i:=1 to m do
         begin
          nho:=nho+a[i]+b[i];
          c[i]:=nho mod ba;
          nho:=nho div ba;
         end;
         while nho>0 do
          begin
           inc(m);
           c[m]:=nho mod ba;
           nho:=nho div ba;
          end;
          c[0]:=m;
          exit(c);
end;




procedure       xuly;
var     i,j     :       longint;
        stg     :       string;
begin
        init;
        chan[0]:=1;
        chan[1]:=fx[20][1]-fx[19][1]-fx[18][1];
        le[0]:=1;
        le[1]:=fx[19][1]-fx[18][1]-fx[17][1];
        for i:=21 to n do
           begin
            fx[i]:=add(fx[i-1],fx[i-2]);
            if i mod 2=0 then
             fx[i]:=add(fx[i],chan)
             else fx[i]:=add(fx[i],le);
            end;
        write(g,fx[n][fx[n][0]]);
        for i:=fx[n][0]-1 downto 1 do
         begin
          str(fx[n][i],stg);
          while length(stg)<cs do stg:='0'+stg;
          write(g,stg);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
