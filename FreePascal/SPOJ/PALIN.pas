uses    math;
const   finp    =       'PALIN.INP';
        fout    =       'PALIN.OUT';
var     g,f     :       text;
        a       :       array['0'..'z','0'..'z'] of byte;
        d,dd       :       array['0'..'z'] of longint;
        s       :       ansistring;
        n       :longint;
        kq,max1,t      :       int64;
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
var     c:char;
begin
        s:='';
        while not seekeof(f) do
                begin
                        read(f,c);
                        inc(d[c]);
                        s:=s+c;
                end;
end;
procedure       taodothi;
var     i:longint;
begin
        n:=length(s);
        for i:=1 to length(s) div 2 do
                begin
                        if s[i]<>s[n] then
                         begin
                                a[s[i],s[n]]:=1;
                                a[s[n],s[i]]:=1;
                         end;
                         dec(n);
                end;
end;
procedure       DFS(u:char);
var     c:char;
begin
        dd[u]:=1;
        t:=t+d[u];
         max1:=max(max1,d[u]);
        for c:='0' to 'z' do
        if dd[c]=0 then
         if a[u,c]=1 then
              DFS(c);
end;
procedure       xuly;
var     c:char;
begin
        for c:='0' to '9' do
         if dd[c]=0 then
                begin
                        t:=0;
                        max1:=0;
                        DFS(c);
                        kq:=kq+t-max1;
                end;
        for c:='A' to 'Z' do
         if dd[c]=0 then
                begin
                        t:=0;
                        max1:=0;
                        DFS(c);
                        kq:=kq+t-max1;
                end;
         for c:='a' to 'z' do
         if dd[c]=0 then
                begin
                        t:=0;
                        max1:=0;
                        DFS(c);
                        kq:=kq+t-max1;
                end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        taodothi;
        xuly;
        dong;
end.