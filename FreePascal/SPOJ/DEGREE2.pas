const   finp    =       '';
        fout    =       '';
        di      :       array [2..9] of byte=(29,18,14,12,11,10,9,9);
var     g,f     :       text;
        sl,x,y,k,b :       int64;
        d       :       array[0..30,0..30,false..true] of longint;
        lt      :       array[0..30] of int64;
        bit     :       array[0..30] of byte;
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
begin
         readln(f,x,y,k,b);
         lt[0]:=1;
         sl:=di[b];
         for i:=1 to sl do lt[i]:=lt[i-1]*b;
end;
function        tinh(j,k1:longint;nho:boolean):longint;
var     i,dem:longint;
begin
 if j=-1 then exit(ord(k1=k));
 if d[j,k1,nho]<>-1 then exit(d[j,k1,nho]);
 dem:=0;
 for i:=0 to 1 do
  if (i<=bit[j])or(nho) then
        dem:=dem+tinh(j-1,k1+i,(bit[j]>i)or nho);
  d[j,k1,nho]:=dem;
  exit(dem);
end;
function       init(x:longint):longint;
var i,j :       longint;
begin
    fillchar(bit,sizeof(bit),0);
    for i:=sl downto 0 do
     if lt[i]<=x then
      begin
       bit[i]:=1;
       x:=x-lt[i];
      end;
      fillchar(d,sizeof(d),255);
      j:=tinh(sl,0,false);
      exit(j);
end;
procedure       xuly;
var     a,b:longint;
begin
        a:=init(x-1);
        b:=init(y);
        writeln(g,b-a);
end;

begin
        mo;
        doc;
         xuly;
        dong;
end.
