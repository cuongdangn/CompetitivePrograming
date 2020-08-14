program bai1;
uses crt;
const
     dl                 =       'DNC.inp';
     kq                 =       'DNC.out';
     maxs               =       10001;
     maxn               =       101;
type
    arr1                =       array [0..maxn] of integer;
    arr2                =       array [0..maxs] of integer;
    arr3                =       array [0..maxs] of byte;
var
   a                    :       arr1;
   b                    :       arr1;
   d                    :       arr2;
   tr                   :       arr3;
   ind                  :       arr1;
   n, s                 :       integer;
   f                    :       text;

procedure input;
var
   i, j                 :       integer;
begin
        assign(f, dl); reset(f);
        readln(f, n, s);
        fillchar(a, sizeof(a), 0);
        for i := 1 to n do
                read(f, a[i]);
                        close(f);
                        assign(f, kq); rewrite(f);
end;

Procedure khoitao;
var
   i, j                 :       integer;
   t                    :       integer;
begin
fillchar(d, sizeof(d), 0);
fillchar(tr, sizeof(tr), 0);
fillchar(ind, sizeof(ind), 0);

for i := 1 to n do
    ind[i] := i;

for i := 1 to n - 1 do
    for j := i + 1 to n do
        if a[i] > a[j] then
           begin
           t := a[i];
           a[i] := a[j];
           a[j] := t;

           t := ind[i];
           ind[i] := ind[j];
           ind[j] := t;
           end;
end;



Procedure Xuli;
var
   i, j, u              :       integer;
begin
        for i := 1 to n do
                begin
                         d[a[i]] := 1;
                         tr[a[i]] := i;
                end;
for i := 1 to s do
    begin
    for j := 1 to n do
        if i > a[j] then
           begin
           u := i - a[j];
           if (d[u] <> 0) and ((d[i] = 0) or (d[i] > d[u] + 1)) then
              begin
              d[i] := d[u] + 1;
              tr[i] := j;
              end;
           end
        else      break;
    end;
end;

Procedure BuiltB(var tong: longint);
var
   i, j                 :       integer;
begin
tong := 0;
fillchar(b, sizeof(b), 0);
i := s;
repeat
      inc(b[tr[i]]);
      i := i - a[tr[i]];
      until i = 0;
a := b;
for i := 1 to n do
    begin
    tong := tong + a[i];
    b[ind[i]] := a[i];
    end;
end;

Procedure Output;
var
   i, j                 :       integer;
   tong                 :       longint;
begin
if d[s] = 0 then
   writeln(f, -1)
else
    begin
    builtb(tong);
    writeln(f, tong);
    for i := 1 to n do
        write(f, b[i], ' ');
    end;
close(f);
end;


begin
        input;
        khoitao;
        xuli;
        output;
end.

