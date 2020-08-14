const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite|(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        j:=0;
        j1:=0;
        for i:=1 to 2*n do
         if d[i]=1 then
          begin
           truoc1[i]:=j;
           if j=0 then tiep[1]:=i
           else next1[j]:=i;
           j:=i;
          end
        else
          begin
           truoc1[i]:=j1;
           if j1=0 then tiep[0]:=i
           else next1[j1]:=i;
           j1:=i;
          end
        j:=0;
        j1:=0;
        for i:=1 to 2*n do
          if d[i]=1 then
           begin
             truoc2[i]:=j1;
             if j<>0 then next2[j]:=i;
             j1:=i;
           end
          else
           begin
             truoc2[i]:=j;
             if j1<>0 then next2[j1]:=



procedure       doc;
var     i,t     :       longint;
begin
        read(f,t);
        for i:=1 to t do
         begin
           read(f,n);

           for j:=1 to 2*n do d]j]:=0;
           for j:=1 to n do
            begin
             read(f,t);
             d[t]:=1;
            end;

           xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.