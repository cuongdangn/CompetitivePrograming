const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        cha     :       array[0..10001] of longint;
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
function        tim(i:longint):longint;
begin
        if cha[i]<0 then exit(i);
        cha[i]:=tim(cha[i]);
        exit(cha[i]);
end;
procedure       doc;
var     i,cha1,cha2,x,y,z       :       longint;
begin
        readln(f,n);
        for i:=1 to 10000 do cha[i]:=-1;
        for i:=1 to n do
         begin
                readln(f,x,y,z);
                if z=1 then
                        begin
                              cha1:=tim(x);
                              cha2:=tim(y);
                        if (cha1<>cha2) then
                        begin
                                 cha[cha1]:=cha2;
                        end;
                         end
                else
                        begin
                                cha1:=tim(x);
                                cha2:=tim(y);
                        if (cha1=cha2) then writeln(g,1) else writeln(g,0);
                        end;
        end;
end;
begin
        mo;
        doc;
        dong;
end.