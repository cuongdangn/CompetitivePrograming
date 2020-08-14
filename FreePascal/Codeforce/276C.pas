uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
type    arr     =       array[0..60] of byte;
var     g,f     :       text;
        n,m       :       longint;
        x,y,t,kq     :       int64;
        a,b,c   :    arr;
procedure       init(var a:arr;x:int64);
var     i,j,k   :       longint;
begin
        k:=0;
        while x>0 do
         begin
          inc(k);
          a[k]:=x mod 2;
          x:=x div 2;
         end;
         m:=max(m,k);
end;
procedure       xuly;
var     i,j,s1,s2     :       longint;
        ok1,ok2 :       boolean;
begin
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        init(a,y);init(b,x);
        s1:=0;
        s2:=0;
        for i:=1 to m do
         if a[i]=1 then inc(s1);
         for i:=1 to m do
         if b[i]=1 then inc(s2);

        ok1:=false;ok2:=false;
        for j:=1 to m do
         begin
          if s2>j then continue;
          if s2=j then kq:=max(kq,a);
          if s2<j then


          for i:=1 to m do
           begin
            kq:=kq+t*int64(c[i]);
            t:=t*2;
           end;
           writeln(kq);
end;
procedure       doc;
var     i,j     :       longint;
begin
        assign(f,finp);
        reset(f);
        readln(f,n);
        for i:=1 to n do
         begin
          readln(f,x,y);
          xuly;
         end;
end;
begin
        doc;
end.
