const   finp    =       'CKN.INP';
        fout    =       'CKN.OUT';
var     g,f     :       text;
        n,k,c   :       longint;
        sl      :       array[1..1000000] of longint;
        nt      :       array[1..90000] of longint;
        slnt    :       longint;
        dd      :       array[1..1000000] of byte;
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
begin
        readln(f,k,n,c);
end;
procedure       sang;
var     i,j     :       longint;
begin
        for i:=2 to trunc(sqrt(n)) do
         if dd[i]=0 then
          begin
           j:=i*i;
           while j<=n do
            begin
             dd[j]:=1;
             j:=j+i;
            end;
           end;
           dd[1]:=1;
          for i:=2 to n do
           if dd[i]=0 then
            begin
             inc(slnt);
             nt[slnt]:=i;
            end;
end;
procedure       tang(t,x:longint);
var     i,j     :       longint;
begin
        if dd[t]=0 then
         begin
           inc(sl[t],x);
           if sl[t]>0 then kq:=kq*t mod c;
           exit;
         end;
        for i:=1 to slnt do
        if (t mod nt[i]=0) then
         begin
          while (t>0)and(t mod nt[i]=0) do
           begin
             inc(sl[nt[i]],x);
              t:=t div nt[i];
              if sl[nt[i]]>0 then kq:=kq*int64(nt[i]) mod c;
           end;
           if t=0 then break;
           if dd[t]=0 then break;
          end;
          if t>0 then begin inc(sl[t],x);if sl[t]>0 then kq:=kq*t mod c; end;

end;
procedure       xuly;
var     i       :       longint;
begin
        sang;
        if n-k<k then
        begin
         for i:=1 to n-k do
          tang(i,-1);
          kq:=1;

        for i:=k+1 to n do
          tang(i,1);
          end
        else
         begin
          for i:=1 to k do
           tang(i,-1);
           kq:=1;
           for i:=n-k+1 to n do
            tang(i,1);
          end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
