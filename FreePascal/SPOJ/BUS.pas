const   finp    =   'DNC.inp';
        fout    =   'DNC.out';
var    g,f :   text;        b,n:longint;
       a,luu,d: array[0..100000] of longint;
procedure   mo;
begin
    assign(f,finp);
    reset(f);
    assign(g,fout);
    rewrite(g);
end;
procedure   dong;
begin
    close(f);
    close(g);
end;
procedure   doc;
var i:longint;
begin
    readln(f,n,b);
    for i:=1 to n do read(f,a[i]);
end;
procedure   qhd;
var      i,j:longint;
begin
    for i:=1 to b do
     begin
     d[i]:=maxint;
     for j:=1 to n do
      if j<=i then
      if d[i]>(d[i-j]+a[j]) then
      begin
        luu[i]:=j;
        d[i]:=d[i-j]+a[j];
      end;
      end;
end;
procedure   xuat;
var     i  ,t :longint;
begin
     write(g,d[b],' ');
     i:=b;t:=0;
     while i<>0 do
     begin
        inc(t);
        i:=i-luu[i];
     end;
     i:=b;writeln(g,t);
     while i<>0 do
     begin
           write(g,luu[i],' ');
           i:=i-luu[i];
     end;
end;
begin
    mo;
    doc;
    qhd;
    xuat;
    dong;
end.
