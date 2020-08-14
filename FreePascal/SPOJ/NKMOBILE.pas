const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        bit    :      array[0..1025,0..1025] of longint;
        t,n       :      longint;
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
procedure       update(x,y,x1:longint);
var y1,x2:longint;
begin

        while (x<=n) do
         begin
          y1:=y;
           while y1<=n do
            begin
                bit[x][y1]:=bit[x][y1]+x1;
                y1:=y1+y1 and (-y1);
            end;
           x:=x+x and (-x);
          end;
end;
function       get(x,y:longint):longint;
var sum,y1 : longint;
begin
  sum:=0;
  while (x>0) do
         begin
          y1:=y;
           while y1>0 do
            begin
                sum:=bit[x][y1]+sum;
                y1:=y1-y1 and (-y1);
            end;
           x:=x-x and (-x);
          end;
         exit(sum);
end;
procedure       xuly;
var  s:longint;
     x,y,x1,y1,kq:longint;
begin
 fillchar(bit,sizeof(bit),0);
 readln(f,s,n);
 n:=n+1;
 read(f,s);
 while s<>3 do
  begin
   if s=1 then
    begin
     readln(f,x,y,x1);
     update(x+1,y+1,x1);
    end
    else
     begin
      readln(f,x,y,x1,y1);
      kq:=get(x1+1,y1+1);
      kq:=kq-get(x,y1+1)-get(x1+1,y)+get(x,y);
      writeln(g,kq);
     end;
     read(f,s);
   end;
 end;
begin
 mo;
 xuly;
 dong;
end.
