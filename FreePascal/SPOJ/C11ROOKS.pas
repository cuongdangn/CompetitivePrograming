uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :array[0..301,0..301] of longint;
        hang,cot        :       array[1..300] of int64;
        n       : longint;
        kq      : int64;
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
        readln(f,n);
        for i:=1 to n do
        begin
         for j:=1 to n do
          read(f,a[i,j]);
          readln(f);
         end;
end;
procedure       init;
var     i,j       :       longint;
begin
        for i:=1 to n do
         for j:=1 to n do
         begin
           hang[i]:=hang[i]+a[i,j];
           cot[j]:=cot[j]+a[i,j];
         end;
end;
procedure       xuly;
var     t1,t2,tong1,tong2,ton2,ton1     :       int64;
        i,j,t     :       longint;
begin
        for i:=1 to n-1 do
        for j:=i+1 to n do
         begin
              t1:=cot[i];
              t2:=cot[j];
              tong1:=-3000000001;
              tong2:=-3000000001;
              for t:=1 to n do
               begin

                    ton1:=hang[t]-2*a[t,i]-a[t,j];
                    ton2:=hang[t]-2*a[t,j]-a[t,i];
                    if ton1<ton2 then ton1:=ton2;
                    if ton1>tong1 then
                        begin
                                  tong2:=tong1;
                                tong1:=ton1;
                        end
                      else
                       if ton1>tong2 then tong2:=ton1;

               end;
               if kq<tong1+tong2+t1+t2 then kq:=tong1+tong2+t1+t2;

             end;
         for i:=1 to n do
          for j:=1 to n-1 do
           for t:=j+1 to n do
             begin
             tong1:=cot[i]+hang[j]+hang[t]-2*(a[j,i]+a[t,i]);
             if tong1>kq then kq:=tong1;
           end;
           for i:=1 to n do
          for j:=1 to n-1 do
           for t:=j+1 to n do
             begin
             tong1:=hang[i]+cot[j]+cot[t]-2*(a[i,j]+a[i,t]);
             if tong1>kq then kq:=tong1;
           end;
           writeln(g,kq);
end;
begin
        mo;
        doc;
        init;
        xuly;
        dong;
end.
