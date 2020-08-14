const   finp    =       'HSTR.inp';
        fout    =       'HSTR.out';
        base    =       trunc(1e9)+7;
var     g,f     :       text;
        goc,k     :       longint;
        hash,lt :       array[0..3001] of longint;
        d       :       array[0..3000,0..3000] of longint;
        s1,s2   :       ansistring;
        n,kq       :       longint;
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
begin
        readln(f,k);
        readln(f,s1);
        readln(f,s2);
        n:=length(s1);
        lt[0]:=1;
        for i:=1 to n do lt[i]:=int64(lt[i-1])*26 mod base;
end;
procedure       init;
var     i,j     :       longint;
begin
        for i:=1 to  n do
         hash[i]:=(int64(hash[i-1])*26+ord(s1[i])-97) mod base;
        goc:=0;
        for i:=1 to n do
         goc:=(int64(goc)*26+ord(s2[i])-97) mod base;
end;
function        ktra(a,b,c:longint;i,j:longint):boolean;
var     tg1     :       longint;
begin
        tg1:=(int64(a)*int64(lt[i]) mod base +int64(b)*int64(lt[j]) mod base+c)mod base;
        exit(tg1=goc);
end;
function        tinh(i,j:longint):longint;
begin
        exit((hash[j]-int64(hash[i-1])*int64(lt[j-i+1]) mod base + base)mod base);
end;
function        thu(i,j:longint):boolean;
var     tg1,tg2,tg3     :       longint;
begin
        tg1:=tinh(1,i-1);
        tg2:=tinh(i,j);
        tg3:=tinh(j+1,n);
        if ktra(tg1,tg2,tg3,n-i+1,n-j) or ktra(tg1,tg3,tg2,n-i+1,j-i+1) or ktra(tg2,tg1,tg3,n+i-j-1,n-j) or ktra(tg2,tg3,tg1,n+i-j-1,i-1) or ktra(tg3,tg1,tg2,j,j-i+1) or ktra(tg3,tg2,tg1,j,i-1) then
        exit(true);
        exit(false);
end;
function        ktrasub1(s:ansistring):boolean;
var     i       :       longint;
begin
        for i:=1 to n do
         if abs(ord(s[i])-ord(s2[i]))>k then exit(false);
         exit(true);
end;
procedure       sub1;
var     i,j     :       longint;
        stg1,stg2,stg3: ansistring;
begin
        for i:=2 to n-1 do
         for j:=i to n-1 do
          begin
           stg1:=copy(s1,1,i-1);
           stg2:=copy(s1,i,j-i+1);
           stg3:=copy(s1,j+1,n-j);
           if ktrasub1(stg1+stg2+stg3)or ktrasub1(stg1+stg3+stg2)or ktrasub1(stg2+stg3+stg1)or ktrasub1(stg2+stg1+stg3) or ktrasub1(stg3+stg2+stg1)or ktrasub1(stg3+stg1+stg2) then inc(kq);
          end;
          writeln(g,kq);
end;
procedure       sub2;
var     i,j     :       longint;
begin
        init;
        for i:=2 to n-1 do
         for j:=i to n-1 do
           if thu(i,j) then inc(kq);
         writeln(g,kq);
end;
procedure       sub3;
var     i,j,l1,l2,l3     :       longint;
begin
        for i:=1 to n do
         for j:=1 to n do
          if abs(ord(s1[i])-ord(s2[j]))<=k then d[i,j]:=d[i-1,j-1]+1
          else d[i,j]:=0;
        //////////////////////;
        for i:=2 to n-1 do
         for j:=i to n-1 do
          begin
           l1:=i-1;
           l2:=j-i+1;
           l3:=n-j;
           if ((d[i-1,l1]>=l1) and (d[j,l1+l2]>=l2) and (d[n,l1+l2+l3]>=l3))or
              ((d[i-1,l1]>=l1) and (d[n,l1+l3]>=l3) and (d[j,l1+l2+l3]>=l2))or
              ((d[j,l2]>=l2) and (d[i-1,l2+l1]>=l1) and (d[n,l1+l2+l3]>=l3))or
              ((d[j,l2]>=l2) and (d[n,l2+l3]>=l3) and (d[i-1,l1+l2+l3]>=l1))or
              ((d[n,l3]>=l3) and (d[j,l2+l3]>=l2) and (d[i-1,l1+l2+l3]>=l1))or
              ((d[n,l3]>=l3) and (d[i-1,l3+l1]>=l1) and (d[j,l1+l2+l3]>=l2))  then
               inc(kq);
           end;
           writeln(g,kq);
end;
begin
        mo;
        doc;
        if n<=100 then sub1
        else if k=0 then sub2
        else sub3;
        dong;
end.
