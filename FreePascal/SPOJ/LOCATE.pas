uses    math;
const   finp    =       'LOCATE.INP';
        fout    =       'LOCATE.OUT';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n1,n2,kq,l,c   :       longint;
        a,b     :       array[1..5010] of bg;
        dd      :       array[-500..500,-500..500] of longint;
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
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to n1 do
         for j:=1 to n2 do
           inc(dd[a[i].x-b[j].x,a[i].y-b[j].y]);
         kq:=0;
        for i:=-l to l do
         for j:=-c to c do
          kq:=max(kq,dd[i,j]);
         writeln(g,kq);
end;
procedure       doc;
var     t,i,j     :       longint;
begin
        readln(f,l,c);
        for i:=-l to l do
         for j:=-c to c do
          dd[i,j]:=0;
         n1:=0;
         n2:=0;
        for i:=1 to l do
         for j:=1 to c do
          begin
           read(f,t);
           if t=1 then
            begin
             inc(n1);
             a[n1].x:=i;
             a[n1].y:=j;
            end;
           end;
         ////
         for i:=1 to l do
         for j:=1 to c do
          begin
           read(f,t);
           if t=1 then
            begin
             inc(n2);
             b[n2].x:=i;
             b[n2].y:=j;
            end;
           end;
         /////
         xuly;
end;
procedure       doc1;
var     i,t     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         doc;
end;
begin
        mo;
        doc1;
        dong;
end.
