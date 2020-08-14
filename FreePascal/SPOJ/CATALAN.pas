const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :       array[1..50] of longint;
        k      :       int64;
        n      :       byte;
        d      :array[1..20,1..20] of int64;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to 2*n+1 do read(f,a[i]);
        read(f,k);
end;
procedure       int;
var     i,j     :       longint;
begin
        d[n+1,n+1]:=0;
        d[n+1,n]:=1;
        d[n,n]:=1;
        for j:=n-1 downto 1 do
                for i:=n+1 downto 1 do
                        if i<j then break else
                                d[i,j]:=d[i,j+1]+d[i+1,j];
end;
procedure       xuly;
var     s,t:int64;
        u,v,i     :       byte;
begin
        s:=0;u:=1;v:=1;
        for i:=1 to 2*n do
                if a[i]<a[i+1] then
                begin
                s:=s+d[u,v+1];
                inc(u);
                end
                else inc(v);
        writeln(g,s+1);write(g,0,' ',1);
         s:=k;u:=2;v:=1;t:=1;
        for i:=2 to 2*n-1 do
                if s-d[u,v+1]>=1  then
                begin
                s:=s-d[u,v+1];inc(t);
                write(g,' ',t);
                inc(u);
                end
                else
                begin
                inc(v);
                dec(t);
                write(g,' ',t);
                end;
                write(g,' ',0);
end;
begin
        mo;
        doc;
        int;
        xuly;
        dong;
end.


