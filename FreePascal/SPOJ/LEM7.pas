{$inline on}

uses math;

const
          finp = '';
          fout = '';

type
          data = record
               n,s,k : longint;
          end;

var
          fi,fo : text;
          f : array[1..10000] of data;
          e : longint;

procedure init;     inline;
          var i,p : longint;
          begin
               for i := 1 to e do
               with f[i] do
               begin
                    k := 1;
                    for p := trunc(sqrt(i)) downto 1 do
                         if i mod p = 0 then break;
                    n := p + (i div p);
                    s := min(p,i div p);
               end;
          end;

function ss(a,b : data) : shortint;     inline;
          begin
               if a.n < b.n then exit(-1)
                    else if a.n > b.n then exit(1);
               if a.s < b.s then exit(-1)
                    else if a.s > b.s then exit(1);
               if a.k < b.k then exit(-1)
                    else if a.k > b.k then exit(1);
               exit(0);
          end;

function cong(a,b : data) : data;       inline;
          begin
               cong.n := a.n + b.n;
               cong.s := a.s + b.s;
               cong.k := a.k + b.k;
          end;

procedure lam;
          var i,j : longint;
              tmp : data;
          begin
               for i := 3 to e do
                    for j := (i div 2) to i-1 do
                    begin
                         tmp := cong(f[j],f[i-j]);
                         if ss(tmp,f[i]) = -1 then f[i] := tmp;
                    end;
          end;

begin
          assign(fi,finp);    reset(fi);
          readln(fi,e);
          close(fi);

          init;
          lam;

          assign(fo,fout);    rewrite(fo);
          writeln(fo,f[e].n,' ',f[e].s,' ',f[e].k);
          close(fo);
end.
