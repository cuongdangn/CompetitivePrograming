
const   finp    =       'POINTS.INP';
        fout    =       'POINTS.OUT';
var     g,f     :       text;
        d,n     :     longint;
        a       : array[0..100001] of int64;
        kq      :       int64;
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
var     i:longint;
begin
        readln(f,n,d);
        for i:=1 to n do read(f,a[i]);
end;
function        chat(x,i,j:longint):longint;
var     da,cu,mid,kq       :       longint;
begin
        kq:=0;
        da:=i;
        cu:=j;
        while da<=cu do
        begin
              mid:=(da+cu) div 2;
              if a[mid]-a[x]<=d then
              begin
                kq:=mid;
                da:=mid+1;
              end
              else cu:=mid-1;
        end;
          exit(kq);
end;
procedure       xuly;
var     i,j       :       longint;
begin
        kq:=0;
        for i:=1 to n-2 do
                begin
                   j:=chat(i,i+1,n);
                   j:=j-i;
                   if j>=2 then kq:=(int64(j)*(j-1)) div 2+kq;
                end;
                writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



