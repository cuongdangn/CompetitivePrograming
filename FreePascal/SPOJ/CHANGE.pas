uses    math;
const   finp    =       'CHANGE.INP';
        fout    =       'CHANGE.OUT';
var     g,f     :       text;
        d       :       array[1..1000] of longint;

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
var     t,i,j     :longint;
begin
        for i:=1 to 1000 do
         d[i]:=i;
        d[500]:=1;
        d[100]:=1;
        d[50]:=1;
        d[10]:=1;
        d[5]:=1;
        d[1]:=1;
        for i:=2 to 1000 do
         begin
          for j:=i-1 downto 1 do
           d[i]:=min(d[i],d[j]+d[i-j]);
         end;
         readln(f,t);
         for i:=1 to t do
          begin
          read(f,j);
          writeln(g,d[1000-j]);
          end;
end;
begin
        mo;
        doc;
        dong;
end.
