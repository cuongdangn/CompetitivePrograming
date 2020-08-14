{$r-,l-,q-}
{$m 1000000000}
const   finp    =       '';
        fout    =       '';
        maxn    =       200000;
type    node=^re;
        re=     record
                v       :       longint;
                next    :       node;
        end;
var     g,f     :       text;
        n,k     :       longint;
        lt      :       array[0..22] of longint;
        h       :       array[1..maxn] of longint;
        ke      :       array[1..maxn] of node;
        tham    :       array[1..maxn] of boolean;
        cha,tong:       array[0..maxn,0..22] of longint;


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
procedure       nap(var ke:node;v:longint);

