{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+}
{$M 16384,0,655360}

uses crt;

const
   tfi                  =       'COMB.INP';
   tfo                  =       'COMB.OUT';

type
   Xaukt                =       string[52];

var
   fi,fo                :       text;
   K                    :       integer;
   x,y                  :       Xaukt;

function ThuTu(n: integer): char;
begin
   if n<=26 then ThuTu:=chr(64+n) else
      ThuTu:=chr(70+n);
end;

function Sau(c: char): char;
begin
   case c of
      'A'..'Y': Sau:=succ(c);
      'Z'     : Sau:='a';
      'a'..'y': Sau:=succ(c);
   end;
end;

function Truoc(c: char): char;
begin
   case c of
      'B'..'Z': Truoc:=Pred(c);
      'a'     : Truoc:='Z';
      'b'..'z': Truoc:=Pred(c);
   end;
end;
procedure SinhDL;
var ch: char;
    m,n,i,j: integer;
begin
   clrscr;
   writeln('Ban co tao file ',tfi,' (C/K)?');
   repeat ch:=readkey until upcase(ch) in ['C','K'];
   if upcase(ch)='K' then exit;
   randomize;
   assign(fi,tfi); rewrite(fi);
   m:=random(5)+5;
   while m>0 do
      begin
         k:=random(52)+1;
         n:=random(255)+1;
         x:='';
         for i:=1 to n do
            begin
               j:=random(52-k+i)+1;
               if j>52 then j:=52;
               ch:=ThuTu(j);
               x:=x+ch;
            end;
         writeln(fi,k,' ',x);
         dec(m);
      end;
   close(fi);
end;

procedure Docdl;
var s: string;
begin
   readln(fi,s);
   while s[1]=#32 do delete(s,1,1);
   k:=0;
   while s[1]<>#32 do
      begin
         k:=k*10+ord(s[1])-48;
         delete(s,1,1);
      end;
   while s[1]=#32 do delete(s,1,1);
   x:=copy(s,1,k);
end;


procedure TinhFloor;
var i,j: integer;
    c: char;
begin
  if length(x)>k then x:=copy(x,1,k);
  while length(x)<k do x:=x+'A';

  y:='NULL';
  i:=0;
  repeat
     inc(i);
     if x[i]<ThuTu(i) then exit;
  until (i=k) or (x[i]>=x[i+1]);
  if (i<k) and (x[i]=ThuTu(i)) then exit;

  y:=x;
  if i=k then exit;
  j:=i;
  repeat
     if y[j]>ThuTu(52-k+j) then y[j]:=ThuTu(52-k+j)
                           else y[j]:=Truoc(y[j]);
     dec(j);
  until y[j]<y[j+1];
  for j:=k downto i+1 do y[j]:=ThuTu(52-k+j);

end;
procedure Tinhceil;
var i,j: integer;
begin
   i:=0;
   repeat
      inc(i)
   until (i=k) or (x[i]>=x[i+1]);
   if x[i]>ThuTu(52-k+i) then
      begin
         y:='NULL';
         exit;
      end;
   y:=x;
   for j:=i+1 to k do y[j]:=Sau(y[j-1]);
end;

BEGIN
   {SinHDL;}
   assign(fi,tfi); reset(fi);
   assign(fo,tfo); rewrite(fo);
   while not seekeof(fi) do
      begin
         Docdl;
         TinhFloor;
         writeln(fo,y);
         TinhCeil;
         writeln(fo,y);
      end;
   close(fi); close(fo);
END.
