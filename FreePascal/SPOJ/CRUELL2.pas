{$N+}
var      d:longint;
        a       :       array[0..12] of double;
        dau,giua,cuoi:double;
procedure       doc;
var     i       :       longint;
begin
        readln(d);
        for i:=0 to d do readln(a[i]);
end;
function sum(x:double):double;
var s:double;
    t:double;
    i:longint;
Begin

     s:=a[0];
     t:=1;
     for i:=1 to d do
        begin
             t:=t*x;
             s:=s+t*a[i];
        end;
     sum:=s;
end;


procedure chat(i:longint);
var m:longint;
Begin
     dau:=-1000001;
     cuoi:=1000001;
     m:=0;
     repeat
                giua:=(dau+cuoi)/2;
                if (sum(giua)*i>=-0.00005) and (sum(giua)*i<=0.00005) then
                   begin
                        write(trunc(giua*1000));
                        exit;
                   end
                else
                       begin
                            if sum(giua)*i>0.00005 then cuoi:=giua
                            else dau:=giua;
                       end
     until 1=2;
end;
begin
        doc;
        if a[d]>0 then chat(1) else chat(-1);
end.