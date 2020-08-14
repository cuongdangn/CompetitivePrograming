const   finp    =       '';
        fout    =       '';
var     dau,cuoi,a       :       array[0..100] of longint;
        n,s,t,k       :       longint;
        g,f     :   text;

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

function ktra(k:longint):boolean;
var     i,j,ss     :       longint;
begin

        if(s mod k<>0) then exit(false);
        t:=s div k;
        for i:=1 to k-1 do
          begin
             dau[i]:=cuoi[i-1]+1;
             ss:=0;
             for j:=dau[i] to n do
              begin
                ss:=ss+a[j];
                if ss=t then
                        begin
                                cuoi[i]:=j;
                                break;
                        end;
              end;
              if ss<>t then exit(false);
          end;
          exit(true);
end;
procedure       doc;
var     i,j     :       longint;
begin
        read(f,n);
        for i:=1 to n do
         begin
          read(f,a[i]);
          s:=s+a[i];
         end;
end;

begin
        mo;
        doc;
        for k:=n downto 1 do
          if ktra(k) then
           begin
                writeln(g,k);
                writeln(g,t);
                break;
           end;
        dong;
end.