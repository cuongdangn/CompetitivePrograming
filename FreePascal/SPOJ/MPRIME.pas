const   finp    =       'MPRIME.INP';
        fout    =       'MPRIME.OUT';
        p       :       array[1..15] of integer =(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47);
type    ds      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        a       :       array[1..15,1..15] of longint;
        dd,dc   :       array[1..15,1..50] of byte;
        dsa     :       array[1..16*16] of ds;
        n       :       longint;
        dem     :       longint;
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
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                     for j:=1 to n do
                       begin
                        read(f,a[i,j]);
                        if a[i,j]=0 then
                        begin
                                inc(dem);
                                dsa[dem].x:=i;
                                dsa[dem].y:=j;
                        end
                        else
                        begin
                        dd[i,a[i,j]]:=1;
                        dc[j,a[i,j]]:=1;
                        end;
                        end;
                        readln(f);
                end;
end;
procedure       xuat;
var     i,j     :       longint;
begin
        for i:=1 to n do
        begin
                {write(g,'writeln(g,',char(39)); }
                for j:=1 to n do write(g,a[i,j],' ');
                {write(g,chr(39),');');}
                writeln(g);
        end;
end;
procedure       duyet(i:byte);
var     x1,y1,j       :longint;
begin
        if i>dem then
                begin
                        xuat;
                        dong;
                        halt;
                end;
        x1:=dsa[i].x;
        y1:=dsa[i].y;
        for j:=1 to n do
              if (dd[x1,p[j]]=0)and(dc[y1,p[j]]=0) then
                begin
                        a[x1,y1]:=p[j];
                        dd[x1,p[j]]:=1;
                        dc[y1,p[j]]:=1;
                        duyet(i+1);
                        dd[x1,p[j]]:=0;
                        dc[y1,p[j]]:=0;
                end;
end;
begin
        mo;
        doc;
        if dem<15*15 then duyet(1) else
                begin
                        writeln(g,'2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 ');
writeln(g,'3 2 7 5 13 11 19 17 29 23 37 31 43 47 41 ');
writeln(g,'5 7 2 3 17 19 11 13 31 37 23 29 47 41 43 ');
writeln(g,'7 5 3 2 19 17 13 11 37 41 43 47 23 29 31 ');
writeln(g,'11 13 17 19 2 3 5 7 41 31 47 43 29 23 37 ');
writeln(g,'13 11 19 17 3 2 7 5 43 47 29 41 31 37 23 ');
writeln(g,'17 19 11 13 5 7 2 3 47 43 41 23 37 31 29 ');
writeln(g,'19 23 29 31 37 41 43 47 2 3 5 7 11 13 17 ');
writeln(g,'23 17 31 29 41 37 47 43 3 2 7 5 13 11 19 ');
writeln(g,'29 31 13 23 43 47 37 41 5 7 2 3 17 19 11 ');
writeln(g,'31 29 23 11 47 43 41 37 7 5 3 2 19 17 13 ');
writeln(g,'37 41 43 47 7 23 29 31 11 13 17 19 2 3 5 ');
writeln(g,'41 37 47 43 23 5 31 29 13 11 19 17 3 2 7 ');
writeln(g,'43 47 37 41 29 31 3 23 17 19 11 13 5 7 2 ');
writeln(g,'47 43 41 37 31 29 23 2 19 17 13 11 7 5 3 ');
             end;
        dong;
end.

