const   finp    =       'P12n.inp';
        fout    =       'P12n.OUT';
        maxb    =       400;
type    arr     =       array[1..10] of byte;
var     g,f     :       text;
        d      :       array[1..42020,0..1001] of extended;
        bit     :       array[1..8,0..255] of longint;
        p,b       :       array[1..10] of byte;
        gt      : array[0..10] of int64;
        n       :       byte;
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
var     i       :       byte;
begin
        readln(f,n);
        for i:=1 to n do read(f,p[i]);
end;
procedure       init;
var     i,j,t,k     :       longint;
begin
        gt[0]:=1;
        for i:=1 to 10 do gt[i]:=gt[i-1]*i;
        for i:=0 to 1 shl n-1 do
          for j:=1 to n do
           begin
           t:=0;
           for k:=1 to j-1 do
             if (i shr (k-1)and 1= 1) then inc(t);
           bit[j,i]:=t;
          end;
end;
function        thutu(P:arr):longint;
var     i,j,k,tt       :       longint;
begin
        tt:=0;
        k:=0;
        for i:=1 to n do
         begin
          tt:=tt+(p[i]-bit[p[i],k]-1)*gt[n-i];
          k:=k or(1 shl(p[i]-1));
         end;
         tt:=tt+1;
         exit(tt);
end;

function        tinh(p:arr;sb:longint):extended;
var     i,j,tg,tt      :       longint;
        res,tmp     :extended;
        p1      :   arr;
begin
        j:=0;
        tt:=thutu(p);
         if d[tt,sb]<>-1 then exit(d[tt,sb]);
        if sb>maxb then exit(0);

        for i:=1 to n do
         if p[i]<>i then break;
         if (i=n) then exit(0);

        if sb mod 2 =1 then
          begin
           res:=trunc(1e16);
           for i:=1 to n-1 do
            begin
             j:=i+1;
             p1:=p;
             tg:=p1[i];
             p1[i]:=p1[j];
             p1[j]:=tg;
             tmp:=1+tinh(p1,sb+1);
             if tmp<res then res:=tmp;
            end
           end
           else
            begin
              res:=0;
              for i:=1 to n-1 do
               begin
                  j:=i+1;
                  p1:=p;
                  tg:=p1[i];
                  p1[i]:=p1[j];
                  p1[j]:=tg;
                  tmp:=1+tinh(p1,sb+1);
                  res:=res+tmp;
               end;
               res:=res/(n-1);
            end;
             d[tt,sb]:=res;
           exit(res);
end;
procedure       xuly;
var     kq:extended;
        i,j       :       longint;
begin
        for i:=1 to n do b[i]:=i;
        for i:=1 to 42020 do
         for j:=0 to maxb do d[i,j]:=-1;
        init;
        kq:=tinh(p,1);
        writeln(g,kq:0:5);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
