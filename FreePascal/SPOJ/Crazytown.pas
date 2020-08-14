var     u,v,x,y,a,b,c:int64;
	n,i,ans:longint;
begin
 	 readln(u,v);
  	readln(x,y);
 	 readln(n);
 	 for i:=1 to n do
  	begin
    		readln(a,b,c);
    		if ((a*u+b*v+c>0) and (a*x+b*y+c<0)) or ((a*u+b*v+c<0) and (a*x+b*y+c>0)) then inc(ans);
 	 end;
  	writeln(ans);
end.
