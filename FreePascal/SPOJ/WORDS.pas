const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var     g,f     :       text;
        d       :       array[1..65536,1..16] of longint;
        dau,cuoi     :       array[1..16] of char;
        cao     :    array[1..16] of longint;
        n:longint;
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
var     i       :       longint;
        s       :       string;
begin
        readln(f,n);
        for i:=1 to n do
        begin
                readln(f,s);
                dau[i]:=s[1];
                cuoi[i]:=s[length(s)];
                cao[i]:=length(s);
        end;
end;
function        max(a,b:longint):longint;
begin
        if a>b then exit(a);
        exit(b);
end;
procedure       QHD;
var   i,j,k,max1,x:longint;
begin
         max1:=-maxlongint;
         for i:=1 to (1 shl n) -1 do
          for j:=1 to n do d[i,j]:=-maxlongint;
         d[1,1]:=cao[1];
         for i:=1 to n-1 do
                d[1 shl i,i+1]:=cao[i+1];
         for i:=1 to (1 shl n)-1 do
                for j:=1 to n do
                        if d[i,j]>=0 then
                         for k:=1 to n do
                                if (k<>j) and ( cuoi[j]=dau[k] )then
                                        begin
                                                x:= i or (1 shl(k-1));
                                                if (i shr (k-1) and 1=0) then
                                                d[x,k]:=max(d[x,k],cao[k]+d[i,j]);
                                                max1:=max(max1,d[x,k]);
                                        end;
                         writeln(g,max1);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.
