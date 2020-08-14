uses    math;
const   finp    =       'BAI1.INP';
        fout    =       '';
var     g,f     :       text;
        n,p,kq     :       longint;
        a,rmax,rmin       :       array[1..100001] of longint;
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
var     i   :longint;
begin
        readln(f,n,p);
        for i:=1 to n do read(f,a[i]);
end;
procedure       init;
var     i,j     :       longint;
begin
        a[n+1]:=maxlongint;
        for i:=n downto 1 do
         begin
                j:=i+1;
                while a[i]>=a[j] do j:=rmax[j];
                rmax[i]:=j;
         end;
         a[n+1]:=-a[n+1];
         for i:=n downto 1 do
          begin
                j:=i+1;
                while a[i]<=a[j] do j:=rmin[j];
                rmin[i]:=j;
          end;
end;
procedure       xuly;
var     cs1,cs2,dau,cuoi:longint;
begin
        init;
        dau:=1;
        cuoi:=1;
        cs1:=1;cs2:=1;
        kq:=1;
        repeat
                inc(cuoi);
                if a[cuoi]>=a[cs1] then cs1:=cuoi;
                if a[cuoi]<=a[cs2] then cs2:=cuoi;
                if a[cs1]-a[cs2]<=p then
                        kq:=max(kq,cuoi-dau+1)
                else
                        begin
                            if cuoi=cs1 then
                             begin
                                dau:=cs2+1;
                                inc(cs2);
                                while rmin[cs2]<=cuoi do
                                        cs2:=rmin[cs2];
                        if a[cs1]-a[cs2]<=p then
                                kq:=max(kq,cuoi-dau+1)
                             end
                             else
                               begin
                                dau:=cs1+1;
                                inc(cs1);
                                while rmax[cs1]<=cuoi do
                                       cs1:=rmax[cs1];
                                       if a[cs1]-a[cs2]<=p then
                        kq:=max(kq,cuoi-dau+1)
                               end;
                        end;
        until           cuoi>=n;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
