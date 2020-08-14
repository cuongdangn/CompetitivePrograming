const   maxn = 100;
var     m, n : integer;
        a : array [1..maxn,1..maxn] of integer;
        l : array [0..maxn+1,1..maxn] of longint;
        fi, fo : text;
procedure nhap;
var     i, j : integer;
begin
        readln(fi,m,n);
        for i:=1 to m do
                begin
                        for j:=1 to n do
                                read(fi,a[i,j]);
                        readln(fi);
                end;
end;

procedure xuli;
var     i, j :integer;
        s : longint;
        function max (u, v, o : longint) : longint;
        begin
                if ((u+a[j,i])>=(v+a[j,i])) and ((u+a[j,i])>=(o+a[j,i])) then max:=u+a[j,i]
                else if ((o+a[j,i])>=(u+a[j,i])) and ((o+a[j,i])>=(v+a[j,i])) then max:=o+a[j,i]
                else if ((v+a[j,i])>=(o+a[j,i])) and ((v+a[j,i])>=(u+a[j,i])) then max:=v+a[j,i];
        end;

begin
        for i:=1 to n do
                l[0,i]:=-100000;
        for i:=1 to n do
                l[m+1,i]:=-100000;
        for i:=1 to m do
                l[i,1]:=a[i,1];
        for i:=2 to n do
                for j:=1 to m do
                        l[j,i]:=max(l[j-1,i-1],l[j+1,i-1],l[j,i-1]);
        s:=-100000;
        for i:=1 to m do
                if s<=l[i,n] then s:=l[i,n];
        writeln(fo,s);
end;

begin
        assign(fi,''); reset(fi);
        assign(fo,''); rewrite(fo);
        nhap;
        xuli;
        close(fi);
        close(fo);
end.
