uses    math;
const   finp    =       'tong_doan.inp';
        fout    =       'tong_doan.out';
var     g,f     :       text;
        smax    :       longint;
        n       :       longint;
        a       :       array[1..10000] of longint;
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
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,s    :longint;
begin
        s:=0;
        smax:=a[1];
        for i:=1 to n do
         begin
          s:=s+a[i];
          smax:=max(smax,s);
          if s<0 then s:=0;
         end;
         writeln(g,smax);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.