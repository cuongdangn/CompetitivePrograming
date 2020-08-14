uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[0..2501] of longint;
        d      :       array[0..2501,0..2501] of longint;
        vt     :      array[-1000000..1000000] of longint;
        n,kq,i,max1,min1,t       :       longint;
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
        readln(f,n);
        max1:=-1000000;
        min1:=1000000;
        for i:=1 to n do
        begin
        read(f,a[i]);
        max1:=max(max1,a[i]);
        min1:=min(min1,a[i]);
        end;

end;
procedure       xuly;
var     i,j,t,t2       :longint;
begin
         for i:=-1000000 to 1000000 do vt[i]:=0;
         kq:=2;
         for i:=1 to n do
         begin
          for j:=i+1 to n do
           begin
            t:=a[j]-a[i];
            if (t<min1)or(t>max1) then t2:=0 else t2:=vt[t];
            if t2=0 then d[i,j]:=2
            else d[i,j]:=d[t2,i]+1;
            kq:=max(kq,d[i,j]);
           end;
           vt[a[i]]:=i;
          end;
          writeln(g,kq);
end;
begin
        mo;
        readln(f,t);
       for i:=1 to t do
       begin
        doc;
        xuly;
        end;
        dong;
end.
