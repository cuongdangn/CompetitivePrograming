const   finp    =       '';
        fout    =       '';
var     g,f:    text;
        a       :       array[1..505,1..505] of byte;
        d       :       array[1..505,1..505] of boolean;
        ke      :       array[1..505] of longint;
        n       :       longint;
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
        readln(f,n);
        for i:=1 to n do
                begin
                        for j:=1 to n do read(f,a[i,j]);
                        readln(f);
                end;
end;
procedure       xuly;
var     i,j,l,sl,k   :       longint;
begin
        fillchar(d,sizeof(d),false);
        for i:=1 to n do ke[i]:=i mod n+1;
        for i:=1 to n do d[i,ke[i]]:=true;
        for l:=2 to n do
              for i:=1 to n do
                begin
                        j:=i+l;
                        if j>n then j:=j-n;
                        k:=ke[i];
                        while k<>i do
                                begin
                                   if d[i,k] and d[k,j] then
                                    if (a[i,k]=1)or(a[j,k]=1) then
                                        begin
                                              d[i,j]:=true;
                                              break;
                                        end;
                                    k:=ke[k];
                                end;
                end;

        sl:=0;
        for i:=1 to n do
         if d[i,i] then inc(sl);
         writeln(g,sl);
         for i:=1 to n do
          if d[i,i] then writeln(g,i);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

