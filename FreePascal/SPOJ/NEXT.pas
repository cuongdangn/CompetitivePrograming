const   finp    =       'NEXT.INP';
        fout    =       'NEXT.OUT';
        //1524286
var     g,f     :       text;
        st      :       array[1..9000000] of int64;
        dau,cuoi        :longint;
        a,b,k   :       longint;
        kq      :       longint;

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
procedure       QS(l,h  :       longint);
var     i,j,x,t      :       longint;
        tg      :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=st[t];
        repeat
                while st[i]<x do inc(i);
                while st[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=st[i];
                                st[i]:=st[j];
                                st[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;

procedure       doc;
var     i,j:    longint;
        u       :int64;
begin
        readln(f,k,a,b);
        st[1]:=k;
        dau:=1;
        cuoi:=1;
        st[dau]:=k;
        while dau<=cuoi do
         begin
                u:=st[dau];
                inc(dau);
                if u mod 2=1 then
                 begin
                        if u*2<=b then
                        begin
                        inc(cuoi);
                        st[cuoi]:=u*2;
                        end;
                 end
                else
                 begin
                        if u*2<=b then
                        begin
                        inc(cuoi);
                        st[cuoi]:=u*2;
                        end;
                        if u+1<=b then
                        begin
                        inc(cuoi);
                        st[cuoi]:=u+1;
                        end;
                 end;
         end;
         randomize;
         QS(1,cuoi);
         for i:=1 to cuoi do
          if st[i]>=a then break;
         kq:=1;
         for j:=i+1 to cuoi do
                if st[j]<>st[j-1] then inc(kq);
         writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
