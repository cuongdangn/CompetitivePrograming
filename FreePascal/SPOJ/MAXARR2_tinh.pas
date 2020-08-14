const   finp    =       'DNC.INP';
        fout    =       '';
var     g,f     :       text;
        kq      :       int64;
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
function        tinh(x:int64):int64;
begin
        if x=0 then exit(0);
        if x=1 then exit(1);
        if x mod 2=0 then exit(tinh(x div 2))
        else  exit(tinh(x div 2)+tinh(x div 2+1));
end;

procedure       doc;
var     i,t     :       longint;
        j       :       int64;
begin
        readln(f,t);
        for i:=1 to t do
         begin
          readln(f,j);
          //if j=0 then begin writeln(g,0);continue; end;
          //if j mod 2=0 then j:=j-1;
          kq:=tinh(j);
          writeln(g,kq);
         end;
end;
begin
        mo;
        doc;
        dong;
end.

