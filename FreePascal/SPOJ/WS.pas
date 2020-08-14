const   finp    =       'WS.INP';
        fout    =       'WS.OUT';
var     g,f     :       text;
        n       :       longint;
        k       :       longint;
        a,nt       :       array[1..200010] of longint;
        sl      :       array['a'..'z'] of longint;
        p       :       array[1..1000001] of byte;

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
var     i       :       longint;
        s       :       ansistring;
begin
        readln(f,k);
        readln(f,s);
        n:=length(s);
        for i:=1 to n do inc(sl[s[i]]);
end;
function        tinh(a,k:longint):int64;
var     t:int64;
begin
        tinh:=0;
        t:=a;
        while t<=k do
                begin
                        tinh:=tinh+trunc(k/t);
                        t:=t*a;
                end;
end;
procedure       sang(var n:longint);
var     i,j:longint;
        dem     :       longint;
begin
        dem:=0;
        for i:=2 to trunc(sqrt(n)) do
                if p[i]=0 then
                        begin
                                j:=i*i;
                                while j<n do
                                        begin
                                           p[j]:=1;
                                           j:=j+i;
                                        end;
                        end;
        for i:=2 to n do if p[i]=0 then
                begin
                        inc(dem);
                        nt[dem]:=i;
                end;
end;
function        nhan(a,b:int64):int64;
var     dem:int64;
begin
        nhan:=0;
        while a>=1 do
                begin
                        if a mod 2 =1 then nhan:=nhan+b;
                        b:=((b mod k)+(b mod k)) mod k;
                        a:=a div 2;
                end;
end;
function        pow(a:int64;b:longint):int64;
var     tg      :       int64;
begin
        if b=0 then exit(1);
        if b=1 then exit(a mod k);
        tg:=pow(a,b div 2) mod k;
        tg:=nhan((tg mod k),(tg mod k)) mod k;
        if b mod 2 <>0 then tg:=(nhan((tg mod k),(a mod k))) mod k;
        exit(tg);
end;
procedure       xuly;
var     j:longint;
        i:char;
        kq:int64;
begin
        j:=1;
        sang(n);
        while (nt[j]<=n)and(nt[j]<>0) do
                begin
                       a[nt[j]]:=tinh(nt[j],n);
                       inc(j);
                end;
        for i:='a' to 'z' do
                begin
                       j:=1;
                       begin
                       while (nt[j]<=sl[i])and(nt[j]>0) do
                        begin
                                a[nt[j]]:=a[nt[j]]-tinh(nt[j],sl[i]);
                                inc(j);
                        end;
                       end;
                end;
       j:=1;
       kq:=1;
       while (nt[j]<=n)and(j<n div 6 +3) do
        begin
                if a[nt[j]]>0 then
                kq:=nhan((kq mod k),(pow(nt[j],a[nt[j]]) mod k)) mod k;
                inc(j);
        end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.




