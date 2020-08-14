uses    math;
const   finp    =       'P.INP';
        fout    =       '';
var     g,f     :       text;
        m,n     :       longint;
        a,b,dem       :       array[0..100010] of longint;
        sl      :       array[1..10000] of longint;
        nt      :       array[1..10000] of longint;
        kq,maxx      :       longint;
        kq1     :       int64;
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
        for i:=1 to n do begin read(f,a[i]);maxx:=max(a[i],maxx) end;
end;
procedure       sang(n:longint);
var     i,j     :       longint;
        p       :       array[1..10000] of boolean;
begin
        for i:=1 to n do p[i]:=true;
        p[1]:=false;
        for i:=2 to trunc(sqrt(n)) do
         if p[i] then
         begin
                j:=i*i;
                while j<=n do
                 begin
                  p[j]:=false;
                  j:=j+i;
                 end;
         end;
         for i:=2 to n do
          if p[i] then
           begin
            inc(m);
            nt[m]:=i;
           end;
end;
function        pow(a,b:longint):longint;
var     tg      :       longint;
begin
        if b=1 then exit(a);
        tg:=pow(a,b div 2);
        tg:=tg*tg;
        if b mod 2=1 then tg:=tg*a;
        exit(tg);
end;
procedure       xuly;
var     i,j,ma,t,cc     :       longint;
begin
        sang(maxx);
        cc:=n div 2;
        for j:=1 to m do
         begin
          ma:=0;
          for i:=0 to 10 do dem[i]:=0;
          for i:=1 to n do
            begin
             t:=a[i];
             b[i]:=0;
             while t mod nt[j]=0 do
                begin
                        inc(b[i]);
                        t:=t div nt[j];
                end;
             inc(dem[b[i]]);
             end;
          //////////////////////////
          t:=0;
          for i:=0 to 10 do
           begin
            t:=t+dem[i];
            if t>=cc then break;
           end;
           sl[j]:=i;
           for i:=1 to n do kq:=kq+abs(b[i]-sl[j]);
           end;
           kq1:=1;
           for i:=1 to m do
              if sl[i]>0 then kq1:=kq1*int64(pow(nt[i],sl[i]));
           writeln(g,kq,' ',kq1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
