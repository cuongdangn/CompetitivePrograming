const   finp    =       'FIBO.INP';
        fout    =       'FIBO.OUT';
        //FIBO.OUT
var     g,f     :       text;
        a,b,c   :       array[1..500] of byte;
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
        close(f);
        close(g);
end;
procedure       doc;
var     s       : char;
        i,j,n1,l,r     :longint;
begin
        while not seekeoln(f) do
                begin
                        inc(n);
                        read(f,s);
                        if s='1' then a[n]:=1;
                end;
                l:=1;
                r:=n;
        while l<r do
           begin
                j:=a[l];
                a[l]:=a[r];
                a[r]:=j;
                inc(l);
                dec(r);
           end;
        n1:=0;
        readln(f);
        while not seekeoln(f) do
                begin
                        inc(n1);
                        read(f,s);
                        if s='1' then b[n1]:=1;
                end;
                l:=1;
                r:=n1;
        while l<r do
           begin
                j:=b[l];
                b[l]:=b[r];
                b[r]:=j;
                inc(l);
                dec(r);
           end;
        if n1>n then n:=n1;
        for I:=1 to n do c[i]:=a[i]+b[i];
end;
procedure       danxep;
var     i:longint;
        ok      :boolean;
begin
        repeat
                ok:=true;
                i:=n;
                while (i>0)and(c[i]<2) do dec(i);
                if i>0 then
                        begin
                         ok:=false;
                         if i>2 then
                             begin
                                    dec(c[i],2);
                                    inc(c[i+1]);
                                    inc(c[i-2]);
                             end;
                         if (i=2)and(c[1]=0) then
                             begin
                                c[2]:=c[2]-2;
                                c[1]:=1;
                                inc(c[3]);
                             end;
                         if (i=2)and(c[1]>=1) then
                                begin
                                        dec(c[2]);
                                        dec(c[1]);
                                        inc(c[3]);
                                end;
                         if (i=1) then
                                begin
                                        c[1]:=c[1]-2;;
                                        inc(c[2]);
                                end;
                         if i=n then inc(n);
                         end;
          until          ok;
end;
procedure       hop;
var     i:longint;
        ok      :boolean;
begin
        repeat
                ok:=true;
                i:=n-1;
                while (i>0)    do
                begin
                        if c[i]+c[i+1]=2 then
                                begin
                                        ok:=false;
                                        c[i]:=0;
                                        c[i+1]:=0;
                                        c[i+2]:=c[i+2]+1;
                                        if i=n-1 then inc(n);
                                end;
                        dec(i);
                end;
          until          ok;
end;
procedure       xuat;
var     i       :longint;
begin
        for i:=n downto 1 do write(g,c[i]);
end;
begin
        mo;
        doc;
        danxep;
        hop;
        xuat;
        dong;
end.


