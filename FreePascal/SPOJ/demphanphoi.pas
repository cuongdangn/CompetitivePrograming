const   finp    =       'dnc.inp';
var     a      :       array[1..1000] of longint;
        n       :       longint;
        f       :       text;
procedure    sort;
var    i,j    :    longint;
        dem    :    array[1..100000] of longint;
begin
    fillchar(dem,sizeof(dem),0);
    for i:=1 to n do
      inc(dem[a[i]]);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        sort;
end;
begin
        assign(f,finp);
        reset(f);
        doc;
        close(f);
end.