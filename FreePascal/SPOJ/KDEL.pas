const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
var     g,f     :       text;
        n,k     :       longint;
        s       :       ansistring;
        kq:     array[1..100000] of char;
        p       :       array[1..maxn] of byte;

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
procedure       sang(n1:longint);
var     j,dem:longint;
        i:longint;

        s1:string;
begin
        for i:=2 to trunc(sqrt(n1)) do
                begin
                        if p[i]=0 then
                                begin
                                        j:=i*i;
                                        while j<=n1 do
                                                begin
                                                        p[j]:=1;
                                                        j:=j+i;
                                                end;
                                end;
                 end;
                 dem:=0;
                 s:='';
                 for i:=2 to n1 do
                        if (p[i]=0)and(dem<n) then
                                begin
                                     str(i,s1);
                                     s:=s+s1;
                                     inc(dem);
                                     if dem=n then break;
                                end;
end;
procedure       doc;
var     i,l,c,xoa       :       longint;
begin
        readln(f,n,k);
        sang(maxn);
        l:=length(s);
        kq:=s[1];
        c:=1;
        xoa:=0;
        for i:=2 to l do
                begin
                   while (s[i]>kq[c])and(c>0)and(xoa<k) do
                   begin
                   dec(c);
                   inc(xoa);
                   end;
                   inc(c);
                   kq[c]:=s[i];
                end;
        for i:=1 to c-(k-xoa) do write(g,kq[i]);
end;
begin
        mo;
        doc;
        dong;
end.

