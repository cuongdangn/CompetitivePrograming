const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
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
procedure       upheap(v:longint);
var     cha,con,x       :       longint;
begin
        con:=v;
        x:=h[v].key;
        while con>=2 do
                begin
                        cha:=con div 2;
                        if h[cha].key>=x then break;
                        h[con]:=h[cha];
                        con:=cha;
                end;
                h[con]:=v;
end;
procedure       downheap(v:longint);
var     cha,con,x       :       longint;
begin
        cha:=v;x:=h[v].key;
        while cha*2<=n do
                begin
                        con:=cha*2;
                        if (con,nheap)and(h[con].key<h[con+1].key) then inc(con);
                        if h[con].key<=x then break;
                        h[cha]:=h[con];
                        cha:=con;
                end;
                h[cha]:=v;
end;
procedure       doc;
var     i       :       longint;
begin
end;

