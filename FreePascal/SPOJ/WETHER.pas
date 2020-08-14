const   finp    =       '';
        fout    =       '';
type    ca      =       record
        x,y     :       byte;
        end;
var     g,f     :       text;
        kq,m     :       int64;
        n,dem       :       byte;
        a       :       array[1..100,1..100] of byte;
        dd      :       array[1..100] of byte;
        canh    :       array[1..5000] of ca;
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
var     i,j      :       longint;
begin
        readln(f,n);
        readln(f,m);
        for i:=1 to m do
                begin
                       with canh[i] do
                       begin
                        readln(f,x,y);
                        a[x,y]:=1;
                        a[y,x]:=1;
                        end

                end;
end;
procedure       DFS(u:byte);
var     i:longint;
begin
        dd[u]:=1;
        inc(dem);
        for i:=1 to n do
                if (a[i,u]=1) then
                if (dd[i]=0) then
                        dfs(i);

end;
procedure       xuly;
var     sl1,j       :       byte;
        i       :   longint;
begin
        for i:=1 to m do
                begin
                        a[canh[i].x,canh[i].y]:=0;
                        a[canh[i].y,canh[i].x]:=0;
                        sl1:=0;
                        dem:=0;
                        for j:=1 to n do dd[j]:=0;
                        for j:=1 to n do
                                if dd[j]=0 then
                                begin
                                        inc(sl1);
                                        if sl1>1 then
                                        begin
                                        kq:=kq+dem*(n-dem);
                                        break;
                                        end;
                                        DFS(j);
                                end;
                        a[canh[i].x,canh[i].y]:=1;
                        a[canh[i].y,canh[i].x]:=1;

                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


