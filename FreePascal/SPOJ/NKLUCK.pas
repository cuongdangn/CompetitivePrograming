uses    math;
const   finp    =       '';
        fout    =       '';
var     i,j     :       longint;
        f,g     :       text;
        bit     :       array[0..500000] of int64;
        d,a     :       array[0..500000] of longint;
        n,k,ma,mi       :       longint;
        kq   :    extended;
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
procedure       up(i:longint);
begin
        while i<=ma do
         begin
                bit[i]:=bit[i]+1;
                i:=i+i and (-i);
         end;
end;
function        get(i:longint):int64;
var     tg      :       int64;
begin
        tg:=0;
        while i>0 do
          begin
               // writeln(i);
                tg:=tg+bit[i];
                i:=i-i and(-i);
          end;
        exit(tg);
end;
function        tinh(k:longint):int64;
var     i       :longint;
        t,kq       :int64;
begin
        d[0]:=0;
        for i:=1 to n do
          if a[i]>=k then
                 d[i]:=d[i-1]+1
          else d[i]:=d[i-1];
          for i:=1 to 500000 do bit[i]:=0;
        kq:=0;
          mi:=0;
          ma:=0;
       for i:=0 to n do d[i]:=2*d[i]-i;
        for i:=0 to n do mi:=min(d[i],mi);
        if mi<=0 then
                for i:=0 to n do begin d[i]:=d[i]+1-mi;ma:=max(ma,d[i]) end;
        up(d[0]);
        for i:=1 to n do
         begin
                t:=get(d[i]);
                kq:=kq+t;
                up(d[i]);
         end;
         exit(kq);
end;
procedure       xuly;
var     i,j     :       longint;
        t       :       int64;
begin
        read(f,n,k);
        for i:=1 to n do read(f,a[i]);
         kq:=tinh(k);
         kq:=kq-tinh(k+1);
         t:=int64(n)*int64(n-1) div 2+int64(n);
         writeln(g,kq/t:0:1);
end;
procedure       doc;
var     i,j,t :    longint;
begin
        readln(f,t);
        for i:=1 to t do
          xuly;
end;
begin
        mo;
        xuly;
        dong;
end.
