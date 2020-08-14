const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        A       :       array [1..200] of byte;
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
procedure       xuat(q:longint);
var     i:longint;
begin
        for i:=1 to q do write(g,a[i]);
        writeln(g);
end;
procedure       xuly(m:longint);
var     i,j,c,t     :       longint;
begin
        for i:=1 to 200 do
         for j:=0 to i do
          begin
             for c:=1 to j do a[c]:=8;
             for c:=j+1 to i do a[c]:=6;
             t:=a[1];
             for c:=2 to i do t:=(t*10+a[c])mod m;
             if t mod m = 0 then
               begin
                xuat(i);
                exit;
               end;
          end;
          writeln(g,-1);
end;
procedure       doc;
var     n,i,z:longint;
begin
        readln(f,n);
        for i:=1 to n do
        begin
                readln(f,z);
                xuly(z);
        end;
end;
begin
        mo;
        doc;
        dong;
end.