const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       byte;
        x       :       longint;
        p       :       array[1..4] of byte;
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
end;
function        kt(c:longint):boolean;
var     i:longint;
begin
        kt:=true;
        for i:=2 to trunc(sqrt(c)) do
        if c mod i=0 then exit(false);
end;
procedure       DEQUY(j:longint);
var     i       :longint;
begin
        for i:=1 to 9 do
                begin
                             if kt(x*10+i)  then
                              if j=n then
                              writeln(g,x*10+i)
                              else
                              begin
                              x:=x*10+i;
                              DEQUY(j+1);
                              x:=x div 10;
                              end

                end;
end;
procedure       xuly;
var     i:byte;
begin
        p[1]:=2;
        p[2]:=3;
        p[3]:=5;
        p[4]:=7;
        for i:=1 to 4 do
        begin
                x:=p[i];
                DEQUY(2)
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
