const   finp    =       'FANCY.INP';
        fout    =       'FANCY.OUT';
var     g,f     :       text;
        n,k     :       longint;
        a       :       array[1..100000] of char;
        st      :       array[1..100000] of longint;
        sl      :       array[0..9] of longint;
procedure       mo;
begin
        assign(f,fionp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure      doc;
var     i      :longint;
begin
        readln(f,n,k);
        for i:=1 to n do
        begin
        read(f,a[i]);
        inc(ord(a[i])-48);
        end;
end;
procedure       xuly;
var     i,t       :longint;
begin
        for i:=0 to 9 do
                begin
                         while k>0 do
                                begin

