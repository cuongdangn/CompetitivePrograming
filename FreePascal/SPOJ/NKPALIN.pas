const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        a       :       array[0..2000] of char;
        d       :       array[0..2000,0..2000] of longint;
        l       :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
begin
        while not seekeoln(f) do
        begin
                inc(l);
                read(f,a[l]);
        end;
end;
procedure       QHD;
var     i,j,k     :       longint;
        m       : char;
begin
        for i:=0 to l do d[i,i]:=1;

        {for i:=0 to l do
        for j:=i+1 to l do
         if a[i]=a[j] then d[i,i+1]:=2 else d[i,i+1]:=1;}

        for i:=l-2 downto 0 do
         for j:=i+1 to l do
         if a[i]=a[j] then
                d[i,j]:=d[i+1,j-1]+2
          else
                d[i,j]:=(abs(d[i+1,j]-d[i,j-1])+d[i+1,j]+d[i,j-1]) div 2;
         i:=0;
         j:=l-1;
         k:
         while i<=j do
         if a[i]=a[j] then
         begin
                write
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.
