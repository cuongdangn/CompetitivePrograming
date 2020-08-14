const   finp    =       'NEXT.INP';
        fout    =       'NEXT.OUT';
var     g,f     :       text;

        dau,cuoi        :longint;
        a,b,k,t   :      int64;
        kq      :       int64;
        m       :       longint;
        c       :       array[1..100] of int64;
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
function        tinh(a:int64):int64;
var     i       :       longint;
        tt,tg   :       int64;
begin
        tg:=0;
        if k mod 2=0 then tt:=2
        else tt:=1;
        for i:=1 to m do
          if c[i]*k+c[i]*tt-1<=a then tg:=tg+c[i]*tt
          else break;
        if (a>=c[i]*k)and(a<=c[i]*k+c[i]*tt-1) then
         tg:=tg+a-c[i]*k+1;
        exit(tg);
end;

procedure       doc;
var     i,j     :       longint;
begin
        readln(f,k,a,b);
        if k=0 then begin writeln(g,b-a+1) ;exit end;
        t:=1;
        while t*k<=b do
         begin
                inc(m);
                c[m]:=t;
                t:=t*2;
         end;
         inc(m);
         c[m]:=t;
      { for i:=1 to m do
         if c[i]*k+(them+1)*c[i]-1>=a then break;
        //////////////
        if c[i]*k<a then kq:=kq+(them+1)*c[i]-a+c[i]*k else kq:=kq+(them+1)*c[i];
        for j:=i+1 to m-1 do
         kq:=kq+c[j];
        if i<m then
        if c[m]*k+(them+1)*c[m]-1>b then
        kq:=kq+b -c[m]*k+1
        else kq:=kq+(them+1)*c[m];
        writeln(g,kq); }
        writeln(g,tinh(b)-tinh(a-1));
end;

begin
        mo;
        doc;
        dong;
end.
