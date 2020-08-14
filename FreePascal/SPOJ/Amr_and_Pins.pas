var     r,x1,y1,x2,y2   :       int64;
	res		:	real;
begin
	readln(r,x1,y1,x2,y2);
	res:=sqrt(sqr(x1-x2)+sqr(y1-y2))/(2*r);
	if frac(res)>0 then
		writeln(trunc(res)+1)
	else
		writeln(trunc(res));
end.
