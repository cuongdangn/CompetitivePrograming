uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m,kq     :       longint;
        a,t,dd  :       array[0..10000] of longint;
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
        read(f,n,m);
        for i:=1 to n do
        begin
        read(f,a[i]);
        dd[a[i]]:=i;
        end;
        for i:=1 to 10000 do
                if dd[i]=0 then dd[i]:=dd[i-1];
end;
procedure       xuly;
var     i,j,t,j1       :longint;
begin
        kq:=-1;
        for i:=1 to n do
         for j:=1 to n do
                if i<>j then
                begin
                      t:=a[i]+a[j];
                      j1:=m-t;
                      if (j1>0)and(j1<=10000) then
                       if (dd[j1]=i)or(dd[j1]=j) then
                       begin
                        j1:=a[dd[j1]]-1;
                          if (j1>0)and(j1<=10000) then
                          begin
                          if (dd[j1]=i)or(dd[j1]=j) then
                                j1:=a[dd[j1]]-1;
                          end
                          else j1:=0;
                        end;
                           if (j1>0)and(j1<=10000) then
                           kq:=max(kq,t+a[dd[j1]])
                end;
                writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.



