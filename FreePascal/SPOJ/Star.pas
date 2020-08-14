const   finp    =       'Star.INP';
        fout    =       'Star.OUT';
var     g,f     :       text;
        n       :longint;
        c       :       int64;
        ok      :       boolean;
        x,d       :       array[1..21] of longint;
        dd      :       array[0..1048577] of longint;
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
var     i:longint;
        t       :       int64;
begin
        readln(f,n);
        t:=0;
        for i:=1 to n do
        begin
                read(f,d[i]);
                t:=t+d[i];
        end;
        readln(f);
        c:=t div 5;

end;
procedure       xuat;
var     i       :       longint;
begin
        for i:=1 to n do write(g,x[i]);
        writeln(g);
        ok:=true;
end;
procedure       duyet(i:longint;s:int64);
var     k,t:longint;
begin
        if i= 1 shl n-1 then  xuat;
        if dd[i]=1 then exit;
        for k:=1 to n do
         if ((i shr (k-1))and 1=0)and(s mod c+d[k]<=c) then
         begin
            t:=i or (1 shl (k-1));
            x[k]:=(s+d[k]) div c+ord((s+d[k]) mod c<>0);
            duyet(t,s+d[k]);
            if ok then exit;
         end;
         if ok then exit else dd[i]:=1;
end;
procedure       xuly;
var     i,t     :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
                doc;
                fillchar(dd,sizeof(dd),0);
                ok:=false;
                duyet(0,0);
         end;
end;
begin
        mo;
        xuly;
        dong;
end.
