const   finp    =       'QRPATH2.INP';
        fout    =       'QRPATH2.OUT';
type    ca      =       record
        x,y,m   :       longint;
        end;
var     g,f     :       text;
        da,q,n      :       longint;
        st      :       array[1..100000] of longint;
        canh    :       array[1..100000] of ca;
        link,head:      array[1..100000] of longint;
        nhom    :       array[1..100000] of longint;
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
var     i       :longint;
begin
        readln(f,n,q);
        for i:=1 to n-1 do
                        with canh[i] do
                                readln(f,x,y,m);
        for i:=n-1 downto 1 do
                begin
                        link[i]:=head[x];
                        head[x]:=i;
                end;
end;
procedure       push(u:longint);
begin
        inc(dau);
        st[dau]:=u;
end;
procedure       DFS(u:longint);
var     i,v,mau       :longint;
begin
        i:=head[u];
        push(u);
        while i>0 do
                begin
                        v:=canh[i].y;
                        DFS(v);
                end;
        if nhom[u]=0 then
                begin
