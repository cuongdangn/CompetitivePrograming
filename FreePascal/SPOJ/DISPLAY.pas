const   finp    =       'DISPLAY.INP';
        fout    =       'DISPLAY.OUT';
var     g,f     :       text;
        n,m,n1,m1:longint;
        k       :     longint;
        kq      :int64;
        a       :     array[0..101,0..101] of longint;
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
var     i,j:longint;
        t:      int64;
begin
        readln(f,m,n);
        readln(f,m1,n1);
        readln(f,k);
        for i:=1 to m do
         begin
          for j:=1 to n do
                begin
                        read(f,t);
                        t:=t mod k;
                        a[i,j]:=t;
                end;
          readln(f);
         end;
end;
procedure       xuly;
var     i,j,i1,j1,t       :       longint;
begin
        i1:=1;
        j1:=1;
        repeat
                for i:=i1 to m do
                 begin
                 for j:=j1 to n do
                  if a[i,j]<>0 then
                        begin

                                if j>n-n1+1 then
                                        begin
                                                writeln(g,'IMPOSIBLE');
                                                dong;
                                                halt;
                                        end
                                else
                                    begin
                                     j1:=j;
                                     break;
                                    end
                        end;
                  if a[i,j]<>0 then
                   begin
                   if i>m-m1+1 then
                        begin
                                begin
                                    writeln(g,'IMPOSIBLE');
                                    dong;
                                    halt;
                                end
                        end
                   else
                       begin
                        i1:=i;
                        break;
                       end
                    end
                    else j1:=1;
                   end;

                 if (i=m)and(j=n)and(a[i,j]=0) then  break;
                 kq:=kq+k-a[i1,j1];
                 t:=k-a[i1,j1];
                 for i:=i1 to i1+m1-1 do
                  for j:=j1 to j1+n1-1 do
                        a[i,j]:=(a[i,j]+t)mod k;
        until false;
end;
begin
        mo;
        doc;
        xuly;
        writeln(g,kq);
        dong;
end.
