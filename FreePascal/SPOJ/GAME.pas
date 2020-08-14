const   finp='GAME.INP';
        fout='GAME.OUT';
var     n,tmp,t,maxn,i:longint;
        f,g:text;
function        UCLN(x,y:longint):longint;
begin
    if y=0 then exit(x);
    exit(UCLN(y,x mod y));
end;

begin
    assign(f,finp);
    assign(g,fout);
    reset(f);
    rewrite(g);
    read(f,n);
    for i:=1 to n do
        begin
            read(f,tmp);
            if tmp>maxn then maxn:=tmp;
            if i=1 then
                begin
                    t:=tmp;
                    continue;
                end;
            t:=UCLN(t,tmp);
        end;

    if ((maxn div t)-n) mod 2=1 then writeln(g,'Alice')
    else writeln(g,'Bob');

    close(f);
    close(g);
end.
