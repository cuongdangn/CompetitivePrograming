var     i,c,n,min:longint;
        a,x       :array[1..16] of longint;

procedure       xuat;
var     j,s:longint;
begin
        s:=0;
        for j:=1 to n do if x[j]=1 then s:=s+a[j];
          if (s>min)and(s<=c) then min:=s;
end;

procedure       dq(i:longint);
var     j:byte;
begin
        for j:=0 to 1 do
        begin
                x[i]:=j;
                if i=n then xuat else dq(i+1);
        end;
end;
begin
        readln(c,n);
        for i:=1 to n do readln(a[i]);
        min:=-1;
        dq(1);
        writeln(min);
end.
