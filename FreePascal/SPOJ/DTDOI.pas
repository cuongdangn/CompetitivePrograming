program doitien;
const
   fi='';
   fo='';
   mn=110;
   max=1000000;
var
   f:text;
   a: array[0..mn] of longint;
   l: array[0..max] of longint;
   n,m,dem: longint;

   procedure input;
   var
     i: longint;
   begin
     assign(f,fi);
     reset(f);
     readln(f,n,m);
     for i:=1 to n do
       read(f,a[i]);
     close(f);
   end;

   procedure QHD;
   var
     i,j: longint;
   begin
     For i:=1 to n do
       l[i]:=max;
       l[0]:=0;
     For j:=1 to m do
         for i:=1 to n do
         begin
           if (j>=a[i]) then
             if (l[j]=0)or(l[j] > l[j-a[i]]+1) then
              l[j]:=l[j-a[i]]+1;
       end;
   end;

   procedure Qsort(l,r: longint);
   var
     x,y,i,j: longint;
   begin
     if l>=r then exit;
     i:=l;
     j:=r;
     x:=a[random(r-l+1)+l];
     Repeat
       While (a[i]<x) do inc(i);
       While (a[j]>x) do dec(j);
       if (i<=j) then
         begin
           if i<j then
            begin
               y:=a[i];a[i]:=a[j];a[j]:=y;
            end;
           inc(i);
           dec(j);
         end;
     Until (i>j);
     Qsort(i,r);Qsort(l,j);
   end;


   procedure xuli;
   var
     i: longint;
   begin
     dem:=0;
     Qsort(1,n);
     i:=n;
   if (m mod a[n] >= 1000) or (m mod a[n] = 0) then
  begin
    dem := m div a[n];
    m := m mod a[n];
  end else
  begin
    dem := (m - 1000) div a[n] + 1;
    m := m - dem*a[n];
  end;

      QHD;
      dem:=dem+l[m];
   end;

   procedure printf;
   begin
      assign(f,fo);
      rewrite(f);
      writeln(f,dem);
      close(f);
   end;

   BEGIN
     Input;
     xuli;
     printf
   end.
