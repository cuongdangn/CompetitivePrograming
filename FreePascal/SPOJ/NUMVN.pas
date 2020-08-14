const   finp    =       'NUMVN.INP';
        fout    =       'NUMVN.OUT';
var     g,f     :       text;
        x,a,b   :       int64;
        n       :       longint;
        so      :       array[1..12] of byte;
        d       :       array[1..12,0..10000,false..true,false..true] of int64;
        dd      :       array[0..9] of byte;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       doc;
var     s       :       string;
        i       :       longint;
begin
        readln(f,x,a,b);
        readln(f,s);
        for i:=1 to length(s) do
         dd[ord(s[i])-48]:=1;
end;
procedure       dong;
begin
        close(f);
        close(g);
end;

procedure       init(a:int64);
var     cso     :       array[1..12] of longint;
        i       :       longint;
begin
        n:=0;
        while a>0 do
         begin
          inc(n);
          cso[n]:=a mod 10;
          a:= a div 10;
         end;
        ////;
        for i:=1 to n do
         so[i]:=cso[n-i+1];
end;

function        ktra(x:int64):boolean;
var     i       :       longint;
begin
        while x>0 do
         begin
          i:=x mod 10;
          if dd[i]=0 then exit(false);
          x:=x div 10;
         end;
         exit(true);
end;
procedure       sub2;
var     i       :      int64;
        dem     :      int64;
begin
        dem:=0;
        i:=a;
        while true do
         begin
          if i mod x=0 then break
          else i:=i+1;
         end;
        ////;
        while i<=b do
         begin
          if ktra(i) then inc(dem);
          i:=i+x;
         end;
         writeln(g,dem);
end;
function        tinh(i,du:longint;ok,ok1:boolean):int64;
var     dem     :       int64;
        cu,j      :       byte;
begin
        if i=n+1 then
         begin
          if (du=0)and(ok1) then exit(1)
          else exit(0);
         end;
         if d[i,du,ok,ok1]<>-1 then exit(d[i,du,ok,ok1]);
         dem:=0;
         if ok then cu:=9 else cu:=so[i];
         for j:=0 to cu do
          if dd[j]=1 then
           dem:=dem+tinh(i+1,(du*10+j) mod x,ok or(j<so[i]),ok1 or (j>0));
         d[i,du,ok,ok1]:=dem;
         exit(dem);
end;

procedure       sub1;
var     kq1      :       int64;
begin
        fillchar(d,sizeof(d),255);
        init(a-1);
        kq1:=tinh(1,0,false,false);
        fillchar(d,sizeof(d),255);
        init(b);
        kq1:=tinh(1,0,false,false)-kq1;
        writeln(g,kq1);
end;
procedure       xuly;
begin
        if x<=trunc(1e6) then sub1
         else sub2;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

