const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        p       :       array[1..10000] of longint;
        sl,n    :       longint;
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
procedure       sang(u:longint);
var     i,j     :       longint;
        prime   :       array[1..1000000] of byte;
begin
        fillchar(prime,sizeof(prime),0);
        for i:=2 to trunc(sqrt(u)) do
                if prime[i]=0 then
                        begin
                                j:=i*i;
                                while j<=u do
                                        begin
                                                prime[j]:=1;
                                                j:=j+i;
                                        end;
                        end;
                j:=0;
                for i:=2 to u do
                if prime[i]=0 then
                        begin
                                inc(j);
                                p[j]:=i;
                        end;
                sl:=j;
end;
procedure       xuly;
var     i,j:longint;
        kt      :       boolean;
begin
        kt:=false;
        for i:=1 to sl do
                if (n mod p[i]=0)and(p[i]<n) then
                begin
                kt:=true;
                break;
                end
                else if p[i]>n then break;
         if kt=false then writeln(g,n)
         else
         begin
         j:=1;
                while j<=n do
                        begin
                           j:=j*p[i];
                           if j>n then
                                begin
                                        writeln(g,1);
                                        break;
                                end
                           else
                           if j=n then
                                begin
                                        writeln(g,p[i]);
                                        break;
                                end;
                        end;
         end;
end;

procedure       doc;
var     i,t       :       longint;
begin
        sang(31622);
        readln(f,t);
        for i:=1 to t do
                begin
                        readln(f,n);
                        xuly;
                end;
end;
begin
        mo;
        doc;
        dong;
end.

