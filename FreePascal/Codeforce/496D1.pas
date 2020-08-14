uses    math;
const   finp    =       'codef.INP';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m,kq,k     :       longint;
        a       :       array[1..100000] of longint;
        sl      :       array[1..2] of longint;
        luu     :       array[1..500000] of bg;
        tong    :       array[1..2,1..100001] of longint;

procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n);
       for i:=1 to n do begin read(f,a[i]);inc(sl[a[i]]); end;
end;
function        chat(x,l:longint):longint;
var     dau,cuoi,giua,luu1   :       longint;
begin
        dau:=1;
        cuoi:=n;
        luu1:=0;
        while dau<=cuoi do
         begin
          giua:=(dau+cuoi) div 2;
          if tong[l][giua]=x then
            begin
             luu1:=giua;
             cuoi:=giua-1;
            end
            else if  tong[l,giua]>x then dau:=giua+1
            else cuoi:=giua-1;
          end;
          exit(luu1);
end;

procedure       QS(l,h  :       longint);
var     i,j,x,t,y      :       longint;
        tg      :       bg;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=luu[t].x;
        y:=luu[t].y;
        repeat
                while (luu[i].x<x)or((luu[i].x=x)and(luu[i].y<y)) do inc(i);
                while (luu[j].x>x)or((luu[j].x=x)and(luu[j].y>y)) do dec(j);
                if i<=j then
                        begin
                                tg:=luu[i];
                                luu[i]:=luu[j];
                                luu[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j,t,tt,j1     :       longint;
        ok      :   boolean;
        str,x     :   array[1..2] of longint;
begin
        for i:=n downto 1 do
         begin
           tong[a[i]][i]:=tong[a[i]][i+1]+1;
           tong[3-a[i]][i]:=tong[3-a[i]][i+1];
         end;
        if sl[1]=sl[2] then begin writeln(g,0);exit end;
        m:=max(sl[1],sl[2]);
        if ((sl[1]=m)and(a[n]=2))or((sl[2]=m)and(a[n]=1)) then
         begin
          writeln(g,0);
          exit;
         end;
        /////////////
        for t:=1 to m do
         begin
           j:=n;
           x[1]:=0;
           x[2]:=0;
           ok:=true;
           str[1]:=0;
           str[2]:=0;
           while j>=1 do
           begin
           tt:=a[j];
           x[tt]:=x[tt]+t;
           j1:=j;
           j:=chat(x[tt],tt);
           //writeln(t);
           if (j=0)or(tong[3-tt,j]-tong[3-tt,j1+1]>=t) then begin ok:=false;break end;
           inc(str[tt]);
           j:=j-1;
           end;
           if ok and (str[a[n]]>str[3-a[n]]) then
            begin
             inc(k);
             luu[k].x:=str[a[n]];
             luu[k].y:=t;
            end;
         end;
         if k>0 then QS(1,k);
         writeln(g,k);
         for i:=1 to k do
          writeln(g,luu[i].x,' ',luu[i].y);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.