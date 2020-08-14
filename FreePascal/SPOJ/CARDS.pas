const   finp    =       'CARDS.INP';
        fout    =       'CARDS.OUT';
type    bg      =       record
        x,y,l   :       longint;
        end;
var     g,f     :       text;
        n,m,k   :       longint;
        tr      :       array[1..100000] of bg;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i       :       longint;
begin
        readln(f,n,k,m);
        for i:=1 to m do
          readln(f,tr[i].x,tr[i].l,tr[i].y);
end;
procedure       xuly1(var t:longint;i:longint);
var     j     :       longint;
begin
        if (t>=tr[i].y)and(t<=tr[i].y+tr[i].l-1) then t:=t+tr[i].x-tr[i].y
        else if (t>=tr[i].y+tr[i].l)and(t<=tr[i].l+tr[i].x-1) then t:=t-tr[i].l;
end;

procedure       xuly2(var t:longint;i:longint);
var     j     :       longint;
begin
        if (t>=tr[i].y)and(t<=tr[i].y+tr[i].l-1) then t:=t+tr[i].x-tr[i].y
        else if (t>=tr[i].x)and(t<=tr[i].l+tr[i].y-1) then t:=t+tr[i].l;
end;
procedure       xuly;
var     i,t,j       :       longint;
begin
        for i:=1 to k do
         begin
          t:=i;
          for j:=m downto 1 do
           begin
                if tr[j].y<tr[j].x then xuly1(t,j)
                 else if tr[j].y>tr[j].x then xuly2(t,j);
           end;
           write(g,t,' ');
         end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
