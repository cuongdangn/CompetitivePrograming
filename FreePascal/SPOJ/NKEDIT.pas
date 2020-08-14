const
        fi='';
        fo='';
var f:array[0..500,0..500] of longint;
    s,p:ansistring;
    k,sb:longint;


procedure doc;
var f:text;
begin
        assign(f,fi);reset(f);
        readln(f,k);
        readln(f,s);
        readln(f,p);
        close(f);
end;
procedure timxoa(var tam,io,jo:longint);
var i,j:longint;
begin
        tam:=0;fillchar(f,sizeof(f),0);
        for i:=1 to length(s) do
                for j:=1 to length(p) do
                        begin
                        if s[i]=p[j] then f[i,j]:=f[i-1,j-1]+1
                        else f[i,j]:=0;
                        if f[i,j]>tam then
                                begin
                                io:=i;
                                jo:=j;
                                tam:=f[i,j];
                                end;
                        end;
        end;
procedure xuli;
var i,j,tam,io,jo:longint;
begin
        sb:=0;
        timxoa(tam,io,jo);
        while (tam>=k) and (tam>0) do
                begin
                inc(sb);

                delete(s,io-tam+1,tam);
                delete(p,jo-tam+1,tam);
                timxoa(tam,io,jo);

                end;
end;
procedure ghi;
var f:text;
begin
        assign(f,fo);rewrite(f);
        writeln(f,sb);
        writeln(f,s);
        writeln(f,p);      close(f);
end;
begin
doc;
xuli;
ghi;
end.
