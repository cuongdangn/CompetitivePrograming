const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
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
var     i,j     :       longint;
begin
        readln(f,m);
        for i:=1 to m do
         begin
           readln(f,a[i][0]);
           for j:=1 to k[i] do
            read(f,a[i][j]);
         end;
end;
function        nho(a,b:arr):boolean;
var     i       :       longint;
begin
        n1:=a[0];
        n2:=b[0];
        n:=



procedure       QS(l,h:longint);
var     i,j,t     :       longint;
        x,tg    :       arr;
begin
        i:=l;
        j:=h;
        x:=a[random(h-l+1)+l];
        repeat
         while nho(a[i],x) do inc(i);
         while lon(x,a[j]) do dec(j);
         if i<=j then
          begin
           tg:=a[i];
           a[i]:=a[j];
           a[j]:=tg;
           inc(i);dec(j);
          end;
         until i>j;
         if i<h then QS(i,h);
         if j>l then QS(l,j);
end;

