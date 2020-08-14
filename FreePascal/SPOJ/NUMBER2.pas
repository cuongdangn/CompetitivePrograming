const   finp    =       'NUMBER.INP';
        fout    =       'NUMBER.OUT';
var     g,f     :       text;
        m,n     :       longint;
        y       :       array[1..101] of longint;
        x       :       longint;
        thay,d       :       array[1..100,1..100,0..9] of longint;

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
var     c       :char;
begin
        readln(f,m,x);
        while not seekeof(f) do
         begin
          read(f,c);
          inc(n);
          y[n]:=ord(c)-48;
         end;
end;
function        tim(l,h,x:longint):longint;
var     a,b,i,t,tg1,tg2   :       longint;
begin
        if d[l,h,x]<>-1 then exit(d[l,h,x]);
        if l=h then
         begin
          if y[l]=x then
            d[l,h,x]:=l
          else d[l,h,x]:=0;
          exit(d[l,h,x]);
         end;
        ///
        t:=x mod m;
        while t<=99 do
         begin
           a:=t div 10;b:=t mod 10;
           for i:=l to h-1 do
            begin
             tg1:=tim(l,i,a);
             if tg1<>0 then
              begin
                tg2:=tim(i+1,h,b);
                if tg2<>0 then
                 begin
                  d[l,h,x]:=i;
                  thay[l,h,x]:=t;
                  exit(i);
                 end;
              end;
            end;
            t:=t+m;
         end;
         d[l,h,x]:=0;
         exit(0);
end;
procedure       truykq(l,h,x:longint);
var     t,a,b       :       longint;
begin
        if l=h then exit;
        a:=thay[l,h,x] div 10;
        b:=thay[l,h,x] mod 10;
        writeln(g,l,' ',a,b);
        t:=d[l,h,x];
        truykq(l,t,a);
        truykq(t+1,h,b);
end;
procedure       xuly;
var     kq      :       longint;
begin
        fillchar(d,sizeof(d),255);
        kq:=tim(1,n,x);
        if kq>0 then truykq(1,n,x);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
