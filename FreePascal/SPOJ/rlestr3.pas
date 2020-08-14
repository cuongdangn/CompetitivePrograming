const   finp    =       'RLESTR3.INP';
        fout    =       'RLESTR3.OUT';
type    st      =       ansistring;
var     g,f     :       text;
        s       :       st;
        sl      :       array[1..1000] of int64;
        sta      :       array[0..1000] of longint;
        l,k       :       int64;
        cuoi      :       longint;
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
procedure       cb(a:st);
var     i,j,l1       :int64;
        s2      :       st;
begin
        fillchar(sl,sizeof(sl),0);
        i:=2;
        l:=0;
        l1:=length(a);
        s:=a[1];
        while i<=length(a) do
        begin
         s2:='';
         while not((a[i]<='z')and(a[i]>='a')) do
                begin
                        s2:=s2+a[i];
                        inc(i);
                        if i>l1 then break;
                end;
                val(s2,j);
                sl[length(S)]:=j;
                l:=l+j;
                if i<length(a) then s:=s+a[i];
                inc(i);
         end;
end;
procedure       push(u:longint);
begin
        while (s[u]>s[sta[cuoi]])and(cuoi>0) do
        begin
              if sl[sta[cuoi]]>=k then
                begin
                        sl[sta[cuoi]]:=sl[sta[cuoi]]-k;
                        k:=0;
                        exit;
                end
                else
                begin
                        k:=k-sl[sta[cuoi]];
                        sl[sta[cuoi]]:=0;
                        dec(cuoi);
                        if cuoi=0 then break;
                end;
        end;
        inc(cuoi);
        sta[cuoi]:=u;
end;
procedure       push1(u:longint);
begin
        while (s[u]<s[sta[cuoi]])and(cuoi>0) do
        begin
              if sl[sta[cuoi]]>=k then
                begin
                        sl[sta[cuoi]]:=sl[sta[cuoi]]-k;
                        k:=0;
                        exit;
                end
                else
                begin
                        k:=k-sl[sta[cuoi]];
                        sl[sta[cuoi]]:=0;
                        dec(cuoi);
                        if cuoi=0 then break;
                end;
        end;
        inc(cuoi);
        sta[cuoi]:=u;
end;
procedure       xuly(s1:st);
var     i,j       :       int64;

begin
        cb(s1);
        sta[1]:=1;
        cuoi:=1;
        i:=1;
        while (k>0)and(i<length(s)) do
                begin
                     inc(i);
                     push(i);
                end;
        if k>0 then
                while k>0 do
                        begin
                                if sl[sta[cuoi]]>=k then
                                        begin
                                                sl[sta[cuoi]]:=sl[sta[cuoi]]-k;
                                                k:=0;
                                                break;
                                        end
                                else
                                        begin
                                                k:=k-sl[sta[cuoi]];
                                                sl[sta[cuoi]]:=0;
                                                dec(cuoi);
                                        end;
                        end;
end;

procedure       xuly1(s1:st);
var     i,j       :       int64;

begin
        cb(s1);
        sta[1]:=1;
        cuoi:=1;
        i:=1;
        while (k>0)and(i<length(s)) do
                begin
                     inc(i);
                     push1(i);
                end;
        if k>0 then
                while k>0 do
                        begin
                                if sl[sta[cuoi]]>=k then
                                        begin
                                                sl[sta[cuoi]]:=sl[sta[cuoi]]-k;
                                                k:=0;
                                                break;
                                        end
                                else
                                        begin
                                                k:=k-sl[sta[cuoi]];
                                                sl[sta[cuoi]]:=0;
                                                dec(cuoi);
                                        end;
                        end;
end;

procedure       xuat;
var     i,j ,dem      :       longint;
        sl1,sl2       :       array[1..1000] of int64;
        kq,kq1      : st;
begin
        fillchar(sl1,sizeof(sl1),0);
        fillchar(sl2,sizeof(sl2),0);
        j:=1;
        dem:=0;
        kq:='';
        kq1:='';
        for i:=1 to length(s) do
                        if sl[i]>0 then
                        begin
                                inc(dem);
                                kq:=kq+s[i];
                                sl1[dem]:=sl[i];
                        end;
        dem:=0;
        while j<=length(kq) do
        begin
                inc(dem);
                sl2[dem]:=sl1[j];
                kq1:=kq1+kq[j];
                if j=length(kq) then
                if j=length(kq) then break;
                while kq[j]=kq[j+1] do
                begin
                       inc(j);
                       sl2[dem]:=sl2[dem]+sl1[j];
                end;
                inc(j);
        end;
        for i:=1 to dem do
                begin
                     write(g,kq1[i]);
                     str(sl2[i],kq);
                     write(g,kq);
                end;
end;
procedure       doc;
var     s1      :       st;
        T       :       INT64;
begin
        readln(f,k);
        T:=K;
        readln(f,s1);
        xuly(s1);
        xuat;
        writeln(g);
        K:=T;
        xuly1(s1);
        xuat;
end;
begin
        mo;
        doc;
        dong;
end.
