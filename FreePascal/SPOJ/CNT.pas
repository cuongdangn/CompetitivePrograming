const   finp    =       'CNT.INP';
        fout    =       'CNT.OUT';
var     g,f     :       text;
        a       :       array[1..200,1..200] of byte;
        n,k,kq      :       longint;
        x       :       array[1..200] of byte;
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
var     i,u,v       :       longint;
begin
        readln(f,n,k);
        while not seekeof(f) do
         begin
             readln(f,u,v);
             inc(a[u,v]);
             inc(a[v,u]);
         end;
end;
procedure       leodoi;
var i,j,j1,dem,dem1,min,y :       longint;
begin

        for i:=1 to n do
         if x[i]=1 then
         begin
           min:=51;
           dem:=0;
           for j:=1 to n do
            if x[j]=1 then dem:=dem+a[i,j];
           for j:=1 to n do
            if x[j]=0 then
           begin
            dem1:=0;
              for j1:=1 to n do
               if (x[j1]=1)and(j1<>i) then
                 dem1:=dem1+a[j,j1];
                 if dem1<min then
                   begin
                    min:=dem1;
                    y:=j;
                   end;
            end;
            if min<dem then
             begin
              x[i]:=0;
              x[y]:=1;
              kq:=kq-dem+min;
             end;
         end;
end;
procedure       tham;
var     i1,i,j,j1,dem,y,min,res        :       longint;
begin
        kq:=0;
        x[1]:=1;
        for i:=1 to k-1 do
         begin
          min:=51;
          for j:=1 to n do
           if x[j]=0 then
            begin
              dem:=0;
              for j1:=1 to n do
               if x[j1]=1 then dem:=dem+a[j,j1];
              if dem<min then
               begin
                     min:=dem;
                     y:=j;
               end;
            end;
            x[y]:=1;
            kq:=kq+min;
         end;

         leodoi;
         res:=0;
         for i:=1 to n do
          if x[i]=1 then inc(res);
          writeln(res);
         writeln(g,kq);
         for i:=1 to n do
          if x[i]=1 then write(g,i,' ');
end;
begin
        mo;
        doc;
        tham;
        dong;
end.
