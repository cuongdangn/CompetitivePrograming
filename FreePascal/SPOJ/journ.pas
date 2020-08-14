const fi 	=  	'Journ5.inp';
      fo	=	'Journ.out';
      maxn	=	1005;
var   f,g	: 	text;
      xp,kt	: 	longint;
      n,k	: 	longint;
      gr	: 	array[0..maxn,0..maxn] of longint;
      da,tr,kcd,trd,qu,x: array[0..maxn] of longint;
      d,delta,qn,sl: longint;
procedure 	doc;
var 	i,j,u,v,l	: longint;
begin
 	assign(f,fi); reset(f);
 	readln(f,xp,kt);
	 readln(f,n,k);
 	for i:=1 to n do
 	 for j:=1 to n do gr[i,j]:=-1;
	 for i:=1 to k do
 	 begin
 	  readln(f,u,v,l);
  	 gr[u,v]:=l;
  	end;
 	close(f);
end;
procedure       khoitao;
begin
        qn:=0;
end;
procedure       put(u: longint);
begin
         inc(qn);
         qu[qn]:=u;
end;
function        Get: longint;
var u,i: longint;
begin
        u:=1;
        for i:=1 to qn do
        if kcd[qu[i]]<kcd[qu[u]] then u:=i;
        Get:=qu[u];
        qu[u]:=qu[qn];
        dec(qn);
end;
function        qempty: boolean;
begin
 qempty:=(qn=0);
end;
procedure       dij;
var i,u,v: longint;
begin
 khoitao;
 fillchar(trd,sizeof(trd),0);
 for i:=1 to n do
  if tr[i]>0 then
   begin
    put(i);
    trd[i]:=-(n+1);
    kcd[i]:=0;
   end;
 repeat
  u:=Get; trd[u]:=-trd[u];
  if odd(d) then
   begin
    for v:=1 to n do
     if (gr[u,v]<>-1) and (kcd[u]+gr[u,v]<=12) then
      begin
       if (trd[v]<0) and (kcd[v]>kcd[u]+gr[u,v]) then
        begin
         kcd[v]:=kcd[u]+gr[u,v];
         trd[v]:=-u;
        end;
       if (trd[v]=0) and (tr[v]=0) then
        begin
         put(v);
         trd[v]:=-u;
         kcd[v]:=kcd[u]+gr[u,v];
        end;
      end;
   end
  else
   begin
    for v:=1 to n do
     if (gr[v,u]<>-1) and (kcd[u]+gr[v,u]<=12) then
      begin
       if (trd[v]<0) and (kcd[v]>kcd[u]+gr[v,u]) then
        begin
         kcd[v]:=kcd[u]+gr[v,u];
         trd[v]:=-u;
        end;
       if (trd[v]=0) and (tr[v]=0) then
         begin
          put(v);
          trd[v]:=-u;
          kcd[v]:=kcd[u]+gr[v,u];
         end;
      end;
   end;
 until qempty;
 if trd[kt]>0 then delta:=kcd[kt];
end;

procedure       Timnguoc;
var i,u: longint;
begin
 for i:=1 to n do
  if (tr[i]=0) and (trd[i]>0) then
   begin
    u:=i;
    repeat
     tr[u]:=trd[u];
     da[u]:=d;
     u:=trd[u];
    until tr[u]>0;
   end;
end;

procedure       xuly;
var i: longint;
begin
 fillchar(tr,sizeof(tr),0);
 fillchar(da,sizeof(da),0);
 d:=0; da[xp]:=1;
 tr[xp]:=n+1;
 repeat
   d:=d+1;
   dij;
   Timnguoc;
 until tr[kt]>0;
end;

procedure       find;
var     v: longint;
begin
 v:=kt;
 sl:=0;
 repeat
   inc(sl);
   x[sl]:=v;
   v:=tr[v];
 until v=n+1;
end;

procedure xuat;
var     i,u,v   : longint;
begin
 assign(g,fo);
 rewrite(g);
 for i:=sl downto 2 do
  begin
   u:=x[i]; v:=x[i-1];
   if odd(da[v]) then writeln(g,u,' ',v,' ',da[v],' ',gr[u,v])
        else writeln(g,u,' ',v,' ',da[v],' ',gr[v,u]);
  end;
 close(g);
end;

begin
        doc;
        xuly;
        find;
        xuat;
end.
