const
   tfi='gems.inp';
   tfo='gems.out';
   maxN=251;
   COSO=100000000;
   LEN=8;

type
   sn=record
         num: integer;
         d: array[0..20] of longint;
      end;

var
   fi, fo: text;
   N: longint;
   f: array[1..maxN,1..2*maxN] of sn;
   x: sn;
   kq: array[0..maxN] of longint;

procedure Gan(var u: sn; k: longint);
begin
   u.num:=0;
   u.d[0]:=k;
end;

procedure Cong(var u,v,w: sn);
var i, tong, nho: longint;
begin
   w.num:=u.num;
   if v.num>w.num then w.num:=v.num;
   for i:=u.num+1 to w.num do u.d[i]:=0;
   for i:=v.num+1 to w.num do v.d[i]:=0;
   nho:=0;
   for i:=0 to w.num do
      begin
         tong:=nho+u.d[i]+v.d[i];
         w.d[i]:=tong mod COSO;
         nho:=tong div COSO;
      end;
   while nho>0 do
      begin
         inc(w.num);
         w.d[w.num]:=nho mod COSO;
         nho:=nho div COSO;
      end;
end;

procedure Tru(var u,v,w: sn);
var i, nho, hieu: longint;
begin
   w.num:=u.num;
   for i:=v.num+1 to w.num do v.d[i]:=0;
   nho:=0;
   for i:=0 to w.num do
      begin
         hieu:=u.d[i]-v.d[i]-nho;
         if hieu<0 then
            begin
               hieu:=hieu+COSO;
               nho:=1;
            end
         else nho:=0;
         w.d[i]:=hieu;
      end;
   while (w.num>0) and (w.d[w.num]=0) do dec(w.num);
end;

procedure Viet;
var i: longint;
begin
   for i:=1 to N do write(fo,kq[i],#32);
end;

function LonHon(var u,v: sn): boolean;
var i: longint;
begin
   if u.num>v.num then exit(true);
   if u.num<v.num then exit(false);
   i:=u.num;
   while (i>=0) and (u.d[i]=v.d[i]) do dec(i);
   if (i>=0) and (u.d[i]>v.d[i]) then exit(true);
   exit(false);
end;


procedure Init;
var p, i: longint;
begin
   fillchar(f,sizeof(f),0);
   for p:=n to 2*n do Gan(f[n,p],1);

      for i:=n-1 downto 1 do
      begin
         Cong(f[i+1,2*i+1],f[i+1,2*(i+1)],f[i,2*i]);
         for p:=2*i-1 downto i do
            {f[i,p]:=f[i,p+1]+f[i+1,p+1];}
            Cong(f[i,p+1],f[i+1,p+1],f[i,p]);
      end;
end;

procedure Docso(var u: sn);
var s: string;
    i: longint;
    code: integer;
begin
   readln(fi,s);
   while s[1]=#32 do delete(s,1,1);
   while s[length(s)]=#32 do delete(s,length(s),1);
   while length(s) mod LEN >0 do s:='0'+s;
   with u do
      begin
         num:=length(s) div LEN-1;
         for i:=0 to num do
            begin
               val(copy(s,length(s)-LEN+1,LEN),d[i],code);
               delete(s,length(s)-LEN+1,LEN);
            end;
      end;
end;

procedure TimChuoi;
var i,j: longint;
    x1: sn;
begin
   kq[0]:=0;
   for i:=1 to N do
      begin
         j:=kq[i-1]+1;
         while LonHon(x,f[i,j]) do
            begin
               move(x,x1,sizeof(x));
               Tru(x1,f[i,j],x);
               inc(j);
            end;
         kq[i]:=j;
      end;
end;

procedure Main;
begin
   assign(fi,tfi); reset(fi);
   assign(fo,tfo); rewrite(fo);
   readln(fi,N);
   Init;
   Docso(x);
   TimChuoi;
   Viet;
   close(fi); close(fo);
end;

BEGIN
   Main;
END.
