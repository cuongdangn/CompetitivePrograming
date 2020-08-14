const   finp    =       'P12n.inp';
        fout    =       'P12n.OUT';
        maxb    =       231;
type    arr     =       array[1..8] of byte;
var     g,f     :       text;
        tt1     :       array[0..8,0..8,0..8,0..8,0..8,0..8,0..8,0..8] of longint;
        d      :       array[1..42020,0..301] of extended;
        bit     :       array[1..8,0..255] of byte;
        p,b,x,x1       :       array[1..8] of byte;
        gt      : array[0..8] of longint;
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
        for i:=1 to 8 do gt[i]:=gt[i-1]*i;
        for i:=0 to 1 shl n-1 do
          for j:=1 to n do
           begin
           t:=0;
           for k:=1 to j-1 do
             if (i shr (k-1)and 1= 1) then inc(t);
           bit[j,i]:=t;
          end;
end;
procedure       ktra(x1:arr);
var tt,k,i:longint;
begin
        tt:=0;
         k:=0;
        for i:=1 to n do
         begin
          tt:=tt+(x1[i]-bit[x1[i],k]-1)*gt[n-i];
          k:=k or(1 shl(x1[i]-1));
         end;
         tt1[x1[1],x1[2],x1[3],x1[4],x1[5],x1[6],x1[7],x1[8]]:=tt+1;
end;
procedure       init1(t:longint);
var     i:longint;
begin
        if t>n then
              begin
                ktra(x1);
                exit;
              end;
        for i:=1 to n do
         if x[i]=0 then
          begin
           x[i]:=1;
           x1[t]:=i;
           init1(t+1);
           x[i]:=0;
          end;
end;


function        tinh(p:arr;sb:longint):extended;
var     i,j,tg,tt      :       longint;
        res,tmp     :extended;
        p1      :   arr;
begin
        j:=0;
        tt:=tt1[p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]];
         if d[tt,sb]<>-1 then exit(d[tt,sb]);
        if sb>maxb then exit(0);

        if tt=1  then exit(0);

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
        init1(1);
        kq:=tinh(p,1);
        writeln(g,kq:0:5);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
