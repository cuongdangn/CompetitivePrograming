uses    math;var     a:array[1..50,1..50] of char;s       :       string;t,n,d,d1  :    integer;       i,j,sla,slb,slc       :    byte;
function        ss(a,b:char):boolean;var     m:integer;begin m:=abs(ord(a)-ord(b));
        if m=1 then if ord(a)>ord(b) then exit(false) else exit(true);
        if m=2 then if ord(a)>ord(b) then exit(false) else exit(true);  if m=3 then if ord(a)<ord(b) then exit(false) else exit(true);
end;function tinh(a,b:char):integer;begin if ss(a,b) then exit(2);if a=b then exit(1);exit(0);
end;begin readln(t);readln(s);readln(n);for i:=1 to n do  begin
for j:=1 to t do begin read(a[i,j]);d:=d+tinh(s[j],a[i,j]);end;readln;end; writeln(d);
for j:=1 to t do begin sla:=0;slb:=0;slc:=0;for i:=1 to n do begin if a[i,j]='S' then inc(sla);
 if a[i,j]='R' then inc(slb);if a[i,j]='P' then inc(slc);end;d1:=d1+max(max(sla+2*slc,slb+2*sla),slc+2*slb);end; writeln(d1);end.


