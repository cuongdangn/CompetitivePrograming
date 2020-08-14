const   finp    =       '';
        fout    =       '';
var     a:array[1..1001,1..1001] of shortint;
        d:array[0..1001,0..1001] of integer;
        i,j     :       integer;
        m,n,max :       integer;
        g,f     :       text;
        l,r     :       array[0..1001] of integer;
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
var     i,j     :       integer;
begin
        readln(f,m,n);
        for i:=1 to m do
         begin
         for j:=1 to n do read(f,a[i,j]);
         readln(f);
        end;
end;
procedure       xuly1(q:integer);
var     canh,i,j,k:integer;
begin
        for i:=1 to n do
        begin
                l[i]:=i;k:=i-1;
                while (k>0) and(d[q,i]<=d[q,k]) do
                        begin
                                l[i]:=l[k];
                                k:=l[k]-1;
                        end;
        end;
        for i:=n downto 1 do
        begin
                r[i]:=i;k:=i+1;
                while (k<=n) and(d[q,i]<=d[q,k]) do
                        begin
                                r[i]:=r[k];
                                k:=r[k]+1;
                        end;
        end;
        for i:=1 to n do
        begin
   	canh:=(-abs(d[q,i]-abs(r[i]-l[i])-1)+d[q,i]+abs(r[i]-l[i])+1)div 2;
        if canh>max then max:=canh;           
        end;
end;
procedure       xuly;
var     i,j:longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          if a[i,j]=1 then
                d[i,j]:=d[i-1,j]+1 else d[i,j]:=0;
        for i:=1 to m do  xuly1(i);
end;
procedure       xuly2;
var     i,j:longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          if a[i,j]=0 then
                d[i,j]:=d[i-1,j]+1 else d[i,j]:=0;
        for i:=1 to m do  xuly1(i);
end;

begin
        mo;
        doc;
        xuly;
        xuly2;
        writeln(g,max);
        dong;
end.