uses    math;
const   finp    =       '';
        fout    =       '';
        vc      =       100000000;
var     g,f     :       text;
        n,m,kq     :       longint;
        a       :       array[0..129,0..129] of char;
        d       :       array[0..1,0..129,0..129] of longint;
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
var     i,j    :       longint;
        s:      string;
begin
        readln(f,m,n);
        for i:=1 to n do
                begin
                         readln(f,s);
                        for j:=1 to m do a[i,j]:=s[j];
                end;
end;
Function Maxx(A,B,C,D,E:longint):longint;
begin
        Maxx:=Max(A,Max(B,Max(C,Max(D,E))))
end;
procedure       timmin;
var     i,j,k,t1,t2     :       longint;
        x1,x2,y1,y2:      longint;
begin
         for x1:=0 to n do
                        for x2:=0 to n do
                         d[0,x1,x2]:=-vc;
        i:=1;
        if a[1,1]='*' then d[0,1,1]:=1 else d[0,1,1]:=0;
        for k:=3 to m+n do
            begin
                for x1:=0 to n do
                        for x2:=0 to n do
                         d[i,x1,x2]:=-vc;
                for x1:=1 to n do
                        for x2:=1 to n do
                            if (x2<k)and(x2>k-m-1)and(x1<k)and(x1>k-m-1) then
                                begin
                                        d[i,x1,x2]:=maxx(d[i,x1,x2],d[1-i,x1,x2],d[1-i,x1-1,x2],d[1-i,x1,x2-1],d[1-i,x1-1,x2-1]);
                                        y1:=k-x1;
                                        y2:=k-x2;
                                        if (a[x1,y1]='#')or(a[x2,y2]='#') then d[i,x1,x2]:=-vc else
                                                begin
                                                        if a[x1,y1]='*' then t1:=1 else t1:=0;
                                                        if a[x2,y2]='*' then t2:=1 else t2:=0;
                                                        if x1=x2 then d[i,x1,x2]:=d[i,x1,x2]+t1
                                                        else d[i,x1,x2]:=d[i,x1,x2]+t1+t2;
                                                end;

                                end;
                        i:=1-i;
                end;
             kq:=d[1-i,n,n];
end;
procedure       xuly;
var     i,j,t     :       longint;
begin
        timmin;
        if kq>=0 then writeln(g,kq) else writeln(g,0);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
