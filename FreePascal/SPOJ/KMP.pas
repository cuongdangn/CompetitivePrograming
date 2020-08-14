const   fi='DNC.inp';
        fo='DNC.out';
Var     a,b : ansistring;
        t   : array[0..1000000] of longint;
        m,n : longint;
        i,j : longint;
begin
      assign(input,fi);reset(input);
      assign(output,fo);rewrite(output);

        readln(a);
        m := length(a);
        readln(b);
        n := length(b);
        if(m<n) then exit;

        j:=0;
        t[1]:=0;
        for i:=2 to n do
          begin
           while((j>0)and(b[j+1]<>b[i])) do j:=t[j];
           if b[j+1]=b[i] then inc(j);
           t[i]:=j;
          end;

        j:=0;
        for i:=1 to m do
          begin
           while((j>0)and(b[j+1]<>a[i])) do j:=t[j];
           if b[j+1]=a[i] then inc(j);
           if j=n then
             begin
               write(i-n+1,#32);
               j:=t[n];
             end;
          end;
          close(input);
          close(output);
end.
