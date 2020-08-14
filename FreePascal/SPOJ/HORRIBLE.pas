const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,c,t:longint;
        tr,ph   :       array[1..100010] of int64;

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
procedure       update1(i:longint;a,b:int64);
begin
 while i<=n do
  begin
   tr[i]:=tr[i]+a;
   ph[i]:=ph[i]+b;
   i:=i+i and(-i);
  end;
end;
procedure       update(l,r,x:int64);
begin
 update1(l,x,-x*(l-1));
 update1(r,-x,x*r);
end;
function        get(i:longint):int64;
var j,a,b:int64;
begin
 j:=i;
 a:=0;
 b:=0;
 while i>0 do
  begin
      a:=a+tr[i];
      b:=b+ph[i];
      i:=i-i and (-i);
  end;
  exit(j*a+b);
end;
procedure       xuly;
var i,lo:longint;
    l,r,x:int64;
begin
 readln(f,n,c);
 fillchar(tr,sizeof(tr),0); fillchar(ph,sizeof(ph),0);
 for i:=1 to c do
  begin
   read(f,lo);
    if lo=0 then
     begin
      readln(f,l,r,x);
      update(l,r,x);
     end
    else
     begin
      readln(f,l,r);
      writeln(g,get(r)-get(l-1));
     end;
  end;
end;
procedure       doc;
var i:longint;
begin
 readln(f,t);
 for i:=1 to t do xuly;
end;
begin
 mo;
 doc;
 dong;
end.
