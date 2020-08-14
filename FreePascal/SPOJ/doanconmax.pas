const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..1000] of longint;
        n,s,smax       :       longint;
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
var     d,c,i   :       longint;

begin
        for i:=1 to n do smax:=smax+a[i]; // khoi tao smax = tong n phan tu

        for d:=1 to n do
         for c:=d to n do
          begin
           s:=0;
           for i:=d to c do s:=s+a[i];
           if s>smax then smax:=s;
          end;

          writeln(g,smax);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.