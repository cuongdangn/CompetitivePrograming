uses    math;
const   finp    =       '';
        fout    =       '';
var     d,luu,sl       :       array[0..1000001] of longint;
        a       :       array[1..9] of longint;
        i,j,n     :       longint;
        g,f     :       text;
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
        readln(f,n);
        for i:=1 to 9 do read(f,a[i]);
end;
procedure          qhd;
var     i , j,ii , min,maxx     :       longint ;
        kq,s    :       ansistring;
begin
        kq:='';
        s:='';
        d[0]:=0;
        maxx:=0;
        luu[0]:=0;
             For i:=1 to n do
              begin
                   luu [i] :=-2*maxint ;
                   min := -maxlongint ;
                   for j := 1 to 9 do
                    if a [j] <= i then
                    begin
                     if min <=d[i-a[j]]+1 then
                      begin
                           luu[i]:= j ;
                           min := d [i-a[j]]+1 ;
                      end ;
                     end;
                   d[i] := min ;
                   maxx:=max(maxx,d[i]);
              end ;
        if maxx=0 then
                begin
                        writeln(g,-1);
                        exit;
                end;
        for ii:=1 to n do
        if d[ii]=maxx then
        begin
        s:='';
        for i:=1 to 9 do sl[i]:=0;
        i:=ii;
        j:=luu[i];
         while j>0 do
              begin
                   inc ( sl [ j ] ) ;
                   i := i - a [ j ] ;
                   j := luu [ i ] ;
              end ;
         for i:=9 downto 1 do
                if sl[i]>0 then
                for j:=1 to sl[i] do s:=s+char(i+48);
                if s>kq then kq:=s;
         end;

         writeln(g,kq);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.





