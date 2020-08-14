const   finp    =       'dnc.inp';
        fout    =       '';
type    bg      =       record
        tr,ph   :       longint;
        end;
var     g,f     :       text;
        n,m       :       longint;
        a       :   array[1..500000] of bg;
        ht      :  array[1..500000] of char;
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
var     i,j,sa,t     :       longint;
begin
        readln(f,n,m);
        for i:=1 to m do
          readln(f,ht[i],a[i].tr,a[i].ph);

end;

procedure       trau;
var     i,j,sa,t     :       longint;
begin
        for i:=1 to n do
         begin
          t:=1;
          while t<>0 do
           begin
            if ht[t]='L' then
             sa:=a[t].tr else sa:=a[t].ph;
            ht[t]:=chr(158-ord(ht[t]));
            t:=sa;
           end;
           {for j:=1 to m do
          write(g,ht[j]);
          writeln(g);}
         end;
         for i:=1 to m do
          write(g,ht[i]);
end;
procedure       chutrinh;
var     i,j     :       longint;
begin
        if m<=25 then
          begin


begin
        mo;
        doc;
        trau;
        dong;
end.
