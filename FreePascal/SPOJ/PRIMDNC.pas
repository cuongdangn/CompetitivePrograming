const   finp    =       '';
        fout    =       '';
        maxn    =       300;
var     g,f     :       text;
        dd,free    :       array[1..maxn] of longint;
        c       :       array[1..maxn,1..maxn] of longint;

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
function       findmin:longint;
var     i,j,tm :        longint;
begin
        tm:=maxlongint;
        for i:=1 to n do
                begin
                        if (dd[i]=0)and(c[free[i],i]<tam) then
                                begin
                                        tam:=c[free[i],i];
                                        j:=i;
                                end;
                end;
        exit(j);
end;
procedure       prim;
var     i,j,v       :longint;
begin
        for i:=2 to n do
                begin
                      v;=findmin;
                      dd[v]:=1;
                      for j:=1 to n do
                       if (dd[j]=0)and(c[free[j],j]>c[v,j] then
                       free[j]:=v;
                end;
end;