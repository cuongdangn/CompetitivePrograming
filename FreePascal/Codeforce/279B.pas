const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..200001] of bg;
        b       :       array[1..200001] of longint;
        tr,ph   :       array[0..1000001] of longint;
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
var     i,j,t     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
         begin
          readln(f,a[i].x,a[i].y);
          tr[a[i].x]:=i;
          ph[a[i].y]:=i;
         end;
         i:=2;
         t:=tr[0];
         while i<=n do
          begin
           b[i]:=a[t].y;
           t:=tr[a[t].y];
           i:=i+2;
          end;
         for i:=1 to n do
          if a[i].x <>0 then
           if ph[a[i].x]=0 then
            begin
             t:=i;
             b[1]:=a[i].x;
             j:=1;
             while j<=n do
              begin
               j:=j+2;
               if j>n then exit;
               b[j]:=a[t].y;
               t:=tr[a[t].y];
              end;
            end;
end;
procedure       xuat;
var     i       :       longint;
begin
        for i:=1 to n do write(g,b[i], ' ');
end;
begin
        mo;
        doc;
        xuat;
        dong;
end.

