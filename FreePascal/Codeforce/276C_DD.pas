var     dem,t,test,i:longint;
        l,r,res:int64;
        a:array[0..60] of int64;

function getBit(k:longint;x:int64):longint;
begin
        getBit:=(x shr (k-1)) and 1;
end;

procedure SetBit(c,k:longint;var x:int64);
begin
        if c=1 then x:=x or (1 shl (k-1))
        else x:=x and (not (1 shl (k-1)));
end;

function check(x:longint):boolean;
var     t:int64;
        count,dem,i,c,d:longint;
begin
        dem:=0;
        for i:=1 to 59 do
            begin
                c:=getBit(i,l);if c=1 then count:=i;if c=1 then inc(dem);
            end;
        if dem=x then
           begin
               res:=l;exit(true);
           end;
        t:=l;
        if dem<x then
           begin
               if count>x then
                  begin
                      d:=0;
                      for i:=1 to count do
                          if getBit(i,t)=0 then
                             begin
                                setBit(1,i,t);
                                inc(d);if d=x-dem then break;
                             end;
                       if (t<=r)and(d=x-dem) then
                          begin
                                res:=t;
                                exit(true);
                          end;
                  end
               else t:=a[x];
               if t<=r then
                  begin
                        res:=t;
                        exit(true);
                  end;
               exit(false);
           end;
        d:=0;
        for i:=1 to count do
            if getBit(i,t)=1 then
               begin
                   setBit(0,i,t);inc(d);
                   if d=x-dem then break;
               end;
        t:=t shl 1;
        if t<=r then
           begin
                res:=t;exit(true);
           end;
        exit(false);
end;

BEGIN
 writeln(maxint);
        //assign(input,'A.INP');reset(input);
        dem:=0;
        a[0]:=0;
        while a[dem]*2+1<=trunc(1e18) do
            begin
                inc(dem);a[dem]:=a[dem-1]*2+1;
            end;readln(t);
        for test:=1 to t do
            begin
                readln(l,r);
                for i:=dem downto 1 do
                    if check(i) then break;writeln(res);
            end;

END.
