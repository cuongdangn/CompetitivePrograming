const   finp    =       '';
        fout    =       '';
var     a:ansistring;
        h,s,l:array[-1..1000]of integer;
        DP :array[-1..1000]of longint;
        i,j,m,n     :       integer;
        max :       int64;
        g,f     :       text;
procedure      mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure      dong;
begin
        close(f);
        close(g);
end;
procedure      doc;
var    i,j,top,k  :       integer;
begin
        readln(f,m,n);
        for i:=1 to m do
         begin
         readln(f,a);
         for j:=1 to n do if a[j]='0' then h[j]:=0 else inc(h[j]);
         for j:=1 to n do
         begin
                l[j]:=j; h[0]:=0;k:=j-1;
                while (k>0) and (h[j]<=h[k]) do
                begin
                        l[j]:=l[k];
                        k:=l[k]-1;
                end;
                dp[j]:=h[j]*(j-l[j]+1)+dp[l[j]-1];
                max:=max+dp[j];
         end;
        end;
        writeln(g,max);
end;
begin
        mo;
        doc;
        dong;
end.
