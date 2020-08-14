const   finp    =       'DNC.INP';
        fout    =       '';
        maxn    =       2000;
var     g,f     :       text;
        n,m     :       longint;
        tong    :       int64;
        a       :       array[1..maxn,1..maxn] of byte;
        b       :       array[0..maxn,0..maxn] of int64;
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
        c       :       char;
begin
        readln(f,m,n);
        for i:=1 to m do
         begin
                for j:=1 to n do
                       begin read(f,c);a[i,j]:=ord(c)-48; end;
                readln(f);
         end;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to m do
         for j:=1 to n do
          begin
                b[i,j]:=i*j+b[i-1,j]+b[i,j-1]-b[i-1,j-1];
                tong:=tong+b[i,j];
          end;
end;
function        tinh(t:longint):int64;
var     h,l       :       array[0..maxn] of longint;
        d,ton     :       array[0..maxn] of int64;
        i,j,k       :       longint;
        luu     :       int64;
begin
        luu:=0;
        for i:=0 to n do
         begin
                h[i]:=0;ton[i]:=0;
                l[i]:=0;d[i]:=0;
         end;
        ////
        for i:=1 to m do
         begin
          for j:=1 to n do
           if a[i,j]=t then h[j]:=h[j]+1 else h[j]:=0;
          h[0]:=-maxn-1;
          /////////////////////////////////
          for j:=1 to n do
           begin
            k:=j-1;
            while h[k]>=h[j] do k:=l[k];
            l[j]:=k;
           end;
          ///////////////////////////////
          for j:=1 to n do
            begin
             d[j]:=b[h[j],j-l[j]]+d[l[j]]+ton[l[j]]*(j-l[j]);
             luu:=luu+d[j];
             ton[j]:=ton[l[j]]+int64(j-l[j])*int64((h[j]+1)*h[j] div 2);
            end;
          end;
          exit(luu);
end;
procedure       xuly;
var     i,j     :       longint;
        tg,kq      :       int64;
begin
        init;
        tg:=tinh(1);
        tg:=tg+tinh(0);
        kq:=tong-tg;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
