uses    math;
const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        cc,tt   :       array[1..1501,1..1501] of longint;
        d       :       array[0..1501,0..1501] of longint;
        dc     :       array[1..1501] of longint;
        n,m     :       longint;
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
var     i,j     :longint;
        ch      :       char;
begin
       readln(f,n,m);
        for i:=1 to n do
            begin
                for j:=1 to m do
                    begin
                        read(f,ch);
                        if ch='A' then read(f,tt[i,j])
                        else read(f,cc[i,j]);
                        if not eoln(f) then read(f,ch);
                    end;
                readln(f);
            end;
end;
procedure       init;
var     i,j,t     :       longint;
begin
      for i:=1 to m do dc[i]:=cc[1,i];
      for i:=2 to n do
       begin
         t:=tt[i,1];
         d[i,1]:=0;
         for j:=2 to m do
          begin
           d[i,j]:=max(max(d[i,j-1]+dc[j],d[i-1,j]+t),d[i-1,j-1]+dc[j]+t);
           t:=t+tt[i,j];
           dc[j]:=dc[j]+cc[i,j];
          end;
       end;
       writeln(g,d[n,m]);
end;
begin
        mo;
        doc;
        init;
        dong;
end.
