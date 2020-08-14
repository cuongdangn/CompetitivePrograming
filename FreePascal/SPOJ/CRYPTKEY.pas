const   finp    =       'CRYPTKEY.INP';
        fout    =       'CRYPTKEY.OUT';
type    arr     =       array[1..50000010] of int64;
var     g,f     :       text;
        k       :       int64;
        a       :       array[1..50010] of int64;
        b       :       array[1..50000010] of int64;
        n       :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i,j     :       longint;
begin
        read(f,n);
        for i:=1 to n do read(f,a[i]);
        read(f,k);
end;
function        UCLN(a,b:int64):int64;
var     n,m,r   :int64;
begin
        n:=a;
        m:=b;
        while n<>0 do
         begin
                r:=m mod n;
                m:=n;
                n:=r;
         end;
         exit(m);
end;
procedure       sub1(var a:arr);
var     i1,i,j,n1     :       longint;
        t,t1    :     int64;
        stop,ok    :       boolean;

begin
        repeat
                stop:=true;
                n1:=n;
               for i1:=1 to n1-1 do
                for i:=i1+1 to n1 do
                 begin
                        t:=UCLN(a[i1],a[i]);
                        if (a[i1] div t)<trunc(1e18) div a[i] then t1:=(a[i1] div t)*a[i];
                        if (t=k)or(t1=k) then begin writeln(g,'YES');exit end;
                        ok:=true;
                        /////////////////////////////
                        for j:=1 to n do
                        if a[j]=t then ok:=false;
                        if ok then
                         begin
                                stop:=false;
                                inc(n);
                                a[n]:=t;
                         end;
                         ////////////////////////////
                         ok:=true;
                        for j:=1 to n do
                        if a[j]=t1 then ok:=false;
                        if ok then
                         begin
                                stop:=false;
                                inc(n);
                                a[n]:=t1;
                         end;
                 end;
        until    stop;
        writeln(g,'NO');
end;
function        nhan(a,b:int64):int64;
var     s,t     :       int64;
begin
        s:=0;
        t:=a;
        repeat
                if b mod 2=1 then s:=(s+t)mod k;
                b:=b div 2;
                t:=(t*2)mod k;
        until   b=0;
        exit(s);
end;
procedure       sub2;
var     i,j     :       longint;
        uc,bc,tg,du   :       int64;
        ok1,ok2 :       boolean;
begin
        uc:=a[1];
        bc:=a[1];
        du:=a[1];
        for i:=2 to n do
         du:=nhan(du,a[i]);
        if du<>0 then begin writeln(g,'NO');exit end;
        ok1:=false;
        ok2:=false;
        for i:=2 to n do
         begin
                uc:=UCLN(uc,a[i]);
                if not ok2 then
                begin
                        tg:=UCLN(bc,a[i]);
                        if bc div tg <= trunc(1e18) div a[i] then bc:=(bc div tg)*a[i];
                end;
         end;
         if k<=bc then ok2:=true;
         if k>=uc then ok1:=true;
         if (ok1=true) and (ok2=true) then writeln(g,'YES')
         else writeln(g,'NO');
end;

procedure       xuly;
var     i,j     :       longint;
begin
       if n<=10 then
                begin
                        for i:=1 to n do begin b[i]:=a[i];if b[i]=k then begin writeln(g,'YES');exit end; end;
                        sub1(b) ;
                end else
                sub2;

end;
procedure       doc1;
var     i,j     :       longint;
begin
        readln(f,j);
        for i:=1 to j do
         begin
                doc;
                xuly;
         end;
end;
begin
        mo;
        doc1;
        dong;
end.
