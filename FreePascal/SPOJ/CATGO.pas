uses    math;
const   finp    =       '';
        fout    =       '';
        maxx    =       maxlongint;
var     g,f     :       text;
        n,m       :       longint;
        a       :       array[1..51] of longint;
        d       :       array[1..51,0..51*51] of longint;
        fx      :       array[1..50,0..50] of longint;
        tong    :       array[0..51*51] of longint;
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
var     i,u,v     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         read(f,a[i]);
        read(f,m);
        for i:=1 to m do
        begin
          readln(f,u,v);
          fx[u,0]:=v;
        end;
end;
procedure       init;
var     i,j,k :    longint;
begin
        for i:=1 to 51*51 do
         tong[i]:=tong[i-1]+i;
        for i:=1 to 50 do
         for j:=1 to i-1 do
          for k:=i downto 2 do
           fx[i,j]:=max(fx[i,j],fx[i-k+1,0]+fx[k-1,j-1]);
end;


function        tinh(i,cut:longint):longint;
var     dem,j     :       longint;
begin
        if i=n+1 then exit(0);
        if d[i,cut]<>-1 then exit(d[i,cut]);
        dem:=-maxx;
        for j:=0 to a[i] do
        begin
        // writeln(dem,' ',cut+j);
         dem:=max(dem,tinh(i+1,cut+j)+fx[a[i],j]-tong[cut+j]+tong[cut]);
        end;
        d[i,cut]:=dem;
        exit(dem);
end;
procedure       xuly;
var     i,j,kq     :       longint;
begin
        init;
        fillchar(d,sizeof(d),255);
        kq:=tinh(1,0);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.