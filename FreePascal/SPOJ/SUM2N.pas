const   finp    =       'SUM2N.INP';
        fout    =       'SUM2N.OUT';
var     g,f     :       text;
        n,k     :       int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;

function        nhanad(a,b:int64):int64;
begin
        nhanad:=0;
        while a>=1 do
                begin
                        if a mod 2 =1 then nhanad:=(nhanad+b)mod k;
                        b:=((b mod k)+(b mod k)) mod k;
                        a:=a div 2;
                end;
                nhanad:=nhanad mod k;
end;
function        pow(a,b:int64):int64;
var     tg      :       int64;
begin
        if b=1 then exit(a);
        tg:=pow(a,b div 2);
        tg:=nhanad(tg,tg);
        if b mod 2 =1 then tg:=nhanad(tg,a);
        exit(tg);
end;
procedure       doc;
var     tg1     :       int64;
begin
        while not seekeof(f) do
         begin
          readln(f,n,k);
          tg1:=pow(2,n);
          tg1:=nhanad(tg1,n-1);
          tg1:=tg1+1;
          writeln(g,tg1 mod k);
         end;
         //writeln(nhanad(15,50));
end;
begin
        mo;
        doc;
        close(f);
        close(g);
end.
