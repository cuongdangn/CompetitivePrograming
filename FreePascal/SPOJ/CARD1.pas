const   finp    =       'CARD.INP';
        fout    =       'CARD.OUT';
var     g,f     :       text;
        sl      :       array[0..1] of longint;
        n,kq1      :       longint;
        d,dd      :       array[1..201] of longint;

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
procedure       xuly;
var     i,j,t     :       longint;
begin
        t:=1;
        while (sl[0]<>0)and(sl[1]<>0) do
         begin
            for i:=1 to 2*n do
             if (d[i]=t)and(dd[i]=0) then
              begin
                dd[i]:=1;
                dec(sl[t]);
                if sl[t]=0 then
                begin
                  kq1:=sl[1-t];
                  if t=1 then
                   begin
                    writeln(g,kq1);
                    writeln(g,0);
                   end
                  else
                   begin
                    writeln(g,0);
                    writeln(g,kq1);
                   end;

                 exit;
                end;
                t:=1-t;
              end;
              t:=1-t;
         end;
end;
procedure       doc;
var     i,t,j,t1    :       longint;
begin
        read(f,t);
        for i:=1 to t do
         begin
           read(f,n);
           for j:=1 to 2*n do d[j]:=0;
           for j:=1 to 2*n do dd[j]:=0;
           sl[1]:=n;sl[0]:=n;
           kq1:=0;
           for j:=1 to n do
            begin
             read(f,t1);
             d[t1]:=1;
            end;

           xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.