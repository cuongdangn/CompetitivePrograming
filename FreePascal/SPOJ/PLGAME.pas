uses    math;
const   finp    =       'PLGAME.INP';
        fout    =       'PLGAME.OUT';
var     g,f     :       text;
        n,kq       :       longint;
        c      :       array[1..3,1..3] of byte;
        d       :       array[1..3,1..1000,1..3,1..1000] of longint;
        a       :       array[1..3,1..1000] of char;
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
var     i,j     :longint;
begin
        readln(f,n);
        for i:=1 to 3 do
         begin
                for j:=1 to n do read(f,a[i,j]);
                readln(f);
         end;
end;
procedure       xuly;
var     i,l,j,i1,j1,i2,i3       :       longint;
begin
        c[1,1]:=1;
        c[1,2]:=1;
        c[2,1]:=1;
        c[2,3]:=1;
        c[2,2]:=1;
        c[3,2]:=1;
        c[3,3]:=1;
        kq:=1;
        for i:=1 to 3 do
         for j:=1 to n do
          d[i,j,i,j]:=1;
        for i:=1 to 3 do
         for j:=1 to n-1 do
          begin
                j1:=j+1;
                for i1:=1 to 3 do
                 if c[i,i1]=1 then
                  if a[i,j]=a[i1,j1] then
                   begin
                   d[i,j,i1,j1]:=2;
                   kq:=2;
                   end;
          end;
        for l:=3 to n do
         for i:=1 to 3 do
          for j:=1 to n+1-l do
           begin
              j1:=j+l-1;
              for i1:=1 to 3 do
              if a[i1,j1]=a[i,j] then
               begin
                   for i2:=1 to 3 do
                   begin
                    for i3:=1 to 3 do
                     if (c[i,i2]=1)and(c[i3,i1]=1) then
                      if d[i2,j+1,i3,j1-1]>0 then
                       begin
                          d[i,j,i1,j1]:=d[i2,j+1,i3,j1-1]+2;
                          break;
                       end;
                       if  d[i,j,i1,j1]>0 then break;
                    end;
                      kq:=max(kq,d[i,j,i1,j1]);
               end;
           end;
end;
begin
        mo;
        doc;
        xuly;
        writeln(g,kq);
        dong;
end.
