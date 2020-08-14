const   finp    =       'TOWN.inp';
        fout    =       'TOWN.out';
type    thap    =       record
        z,y,x,cs        :       longint;
               end;
var     a       :       array[0..5001] of thap;
        f,g     :       text;
        n,kq       :       longint;
        D,cao:      array[0..5001] of longint;
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
function        min(c,d1:longint):longint;
begin
         if c<d1 then exit(c);
        exit(d1);
end;
function       max(c,d1:longint):longint;
begin
        if c>d1 then exit(c);
        exit(d1);
end;
procedure       doc;
var     i,q1,q2,q3       :longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                     readln(f,q1,q2,q3);
                     a[i].cs:=i;
                     a[i].z:=min(min(q1,q2),q3);
                     a[i].y:=max(max(q1,q2),q3);
                     a[i].x:=q1+q2+q3-a[i].z-a[i].y;
                end;
end;
procedure       qs(l,h:longint);
var     i,j,t   :       longint;
        tg      :       thap;
begin
        i:=l;
        j:=h;
        t:=a[(l+h) div 2].y;
        repeat
                while a[i].y<t do inc(i);
                while a[j].y>t do dec(j);
                if i<=j then
                 begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until i>j;
        if i<h then qs(i,h);
        if j>l then qs(l,j);
end;
procedure       xuly;
var     i,j,t       :longint;
        Begin
                doc;
                QS(1,n);
                D[0]:=0;
                A[0].x:=-maxlongint;
                a[n+1].x:=maxlongint;
                kq:=0;
                for i:=n downto 0 do
                  Begin
                        t:=n+1;
                        for j:=i+1 to n+1 do
                         If (A[j].x>=A[i].x) then
                                If cao[t]<cao[j] then t:=j;
                           d[i]:=d[t]+1;
                           cao[i]:=cao[t]+a[i].z;
                  end;

                for i:=1 to n do
                   If (kq<cao[i]) then
                   begin
                   j:=i;
                   kq:=cao[i];
                   end;
                writeln(g,d[j],' ',kq);
                   dong;
end;
Begin
        mo;
        xuly;
end.

