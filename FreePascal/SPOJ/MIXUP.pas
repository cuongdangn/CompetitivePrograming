const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..16] of longint;
        d       :       array[1..65535,1..16] of longint;
        n,k     :       longint;
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
        readln(f,n,k);
        for i:=1 to n do readln(f,a[i]);
end;
procedure       QHD;
var     i,j,x,y,dem  :       longint;
begin
        dem:=0;
        for  i:=1 to (1 shl n)-1 do
                for j:=1 to n do d[i,j]:=0;
        d[1,1]:=1;
        for i:=1 to n -1 do
                d[1 shl i,i+1]:=1;

        for i:=1 to (1 shl n)-1 do
                for j:=1 to n do
                  if d[i,j]>0 then
                   for x:=1 to n do
                        if (x<>j)and(abs(a[x]-a[j])>k) then
                                begin
                                      y:=i or (1 shl(x-1));
                                      if ((i shr (x-1)) and 1 =0 ) then
                                      d[y,x]:=d[y,x]+1;
                                end;
                   for i:=1 to n do dem:=dem+d[(1 shl n)-1,i];
                   writeln(g,dem);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.