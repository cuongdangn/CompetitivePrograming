const   finp            =       '';
        fout            =       '';
        du              =       1000000007;
var     g,f     :       text;
        n,k     :       longint;
        d       :       array[0..5001,0..5001] of int64;
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
var     i,j       :longint;
begin
        readln(f,n,k);
        d[1,1]:=1;
        for j:=1 to k do
               begin
                for i:=j to n-1 do
                        begin
                                d[i+1,j]:=(d[i+1,j]+(d[i,j]*2*j)mod du)mod du;
                                d[i+1,j+1]:=(d[i+1,j+1]+(d[i,j]*(i+1-2*j))mod du)mod du;
                        end;
                end;
                writeln(g,d[n,k]);
end;
begin
        mo;
        doc;
        dong;
end.
