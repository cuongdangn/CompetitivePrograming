uses    math;
const   finp    =       'INTSLE.INP';
        fout    =       'INTSLE.OUT';
var     g,f     :       text;
        a1,a2,b1,b2,c1,c2       :       int64;

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
function        GCD(a,b :       longint):longint;
var     n,m,r   :       longint;
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
procedure       dacbiet(a,b,c:int64);
var     i       :       longint;
        t,t2,t3 :       int64;
begin
        if (a=0)and(b=0) and(c=0) then begin writeln(g,'INFINITE');exit end;
        if (b=0) then if (c mod a <>0) then begin writeln(g,'NO SOLUTION'); exit end else begin writeln(g,'INFINITE');exit end;
        t:=gcd(a,b);
        if c mod t=0 then
         begin
          writeln(g,'INFINITE');
          exit;
         end;
         writeln(g,'NO SOLUTION');
end;
function        ktra(a,b,c:int64):boolean;
var     i       :       longint;
        t,t2,t3 :       int64;
begin
        if (b=0)or(a=0) then exit(true);
       t:=gcd(a,b);
        if c mod t=0 then
          exit(true);
        exit(false);
end;
procedure       xuly;
var     i,j     :       longint;
        dx,dy,d :       int64;
begin
        if ((a1=0) and (b1=0) and (c1<>0)) or ((a2=0) and (b2=0)and (c2<>0)) then begin writeln(g,'NO SOLUTION');exit end;
        if ((a1=0) and (b1=0) and (c1=0)) then
         begin dacbiet(a2,b2,c2);exit; end;
        if ((a2=0)and(b2=0)and(c2=0)) then
         begin
          dacbiet(a1,b1,c1);
          exit;
         end;
        if (b1=0) then if (c1 mod a1 <>0) then begin writeln(g,'NO SOLUTION');exit end;
        if (a1=0) then if (c1 mod b1 <>0) then begin writeln(g,'NO SOLUTION');exit end;
        if (a2=0) then if (c2 mod b2 <>0) then begin writeln(g,'NO SOLUTION');exit end;
        if (b2=0) then if (c2 mod a2 <>0) then begin writeln(g,'NO SOLUTION');exit end;
        dx:=-c2*b1+c1*b2;
        dy:=c2*a1-c1*a2;
        d:=a1*b2-a2*b1;
        if d=0 then
         begin
          if (dx=0)and(dy=0) then
           if ktra(a1,b1,c1) and ktra(a2,b2,c2) then writeln(g,'INFINITE')
           else writeln(g,'NO SOLUTION')
           else writeln(g,'NO SOLUTION')
          end
         else
          begin
           if dx mod d =0 then
            begin
              if dy mod d =0 then writeln(g,dx div d,' ',dy div d)
               else writeln(g,'NO SOLUTION');
            end
           else writeln(g,'NO SOLUTION');
          end;
end;
procedure       doc;
var     i       :       longint;
begin
        read(f,a1,b1,c1);
        read(f,a2,b2,c2);
        xuly;
end;
procedure       doc1;
var     t,i     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
          doc;
end;
begin
        mo;
        doc1;
        dong;
end.
