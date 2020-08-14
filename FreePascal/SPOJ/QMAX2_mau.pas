uses math;

const finp = 'DNC.INP';
      fout = '';
      MAXN = 50001;

var fi, fo : text;
    add, val : array [0..4 * MAXN] of longint;
    n, m : longint;
    i, kind, x, y, v : longint;

procedure down(i, con1, con2 : longint);
begin
     inc(add[con1], add[i]);
     inc(add[con2], add[i]);
     inc(val[con1], add[i]);
     inc(val[con2], add[i]);
     add[i] := 0;
end;

procedure up(i, con1, con2: longint);
begin
     val[i] := max(val[con1], val[con2]);
end;

procedure update(i, l, r, d, c, v : longint);
var g, con1, con2 : longint;
begin
     if (l = d) and (r = c) then
        begin
             inc(add[i], v);
             inc(val[i], v);
             exit;
        end;
     g := (l + r) shr 1;
     con1 := i shl 1;
     con2 := con1 + 1;
     down(i, con1, con2);
     if (d <= g) then update(con1, l, g, d, min(g, c), v);
     if (c > g) then update(con2, g + 1, r, max(g + 1, d), c, v);
     up(i, con1, con2);
end;

function get(i, l, r, d, c : longint) : longint;
var g, con1, con2, ans : longint;
begin
     if (l = d) and (r = c) then
        exit(val[i]);

     g := (l + r) shr 1;
     con1 := i shl 1;
     con2 := con1 + 1;

     down(i, con1, con2);

     ans := -1000000000;

     if (d <= g) then ans := max(ans, get(con1, l, g, d, min(g, c)));
     if (c > g) then ans := max(ans, get(con2, g + 1, r, max(g + 1, d), c));

     exit(ans);
end;

begin
     assign(fi, finp);
     reset(fi);
     assign(fo, fout);
     rewrite(fo);

     read(fi, n, m);
     for i := 1 to m do
         begin
              read(fi, kind, x, y);
              if (kind = 0) then
                 begin
                      read(fi, v);
                      update(1, 1, n, x, y, v);
                 end
              else
                  writeln(fo, get(1, 1, n, x, y));
         end;

     close(fo);
     close(fi);
end.
