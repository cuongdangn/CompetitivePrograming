const   finp    =       'D:\HocTap\FPC\bin\Daythem\ktong\test\test20\ktong.inp';
        fout    =       'D:\HocTap\FPC\bin\Daythem\ktong\test\test20\ktong.out';
var     g,f     :       text;
        n,k     :       longint;
        a       :       array[1..100000] of longint;
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
        readln(f,n,k);
        for i:=1 to n do read(f,a[i]);
end;
procedure       sub2;
var     i,j,k1,s   :       longint;
begin
        for i:=1 to n do
         for j:=i to n do
          begin
           s:=0;
            for k1:=i to j do s:=s+a[k1];
            if s=k then
             begin
                writeln(g,'YES');
                exit;
             end;
           end;
           writeln(g,'NO');
end;


procedure       sub3;
var     i,j,s     :       longint;
begin
        i:=1;
        j:=1;
        s:=0;
        while(i<=n)and(j<=n) do
        begin
         while (s<k)and(j<=n) do
                begin
                        s:=s+a[j];
                        j:=j+1;
                end;
         if s=k then
                begin
                        writeln(g,'YES');
                        exit;
                end;
         while  (s>k)and(i<=n) do
                begin
                        s:=s-a[i];
                        i:=i+1;
                end;
         if s=k then
                begin
                        writeln(g,'YES');
                        exit;
                end;
         end;
         writeln(g,'NO');
end;
begin
        mo;
        doc;
        //sub2;
        sub3;
        dong;
end.
