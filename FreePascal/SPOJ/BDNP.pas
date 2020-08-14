const   finp    =      'DNC.INP';
        fout    =      'DNC.out';
var     g,f     :      text;
        n       :      longint;
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
function        getbit(i,n:longint):byte;
begin
        getbit:= (n shr i) and 1;
end;
procedure       xuly;
var     i:longint;
begin
        readln(f,n);
        for i:=sizeof(n)*8 downto 0 do
         write(g,getbit(i,n));
         writeln(g);
         if getbit(0,n)=0 then writeln(g,'CHAN') else writeln(g,'LE');
         if n-(n shr 3)*8=0 then writeln(g,'CO') else writeln(g,'KHONG');
         writeln(g,(n shr 3)*8);
         writeln(g,(n shr 5)*32)
end;
begin
        mo;
        xuly;
        dong;
end.