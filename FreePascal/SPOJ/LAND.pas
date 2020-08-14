uses    math;
const   finp    =       'LAND.INP';
        fout    =       'LAND.OUT';
type    bg      =       record
        mi,ma   :       longint;
        end;
var     g,f     :       text;
        dau1,cuoi1,dau2,cuoi2   :       longint;
        a       :       array[1..300,1..300] of longint;
        m,n,k,kq   :       longint;
        dq1,dq2 :       array[0..400] of longint;
        b       :       array[0..310] of bg;
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
var     i,j     :       longint;
begin
        readln(f,m,n,k);
        for i:=1 to m do
         for j:=1 to n do read(f,a[i,j]);
end;

procedure       add2(x:longint);
begin
        while (dau2<=cuoi2)and(b[dq2[cuoi2]].mi>b[x].mi) do dec(cuoi2);
        inc(cuoi2);
        dq2[cuoi2]:=x;
end;
procedure       add1(x:longint);
begin
        while (dau1<=cuoi1)and(b[dq1[cuoi1]].ma<b[x].ma) do dec(cuoi1);
        inc(cuoi1);
        dq1[cuoi1]:=x;
end;
function       tinh:longint;
var     i,j     :       longint;
        luu     :       longint;
begin
        dau1:=1;
        cuoi1:=0;
        dau2:=1;
        cuoi2:=0;
        luu:=0;
        j:=1;
        for i:=1 to m do
         begin
                add1(i);
                add2(i);
                while  (dau1<=cuoi1)and(dau2<=cuoi2)and(b[dq1[dau1]].ma-b[dq2[dau2]].mi>k) do
                        begin
                                if dq1[dau1]<dq2[dau2] then begin j:=dq1[dau1]+1;inc(dau1) end
                                else
                                 if dq1[dau1]=dq2[dau2] then begin j:=dq1[dau1]+1;inc(dau1);inc(dau2) end
                                else begin j:=dq2[dau2]+1;inc(dau2); end;
                        end;
                if (dau1<=cuoi1)and(dau2<=cuoi2) then luu:=max(luu,i-j+1);
         end;
         exit(luu);
end;
procedure       xuly;
var     i,j,k     :       longint;
begin
        for i:=1 to m do writeln(a[i,5]);
        for i:=1 to n do
         begin
         for j:=1 to m do
             begin
                b[j].ma:=-maxlongint;
                b[j].mi:=maxlongint;
             end;
         for j:=i to n do
          begin
             for k:=1 to m do begin b[k].ma:=max(b[k].ma,a[k,j]);b[k].mi:=min(b[k].mi,a[k,j]); end;
             kq:=max(kq,tinh*(j-i+1));
          end;
         end;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
