const   finp    =       'NUOC.INP';
        fout    =       'NUOC.OUT';
var     g,f     :       text;
        a       :       array[1..101,1..101] of longint;
        n,min,tp       :       longint;
        dd      :       array[1..100] of byte;
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
var     i,b,c :longint;
begin
        readln(f,n);
        while not seekeof(f) do
         begin
                readln(f,i,b,c);
                a[i,b]:=c;
                a[b,i]:=c;
         end;
end;
procedure       xuly;
var     i,j,t:longint;
begin
        for i:=1 to n do
         for j:=1 to n do if (i<>j)and(a[i,j]=0) then
                begin
                dd[i]:=1;
                dd[j]:=1;
                end;

        for i:=1 to n do
         if dd[i]=0 then
         begin
                t:=0;
                for j:=1 to n do
                if i<>j then t:=t+a[i,j];
                if t<min then
                        begin
                                min:=t;
                                tp:=i;
                        end;
         end;
end;
begin
        mo;  fillchar(a,sizeof(a),0);
        doc; min:=1000000000;
        fillchar(dd,sizeof(dd),0);
        xuly;
        writeln(g,tp);
        writeln(g,min);
        dong;
end.

