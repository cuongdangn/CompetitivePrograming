uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[0..2500] of longint;
        d,cs      :       array[-2000000..2000000] of longint;
        n,kq       :       longint;
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
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,j,t       :longint;
begin
        for i:=2 to n do
              begin
              kq:=max(kq,d[a[i]]);
              for j:=i-1 downto 1 do
              if cs[a[i]]=j then
              begin
              if d[a[i]+a[j]]<d[a[i]]+1 then
              begin
                d[a[i]+a[j]]:=d[a[i]]+1;
                cs[a[i]+a[j]]:=i;
              end
              end
              else
              if d[a[i]+a[j]]<3 then
              begin
              d[a[i]+a[j]]:=3;
              cs[a[i]+a[j]]:=i;
              end;
              end;

        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
