uses    math;
const   finp    =       '';
        fout    =       '';
        maxx    =       maxlongint;
type    arr1    =       array[1..10] of longint;
        arr     =       array[0..59050] of longint;
var     g,f     :       text;
        mon     :       array[1..30] of longint;
        a1,b1   :       arr;
        x       :       arr1;
        n,m,kq  :       longint;
        a       :       array[1..10,1..30] of boolean;
        lt      :       array[0..10] of longint;
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
        lt[0]:=1;
        for i:=1 to 10 do lt[i]:=lt[i-1]*3;
        readln(f,m,n);
        for i:=1 to m do read(f,mon[i]);
        readln(f);
        for i:=1 to n do
         begin
                while not seekeoln(f) do
                 begin
                        read(f,j);
                        a[i,j]:=true;
                 end;
                 readln(f);
         end;
end;
procedure       duyet(i,kt,chiphi:longint;var a1:arr);
var     j,so:longint;
        ok      :       boolean;
        luvet:  array[1..10] of longint;
begin
        if i=kt+1 then
         begin
                so:=0;
                for j:=n downto 1 do
                 so:=so*3+x[j];
                a1[so]:=min(a1[so],chiphi);
                exit;
         end;
        duyet(i+1,kt,chiphi,a1);
        ok:=true;
        for j:=1 to n do luvet[j]:=x[j];
        for j:=1 to n do
         if a[j,i] then
          begin
                inc(x[j]);
                if x[j]>2 then begin ok:=false;break end;
          end;
        if ok then duyet(i+1,kt,chiphi+mon[i],a1);
        for j:=1 to n do x[j]:=luvet[j];
end;
procedure       thay(t:longint;var x:arr1);
var     i       :longint;
begin
        for i:=1 to n do x[i]:=0;
        i:=0;
        while t<>0 do
         begin
          inc(i);
          x[i]:=t mod 3;
          t:=t div 3;
         end;
end;

procedure       xuly;
var     i,j,t,s     :       longint;
begin
        t:=m div 2;
        for i:=0 to lt[n] do
         begin
                a1[i]:=maxx;
                b1[i]:=maxx;
         end;
         kq:=maxx;
        duyet(1,t,0,a1);
        duyet(t+1,m,0,b1);
        for i:=0 to lt[n] do
         if a1[i]<maxx then
         begin
            thay(i,x);
            s:=0;
            for j:=n downto 1 do
             begin
              t:=2-x[j];
              s:=s*3+t;
             end;
             if b1[s]<maxx then kq:=min(kq,b1[s]+a1[i]);
         end;
         if kq=maxx then writeln(g,-1) else writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
