var     a,b,b1     :       array[1..100,1..100] of byte;
        n,m     :       longint;i,j,k       :       longint;
begin
        readln(m,n);
        for i:=1 to m do
         for j:=1 to n do read(b[i,j]);
        fillchar(a,sizeof(a),1);
        for i:=1 to m do
         for j:=1 to n do
          if b[i,j]=0 then
           begin
            for k:=1 to n do
              a[i,k]:=0;
            for k:=1 to m do
             a[k,j]:=0;
           end;
        ////
        for i:=1 to m do
         for j:=1 to n do
          begin
           b1[i,j]:=a[i,1];
           for k:=2 to n do
            b1[i,j]:=b1[i,j] or a[i,k];
           for k:=1 to m do
            b1[i,j]:=b1[i,j] or a[k,j];
           end;
         ///////////
         for i:=1 to m do
          for j:=1 to n do
           if b[i,j]<>b1[i,j] then
            begin
             writeln('NO') ; halt;
            end;
          writeln('YES');
          for i:=1 to m do
           begin
            for j:=1 to n do write(a[i,j],' ');
            writeln;
           end;
end.