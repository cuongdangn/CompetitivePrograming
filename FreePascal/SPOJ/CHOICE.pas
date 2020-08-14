const   finp    =       'CHOICE.INP';
        fout    =       'CHOICE.OUT';
        du      =       1000000007;
var     g,f     :       text;
        a,b     :       array[0..100000] of longint;
        n       :       longint;
        dd      :       array[0..100000] of int64;
        tic,dem,kq     :       int64;
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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
              begin
                read(f,a[i]);
                if a[i]>0 then tic:=tic*a[i] else inc(dem);
              end;
                if dem>2 then tic:=0;
        for i:=1 to n-1 do
                begin
