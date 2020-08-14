{$mode ObjFpc}
{$-R,-Q}
const   fi      =       '';
        fo      =       '';
        T       =       1000000000;
var     f,g     :       text;
        kq      :       qword;
        A       :       array[1..100001] of int64;
        D,B,cs     :       array[1..100001] of int64;
        L       :       array[0..10003,0..11] of int64;
        i,j,k,n,key :       longint;
function        find(u:longint):longint;
Begin
                If (u<1) then
                   Begin
                        find:=0;
                        exit;
                   end;

                find:=((D[u] mod T)+(find(u-(u and (-u) ) ) mod T) ) mod T;
end;
procedure       update(u:longint);
        Begin
                If (u>10000) then exit;

                D[u]:=((D[u] mod T) + (L[j,i-1] mod T)) mod T;
                u:=u+(u and (-u));
                update(u);
        end;
procedure       QS(l,h:longint);
var     x,tg,i,j  :       longint;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                tg:=cs[i];
                                cs[i]:=cs[j];
                                cs[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
                until   i>j;
        if i<h then QS(i,h);
        if j>L then QS(l,j);
end;
procedure       doc;
        Begin

                assign(f,fi);
                assign(g,fo);
                reset(f);
                rewrite(g);
                readln(f,n,k);
                for i:=1 to n do
                  read(f,A[i]);
                for i:=1 to n do cs[i]:=i;
                QS(1,n);
        end;
procedure       enter;
        Begin


                kq:=1;
                fillchar(l,sizeof(l),0);
                for i:=1 to n do L[i,1]:=1;
               key:=1;
                B[cs[1]]:=1;

                for i:=2 to n do
                  Begin
                        If (A[i]<>A[i-1]) then inc(key);
                        B[cs[i]]:=key;
                  end;
                fillchar(d,sizeof(d),0);

                for i:=1 to k do
                 Begin
                   fillchar(d,sizeof(d),0);
                   for j:=n downto 1 do
                      Begin
                        If (i>1) then
                        L[j,i]:=find(b[j]-1) mod T;

                        update(b[j]);


                      end;
                 end;
                kq:=0;
                for i:=1 to n do
                  kq:=((kq mod T)+(L[i,k] mod T)) mod T;
                writeln(g,kq);
                close(f);
                close(g);
        end;
Begin
        doc;
        enter;
end.
