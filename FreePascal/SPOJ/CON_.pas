const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n       :       longint;
        d1,d2,d3,t:       int64;
        a,b     :       array[0..100001] of int64;
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
procedure       xuly1;
var     i       :       longint;
begin
        a[n]:=t-d2;
        a[1]:=t-d3;
        a[0]:=a[n];
        write(g,a[1]);
        for i:=2 to n-1 do
                a[i]:=b[i-1]-a[i-1]-a[i-2];
        for i:=2 to n do write(g,' ',a[i]);
end;
procedure       xuly2;
var     i       :       longint;
begin
        a[1]:=d2-t;
        a[n]:=d1-t;
        a[0]:=a[n];
        write(g,a[1]);
        for i:=2 to n-1 do
                a[i]:=b[i-1]-a[i-1]-a[i-2];
        for i:=2 to n do write(g,' ',a[i]);
end;

procedure       doc;
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        read(f,b[i]);
                        if i mod 3=0 then d3:=d3+b[i];
                        if i mod 3=1 then d1:=d1+b[i];
                        if i mod 3=2 then d2:=d2+b[i];
                end;
        t:=(d1+d2+d3)div 3;
        if n mod 3=1 then xuly1 else
        if n mod 3=2 then xuly2 else
        if n mod 3=0 then
                begin
                        a[1]:=0;
                        a[2]:=0;
                        a[n]:=b[1]-a[1]-a[2];
                        for i:=3 to n-1 do
                                a[i]:=b[i-1]-a[i-1]-a[i-2];
                        for i:=1 to n do write(g,a[i],' ');
                end;
end;
begin
        mo;
        doc;
        dong;
end.
