const   finp    =       'Digicomp2.INP';
        fout    =       '';
type    bg      =       record
        tr,ph   :       longint;
        end;
var     g,f     :       text;
        n       :       int64;
        m     :       longint;
        a       :   array[1..500000] of bg;
        ht      :  array[1..500000] of char;
        lt      :  array[0..25] of longint;
        s       :  array[1..1000000] of string;
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
var     i,j,t,sa     :       longint;
begin
        lt[0]:=1;
        for i:=1 to 20 do
         lt[i]:=lt[i-1]*2;
        if m<=20 then
          begin
           for i:=1 to m do s[1]:=s[1]+ht[i];
           for i:=2 to lt[m] do
            begin
            t:=1;
            while t<>0 do
             begin
                if ht[t]='L' then
                sa:=a[t].tr else sa:=a[t].ph;
                ht[t]:=chr(158-ord(ht[t]));
                t:=sa;
             end;
             for j:=1 to m do s[i]:=s[i]+ht[j];
            end;
            //////////////////
            t:=n mod lt[m];
            t:=t+1;
             writeln(g,s[t]);
         end;
end;
begin
        mo;
        doc;
        if (int64(n)*int64(m)<=100000000) then trau
         else chutrinh;
        dong;
end.
