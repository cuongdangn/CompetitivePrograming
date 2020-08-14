const   finp    =       'MAXDIS.INP';
        fout    =       'MAXDIS.OUT';
var     g,f     :       text;
        a       :       array[1..100001] of int64;
        n       :       longint;
        l,r,kq2     :       int64;
        kq1     :       qword;
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
var     i       :       longint;
begin
        readln(f,n,l,r);
        for i:=1 to n do
         read(f,a[i]);
end;
procedure       QS(l,h  :       longint);
var     i,j,t      :       longint;
        tg,x      :       int64;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
function        tru(a,b:int64):qword;
begin
 if (a>0)=(b>0) then exit(abs(a-b));
 exit(qword(abs(b))+qword(abs(a)));
end;
procedure       xuly;
var     i,j,dau,cuoi     :       longint;
        t       :       int64;
begin
        randomize;

        QS(1,n);

        dau:=1;
        while (dau<=n)and(a[dau]<l) do inc(dau);
        cuoi:=n;
        while (cuoi>=1)and(a[cuoi]>r) do dec(cuoi);
        ////
         if tru(l,a[dau])<tru(l,a[cuoi]) then
          begin
            kq2:=l;
            kq1:=tru(l,a[dau])
          end
           else
          begin
            kq2:=l;
            kq1:=tru(l,a[cuoi]);
          end;

          ///


         for i:=dau to cuoi-1 do
         begin
          t:=a[i]+(tru(a[i+1],a[i])+1)div 2 ;
          if kq1<=tru(a[i+1],t) then
           begin
            kq1:=tru(a[i+1],t);
            kq2:=t;
           end;
          end;

          //////
          if tru(r,a[dau])<tru(r,a[cuoi]) then
          begin
          if kq1<=tru(r,a[dau]) then
          begin
            kq2:=r;
            kq1:=tru(r,a[dau])
          end
          end
           else
          begin
          if kq1<=tru(r,a[cuoi]) then
          begin
            kq2:=r;
            kq1:=tru(r,a[cuoi]);
          end;
          end;


          writeln(g,kq2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
