const   finp    =       'BARCODE.INP';
        fout    =       'BARCODE.OUT';
var     f,g     :       text;
        d       :       array[1..1000,0..1] of longint;
        a       :       array[1..1000,1..1000] of char;
        x,y,n,m     :       integer;

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
var     i,j     :       longint;
begin
        readln(f,n,m,x,y);
        for i:=1 to n do
                begin

