const   finp    =       '';
        fout    =       '';
        maxn    =       4*100000+100;
type    re      =       record
        gt,l,cs :longint;
        end;
var     g,f     :       text;
        c       :       array[0..maxn] of char;
        a       :       array[0..maxn] of re;
        n,m       :       longint;
        d,th,pos       :       array[0..maxn] of longint;
        b       :       array[0..maxn,1..3] of longint;

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
var     i:      longint;
begin
        readln(f,n);
        for i:=1 to n do
         begin

        read(f,c[i]);
                if c[i]<>'?' then
                        begin
                                inc(m);
                                readln(f,a[m].gt);
                                a[m].cs:=i;
                                a[m].l:=1;
                        end
                else
                        begin
                                read(f,b[i][1]);
                                inc(m);
                                read(f,a[m].gt);
                                a[m].l:=2;
                                a[m].cs:=i;
                                inc(m);
                                read(f,a[m].gt);
                                a[m].cs:=i;
                                a[m].l:=3;
                                readln(f);
                        end;
         end;
end;

procedure       QS(l,h:longint);
var     x,i,j     :       longint;
        tg      : re;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].gt;
        repeat
                while a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
procedure       ktao;
var     i,k       :longint;
begin
        QS(1,m);
        k:=1;
        a[0]:=a[1];
        for i:=1 to m do
         begin
            if a[i].gt<>a[i-1].gt then inc(k);
            b[a[i].cs,a[i].l]:=k;
            th[k]:=a[i].gt;
         end;


end;
function       get(i:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
                begin
                        tg:=tg+d[i];
                        i:=i-i and (-i);
                end;
       exit(tg)
end;
procedure       update(i,v:longint);
begin
        while i<=m do
                begin
                        d[i]:=d[i]+v;
                        i:=i + i and (-i);
                end;
end;
function chat(x:longint):longint;
var luu,dau,cuoi,mid:longint;
begin
        dau:=1;cuoi:=m;
        repeat
                mid:=(dau+cuoi) div 2;
                if  x>get(mid-1) then
                        begin
                                luu:=mid;
                                dau:=mid+1;
                        end
                else cuoi:=mid-1;
        until dau>cuoi;
        exit(luu);
end;
procedure       xuly;
var     i,l,h,x      :       longint;
begin
        for i:=1 to n do
                begin
                    if c[i]='+' then
                    begin
                        update(b[i,1],1);
                        inc(pos[b[i,1]]);
                    end
                    else if c[i]='-' then
                    begin
                    if pos[b[i,1]]>0 then
                    begin
                        update(b[i,1],-1);
                        dec(pos[b[i,1]]);
                    end
                    end
                    else
                        begin
                            l:=get(b[i,2]-1);
                            h:=get(b[i,3]);
                         if h-l < b[i,1] then writeln(g,0) else
                         begin
                            x:=l+b[i,1];
                            h:=chat(x);
                            writeln(g,th[h]);
                         end;
                        end;
                end;
end;
begin
        mo;
        doc;
        ktao;
        xuly;
        dong;
end.
