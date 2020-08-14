const   finp    =       'DNC.INP';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        u       :       longint;
        next    :       node;
        end;
var     g,f     :       text;
        n,m     :       longint;
        kq,kq1  :       longint;
        ke      :       array[1..500001] of node;
        sl,sll,d:       array[1..500001] of longint;
        dd      :       array[1..500001] of boolean;
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
procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.u:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,t     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n-1 do
         begin
          readln(f,t);
          nap(ke[t],i+1);
         end;
end;
procedure       dfs(u:longint);
var     p       :       node;
        v       :       longint;
begin
        p:=ke[u];
        while p<>nil do
         begin
          v:=p^.u;
          dfs(v);
          d[u]:=d[u]+d[v];
          p:=p^.next;
         end;
         d[u]:=d[u]+1;
end;
procedure       sang(n:longint);
var     i,j,t     :       longint;
begin
        for i:=1 to n do
         dd[i]:=true;
        for i:=2 to n do
        if dd[i] then
         begin
          j:=i;
          sll[i]:=sll[i]-sl[i]+1;
           while j+i<=n do
            begin
             j:=j+i;
             t:=j;
             while (t mod i=0) do begin inc(sll[i]); dec(sll[i],sl[j]);t:=t div i end;

             dd[j]:=false;
            end;
         end;
end;
function        pow(a,b :       longint):longint;
var     tg      :       longint;
begin
        if b=1 then exit(a);
        tg:=pow(a,b div 2);
        tg:=int64(tg)*int64(tg) mod m;
        if b mod 2=1 then tg:=int64(tg)*int64(a) mod m;
        exit(tg);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        dfs(1);
        for i:=2 to n do
         inc(sl[d[i]]);
        sang(n-1);
        kq:=1;
        for i:=2 to n do
          if sll[i]>0 then
           begin
            kq1:=pow(i,sll[i]);
            kq:=(int64(kq)*int64(kq1)) mod m;
           end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
//QHD tren cay: goi f[i] la so cach sap cac t so vao cay goc i voi t la so con cay goc i
//f[i]=f[c1]*f[c2]*f[c3]..f[ck]*C(t1,t)*C(t2,t-t1)*C(t3,t-t1-t2)..C(tk,t-t1-t2-..t(k-1));
//C(i,k) hop chap k cua i phan tu , tu day rut gon tich cac C,rut gon tich cac f ra cong thuc tren :))
