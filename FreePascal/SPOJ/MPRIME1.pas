const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        a,b       :       array[0..11000] of longint;

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
procedure       sang;
var     i,j     :       longint;
        prime   :       array[1..11000] of byte;
begin
        fillchar(prime,sizeof(prime),0);
        for i:=2 to trunc(sqrt(11000)) do
        if prime[i]=0 then
         begin
                j:=i*i;
                while j<=11000 do
                 begin
                        prime[j]:=1;
                        j:=i+j;
                 end;
         end;
        j:=0;
        for i:=2 to 11000 do
        if prime[i]=0 then
         begin
             inc(j);
             a[j]:=i;
         end;
end;
procedure       xuly;
var     i,j       :       longint;
begin
        for i:=1 to 11000 do
                a[i]:=a[i-1]+a[i];
        for i:=0 to 11000 do
         for j:=i+1 to 11000 do
         if a[j]-a[i]<11000 then
         inc(b[a[j]-a[i]]);
         for i:=1 to 11000 do
         begin
                write(g,b[i],',');
         end;
end;
begin
        mo;
        sang;
        xuly;
        dong;
end.
