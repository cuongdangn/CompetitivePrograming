const   finp    =       '';
        fout    =       '';
var     g,f:    text;
        n,m     :       longint;
        a       :       array[1..30,1..30] of byte;
        c       :       array[1..30,1..30] of longint;
        b       :       array[1..32*32,1..32*32] of longint;
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
var      i,j    :       longint;
begin
        readln(f,n,m);
        for i;=1 to n do
                begin
                        for j:=1 to  m do read(f,a[i,j]);
                        readln(f);
                end;
end;
procedure       ktao;
var     i,j       :       longint;
begin
        for i:=1 to n do
         for j:=1 to m do
           c[i,j]:=(i-1)*n+j;
        for i:=1 to n do
         for j:=1 to m do
          begin




procedure       xuly;
var     i       :       longint;
begin
        ktao;
