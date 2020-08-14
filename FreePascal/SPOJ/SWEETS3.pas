const   finp    =       'SWEET.INP';
        fout    =       'SWEET.OUT';
var     g,f     :       text;
        n       :       array[1..32] of byte;
        k,t,a,b,c     :       longint;
        a1       :       array[0..32] of byte;
        d       :       array[0..32,0..100] of int64;
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
procedure       chuyen(var j:longint);
var     i,i1,cs:longint;
begin
        i:=0;
         while j>0 do
          begin
               inc(i);
               a1[i]:=j mod 2;
               j:=j div 2;
          end;
          for i1:=1 to i do n[i1]:=a1[i-i1+1];
          k:=i;
end;
procedure       doc;
var     i,j       :       longint;
begin
        fillchar(d,sizeof(d),255);
       readln(f,j,a,b,c);
       chuyen(j);
end;
function       tinh(i,nho:longint):int64;
var     xi,yi,zi:byte;
        dem     :int64;
begin
        if i=0 then exit(ord(nho=0));
        if d[i,nho]<>-1 then exit(d[i,nho]);
        dem:=0;
        for xi:=0 to 1 do
         for yi:=0 to 1 do
          for zi:=0 to 1 do
           if (a*xi+b*yi+zi*c+nho)mod 2 = n[i] then
                dem:=dem+tinh(i-1,(a*xi+b*yi+c*zi+nho) div 2);
                d[i,nho]:=dem;
                exit(dem);
end;
procedure       xuly;
var     i,t       :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
                doc;
                writeln(g,tinh(k,0));
         end;
end;
begin
        mo;
        xuly;
        dong;
end.



