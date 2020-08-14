uses    math;
const   finp    =       '';
        fout    =       '';
type    bg1      =       record
        a,b,c   :       real;
        end;
        bg2     =        record
        l,r     :        real;
        end;
var     q,n     :       longint;
                g,f     :       text;
        nui     :       array[1..2000] of bg1;
        cap     :       array[1..500000] of bg2;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(g);
        close(f);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n,q);
        for i:=1 to n do
         readln(f,nui[i].a,nui[i].b,nui[i].c);
        for i:=1 to q do
         readln(f,cap[i].l,cap[i].r);
end;
procedure       xuly;
var     i,j       :       longint;
        kq,t,ma:real;
begin
        for i:=1 to q do
         begin
                kq:=-1;
                for j:=1 to n do
                begin
                t:=-nui[j].b/(2*nui[j].a);
                if (t>=cap[i].l)and(t<=cap[i].r) then ma:=t
                else
                 if t>cap[i].r then ma:=cap[i].r
                 else ma:=cap[i].l;
                 kq:=max(kq,nui[j].a*ma*ma+nui[j].b*ma+nui[j].c);
                 end;
                 kq:=kq+1;
                 writeln(g,kq:0:2);

         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.