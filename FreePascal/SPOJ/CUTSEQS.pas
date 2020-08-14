uses    math;
const   finp    =       '';
        fout    =       '';
        maxn    =       100001;
var     g,f     :       text;
        n       :       longint;
        a       :       array[0..maxn] of longint;
        dq,tr   :       array[1..maxn] of longint;
        dau,cuoi:       longint;
        s       :       int64;
        it,tang :       array[1..4*maxn] of int64;
        d       :       array[1..maxn] of int64;
        m       :       int64;
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
var     i,j:    longint;
begin
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
end;
procedure       ldu(k:longint);
begin
        it[k*2]:=it[k*2]+tang[k];
        it[k*2+1]:=it[k*2+1]+tang[k];
        tang[k*2]:=tang[k*2]+tang[k];
        tang[k*2+1]:=tang[k*2+1]+tang[k];
        tang[k]:=0;
end;
procedure       up(k,l,h,i,j:longint;x:int64);
var     mid     :       longint;
begin
        if (h<i)or(l>j) then exit;
        if (l>=i)and(h<=j) then
         begin
                it[k]:=it[k]+x;
                tang[k]:=tang[k]+x;
                exit;
         end;
         ldu(k);
         mid:=(l+h) >> 1;
         up(k*2,l,mid,i,j,x);
         up(k*2+1,mid+1,h,i,j,x);
         it[k]:=min(it[k*2],it[k*2+1]);
end;
function       get(k,l,h,i,j:longint):int64;
var     mid     :       longint;
        tg      :       int64;
begin
        if (h<i)or(l>j) then exit(trunc(1e18));
        if (l>=i)and(h<=j) then
                exit(it[k]);
         ldu(k);
         mid:=(l+h) >> 1;
         tg:=get(k*2,l,mid,i,j);
         tg:=min(tg,get(k*2+1,mid+1,h,i,j));
         it[k]:=tg;
         exit(tg);
end;

procedure       add(i:longint);
var     t       :       longint;
begin
        if dau<=cuoi then begin up(1,0,n,dq[cuoi],i-1,a[i]);t:=dq[cuoi] end;

        while (dau<=cuoi)and(a[dq[cuoi]]<=a[i]) do
         begin
                up(1,0,n,tr[cuoi],dq[cuoi]-1,a[i]-a[dq[cuoi]]);
                t:=tr[cuoi];
                dec(cuoi);
         end;
         inc(cuoi);
         dq[cuoi]:=i;
         tr[cuoi]:=t;
end;

procedure       xuly;
var     i,j     :       longint;
        t       :       int64;
begin
        j:=0;
        dau:=1;
        cuoi:=1;
        tr[cuoi]:=0;
        for i:=1 to n do
         begin
                add(i);
                s:=s+a[i];
                while (j<=i)and(s>m) do
                 begin
                        if dq[dau]=j then inc(dau);
                        inc(j);
                        s:=s-a[j];
                 end;
                 tr[dau]:=j;
                 if j<=i then
                  begin
                        t:=get(1,0,n,j,i-1);
                        d[i]:=t;
                        up(1,0,n,i,i,d[i]);
                  end;
         end;
         if d[n]<trunc(1e18) then writeln(g,d[n]) else writeln(g,-1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
