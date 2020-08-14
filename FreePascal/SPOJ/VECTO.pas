const
   tfi='';
   tfo='';
var
   // sau 1 l?n b? sigkill dƒm ra ti?t ki?m b? nh? h?t c? :D
   a,b,x:array[0..31] of shortint;
   f,g:array[0..1 shl 15] of integer;
   t:array[-1500..1500,-1500..1500] of integer;
   n,res,p,kl,gt,x1,y:longint;

procedure inp;
var
   i:longint;
begin
   read(n);
   for i:=1 to n do
      read(a[i],b[i]);
   read(x1,y);
end;


procedure nap1;
begin
   inc(t[kl,gt]);
end;

procedure thu1(k:longint);
var
   i:longint;
begin
   if k>n div 2 then
   begin
      nap1;
      exit;
   end;
   for i:=0 to 1 do
   begin
      x[k]:=i;
      kl:=kl+a[k]*i;
      gt:=gt+b[k]*i;
      thu1(k+1);
      gt:=gt-b[k]*i;
      kl:=kl-a[k]*i;
   end;
end;

procedure nap2;  //dua vector (kl,gt) t? h?p du?c v…o m?ng (g,f)
begin
   inc(p);
   f[p]:=gt; g[p]:=kl;
end;

procedure thu2(k:longint);
var
   i:longint;
begin
   if k>n then
   begin
      nap2;
      exit;
   end;
   for i:=0 to 1 do
   begin
      x[k]:=i;
      kl:=kl+a[k]*i;
      gt:=gt+b[k]*i;
      thu2(k+1);
      gt:=gt-b[k]*i;
      kl:=kl-a[k]*i;
   end;
end;

procedure process;
var
   i,j:longint;
begin
   kl:=0; gt:=0;  //(kl,gt) l… vector s? t? h?p
   thu1(1);
   p:=0;          //s? vector t?o ra t? t?p 2
   kl:=0; gt:=0;
   thu2(n div 2+1);
   for i:=1 to p do
      if (abs(x1-g[i])<=1500) and (abs(y-f[i])<=1500) then
         inc(res,t[x1-g[i],y-f[i]]);
end;

procedure out;
begin
   writeln(res);
end;

procedure main;
begin
   assign(input,tfi); reset(input);
   assign(output,tfo); rewrite(output);
   inp;
   process;
   out;
   close(input); close(output);
end;

BEGIN
   main;
END.
