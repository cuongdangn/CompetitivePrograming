uses    math;
const   finp    =       'DOCTOR.INP';
        fout    =       'DOCTOR.OUT';
var     g,f     :       text;
        a       :       array[1..100000] of longint;
        kq      :       array[1..100000] of longint;
        n,m       :       longint;
        k       : int64;
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
        readln(f,n,k);
        for i:=1 to n do read(f,a[i]);
end;
function        tinh(x:longint):int64;
var     i       :       longint;
        t1,t2      :       int64;
begin
        t1:=0;
        for i:=1 to n do
         if a[i]<x then t1:=t1+a[i]
        else
            t1:=t1+x;
        t2:=t1;
        for i:=1 to n do
         if a[i]>=x then
          begin
           t1:=t1-1;
           if t1=k then exit(k);
          end;
         exit(t2);

end;


procedure       xuly;
var     dau,cuoi,giua,i,j     :       longint;
        t,t1    :       int64;
begin
        dau:=0;
        cuoi:=trunc(1e9);
        t1:=-1;
        while dau<=cuoi do
         begin
           giua:=(dau+cuoi) div 2;
           t:=tinh(giua);
           if t=k then
            begin
              t1:=giua;
              break;
            end
           else
           if t>k then
             cuoi:=giua-1
           else dau:=giua+1;
         end;
         ///
        t:=t1-1;
        t1:=0;
        if t<0 then begin writeln(g,-1);exit end;
        for i:=1 to n do
         begin
           a[i]:=a[i]-t;
           if a[i]<0 then t1:=t1+a[i]+t
           else t1:=t1+t;
         end;
         k:=k-t1;
         t:=0;
        for i:=1 to n do
         if a[i]>0 then
          begin
          inc(t);
          if a[i]>1 then
          begin
           inc(m);
           kq[m]:=i;
          end;
           if t=k then break;
          end;
         for j:=i+1 to n do
          if a[j]>=1 then write(g,j,' ');
         for i:=1 to m do write(g,kq[i],' ');

end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



