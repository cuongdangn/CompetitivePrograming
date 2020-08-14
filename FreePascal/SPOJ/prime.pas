{$11000000}
const   fout    =       '';
        maxn       = 100000;
var     prime   :       array[1..maxn] of byte;
        nt      :array[1..40000] of longint;
        a,b,i,t,sl    :longint;
        g       :       text;
procedure       sang(n:longint);
var i,j :longint;
begin

        for i:=2 to trunc(sqrt(n)) do
            if prime[i]=0 then
            begin
                j:=i*i;
                while j<=n do
                begin
                        prime[j]:=1;
                        j:=j+i;
                end;
            end;
        for i:=2 to n do
         if prime[i]=0 then
                begin
                        inc(sl);
                        nt[sl]:=i;

                end;
end;
procedure       xuly;
var     i,j       :longint;
begin
        readln(a,b);
        if a=1 then a:=2;
        for i:=a to b do
          begin
            for j:=1 to sl do
            if (i mod nt[j]=0)or(nt[j]>=i) then break;
                          if ((i mod nt[j]<>0)and(j=sl))or(nt[j]>=i) then writeln(i);
            end;
            writeln;
end;
begin
        assign(g,fout);
        rewrite(g);
        sang(31700);
        readln(t);
        for i:=1 to t do xuly;
        close(g);
end.


