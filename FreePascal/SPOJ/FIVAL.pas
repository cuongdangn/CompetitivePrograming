var t, i, u, v: longint;

function solve(a, b: longint): longint;
  var ta, tb, am, bm, n: longint;
  begin
       ta:= (a - 1) div 16;
       tb:= (b - 1) div 16;
       am:= a mod 16;
       if am = 0 then am:= 16;
       bm:= b mod 16;
       if bm = 0 then bm:= 16;
       if b - a + 1 >= 32 then exit(((b - a + 1) div 16) * 16);
       if ta = tb then
         if (am <= 8) and (bm >= 9) then exit(2);
       if tb - ta >= 1 then exit(2);
       exit(-1);
  end;
begin
     readln(t);
     for i:= 1 to t do
        begin
             readln(u, v);
             writeln(solve(u, v));
        end;
end.
