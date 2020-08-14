const   finp    =       '';
        fout    =       '';
type    ar    =       array[1..6] of longint;
var     g,f     :       text;
        tw      :       array[1..100000] of ar;
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
function        ss(a,b:ar):boolean;
var     i       :       longint;
begin
        ss:=false;
        for I:=1 to 6 do
         if a[i]>b[i] then exit(true);
end;
procedure       doc;
var     i,j:longint;
begin
        readln(f,n);
        for i:=1 to n  do
         begin
                for j:=1 to 6 do read(f,tw[i,j]);
                readln(f);
         end;
end;
procedure       quay(k:longint);
var   a,b :       array[1..6] of longint;
        i,j,t     :       longint;
begin
      for i:=1 to 6 do
       a[i]:=tw[k,i];
       b:=a;
       for i:=1 to 5 do
        begin
            t:=b[6];
            for j:=2 to 6 do
             b[i]:=b[i-1];
             b[1]:=t;
             if ss(a,b) then a:=b;
        end;
       for i:=1 to 6 do
        tw[k,i]:=a[i];
end;
procedure       QS(l,h  :       longint);
vaR     i,j        :       longint;
        x,tg       :       ar;
begin
        i:=l;
        j:=h;
        x:=tw[(l+h) div 2];
        repeat
                while ss(tw[i],x) do inc(i);
                while ss(x,tw[j]) do dec(j);
                if i<=j then
                 begin
                        tg:=tw[i];
                        tw[i]:=tw[j];
                        tw[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>J;
        if i<h then QS(i,h);
        if j>l then qs(l,j);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        QS(1,n);
        for i:=1 to n do
         begin
          for j:=2 to 6 do
           if tw[i][j]<>tw[i-1][j] then break;
           if (j=6)and(tw[i][j]=tw[i-1][j]) then
            begin
                write(g,'');
                dong;
                halt;
            end;
         end;
         write(g,'l');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
begin
end.


