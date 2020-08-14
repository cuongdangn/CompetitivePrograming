const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        d,d1       :       array[0..1000010] of longint;
        n       :       longint;
        dau,cuoi,dau1,cuoi1 :      longint;

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
procedure       swap(var a,b    :       longint);
var     tg      :       longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;

procedure       xuly;
var     i,j,k,dem     :longint;
        c       :char;
begin
        read(f,n,k);
        dau:=1;cuoi:=n;
        for i:=1 to n do
         d[i]:=i-1;
         read(f,c);
        repeat
         read(f,c);
         if c='.' then break;
         cuoi1:=cuoi+1;
         dau1:=dau+1;
         if dau1>n then dau1:=1;
         if cuoi1>n then cuoi1:=1;
         if c='A' then
          begin
           dau:=dau1;
           cuoi:=cuoi1;
          end;
          if c='B' then
           begin
            swap(d[dau],d[dau1]);
            dau:=dau1;
            cuoi:=cuoi1;
           end;
        until false;
        if dau>cuoi then
         begin
          dem:=0;
          for i:=dau to n do
           begin
            inc(dem);
            d1[dem]:=d[i];
           end;
          for i:=1 to dau-1 do
           begin
            inc(dem);
            d1[dem]:=d[i];
           end;
         end
        else
         begin
          for i:=1 to n do
            d1[i]:=d[i];
          dem:=n;
         end;
          writeln(g,d1[k],' ',d1[k+1],' ',d1[k+2]);
end;
begin
        mo;
        xuly;
        dong;
end.

