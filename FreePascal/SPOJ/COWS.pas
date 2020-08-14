uses    math;
const   finp    =       'COWS.INP';
        fout    =       'COWS.OUT';
var     g,f     :       text;
        n,m     :       longint;
        a,b     :       longint;
        w       :       array[1..100000] of longint;
        fx      :       array[1..100000,1..318] of int64;
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
        for i:=1 to n do read(f,w[i]);
end;
procedure       duyet(a,b:longint);
var     kq      :       int64;
begin
        kq:=0;
        while a<=n do
         begin
          kq:=kq+int64(w[a]);
          a:=a+b;
         end;
         writeln(g,kq);
end;
procedure       xuly;
var     i,j,t,a,b     :       longint;
begin
        t:=min(n,205);
        for i:=1 to t do
         begin
          fx[n,i]:=w[n];
          for j:=n-1 downto 1 do
          begin
            fx[j,i]:=w[j];
            if j+i<=n then fx[j,i]:=fx[j,i]+fx[j+i,i];
          end;
         end;
        readln(f,m);
        for i:=1 to m do
         begin
          readln(f,a,b);
          if b<=t then writeln(g,fx[a,b])
          else duyet(a,b);
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

