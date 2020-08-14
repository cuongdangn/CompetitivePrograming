const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
        //'e1.out'
var     g,f     :       text;
        n,m,cuoi,dau     :       longint;
        st,dd      :       array[0..1000001] of longint;
        a,luu       :       array[1..1000001] of longint;

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
var     i,j,ti,ne,top     :       longint;
begin
        read(f,n,m);
        top:=0;
        for i:=1 to m do
                begin read(f,a[i]);if a[i]=0 then inc(top) end;
        i:=1;
        ti:=0;
        ne:=0;
        for i:=1 to n do dd[i]:=0;
        i:=1;
        while i<=m do
         begin
                while (i<=m)and(a[i]=0) do begin inc(i);inc(ti) end;
                inc(ne);
                while (i<=m)and(a[i]<>0) do
                 begin
                  if (ti=0)or(dd[a[i]]=ne) then begin writeln(g,'NO');exit end;
                  dd[a[i]]:=ne;
                  inc(i);
                  dec(ti);
                 end;
         end;
         writeln(g,'YES');
        n:=top;
        cuoi:=0;
        dau:=1;
         for i:=m downto 1 do
          if a[i]<>0 then begin inc(cuoi);st[cuoi]:=a[i] end
           else
            begin
                if dau<=cuoi then begin luu[top]:=st[dau];inc(dau) end
                else luu[top]:=0;
                dec(top);
            end;
          for i:=1 to n do
           write(g,luu[i],' ');


         writeln(g);
end;
procedure       xuly;
var     t,i       :       longint;
begin
        readln(f,t);
        for i:=1 to t do
        doc;
end;
begin
        mo;
        xuly;
        dong;
end.
