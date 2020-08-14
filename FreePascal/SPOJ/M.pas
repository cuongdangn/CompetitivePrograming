uses    math;
const   finp    =       '';
        fout    =       '';
type    arr     =        array[1..51000,1..2] of longint;
var     g,f     :       text;
        n,kq    :       longint;
        d       :       array[0..50005,1..4] of longint;
        a,cs,b  :       array[0..50005] of longint;
        bit1,bit2,bit3,bit4 :       array[1..51000,1..2] of longint;
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
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       swap(var a,b:longint);
var     tg      :       longint;
begin
        tg:=a;
        a:=b;
        b:=tg;
end;
procedure       QS(l,h:longint);
var     x,t,i,j :       longint;
begin
        i:=l;
        j:=h;
        t:=random(h-l+1)+l;
        x:=a[t];
        repeat
          while a[i]<x do inc(i);
          while a[j]>x do dec(j);
          if i<=j then
           begin
            swap(a[i],a[j]);
            swap(cs[i],cs[j]);
            inc(i);dec(j);
           end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       init;
var     i,j,k   :       longint;
begin
        for i:=1 to n do
         cs[i]:=i;
        randomize;
        QS(1,n);
        k:=1;
        b[cs[1]]:=1;
        for i:=2 to n do
         begin
           if a[i]<>a[i-1] then inc(k);
           b[cs[i]]:=k;
         end;
         a:=b;
end;
function        get1(i:longint;var bit:arr;j:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i>0 do
         begin
                tg:=max(tg,bit[i,j]);
                i:=i-i and (-i);
         end;
        exit(tg);
end;
function        get2(i:longint;var bit:arr;j:longint):longint;
var     tg      :       longint;
begin
        tg:=0;
        while i<=n do
         begin
                tg:=max(tg,bit[i,j]);
                i:=i+i and (-i);
         end;
        exit(tg);
end;
procedure       up1(i:longint;var bit:arr;j,x:longint);
begin
        while i<=n do
         begin
                bit[i,j]:=max(bit[i,j],x);
                i:=i+i and (-i);
         end;
end;

procedure       up2(i:longint;var bit:arr;j,x:longint);
begin
        while i>0 do
         begin
                bit[i,j]:=max(bit[i,j],x);
                i:=i-i and (-i);
         end;
end;

procedure       sub4;
var     i,j,t1,t2,t3,t4     :       longint;
begin
        init;
        for i:=1 to n do
        begin
                t1:=get1(a[i]-1,bit1,1);
                d[i,1]:=t1+1;
                up1(a[i],bit1,1,t1+1);
                t1:=get2(a[i]+1,bit1,2);
                up2(a[i],bit1,2,d[i,1]);
                //////////////////////
                if t1>1 then d[i,2]:=t1+1;
                t2:=get2(a[i]+1,bit2,1);
                if t2>0 then d[i,2]:=max(d[i,2],t2+1);
                up2(a[i],bit2,1,d[i,2]);
                t2:=get1(a[i]-1,bit2,2);
                up1(a[i],bit2,2,d[i,2]);
                ///////////////////////
                if t2>0 then d[i,3]:=t2+1;
                t3:=get1(a[i]-1,bit3,1);
                if t3>0 then d[i,3]:=max(d[i,3],t3+1);
                up1(a[i],bit3,1,d[i,3]);
                t3:=get2(a[i]+1,bit3,2);
                up2(a[i],bit3,2,d[i,3]);
                ///////////////////////
                if t3>0 then d[i,4]:=t3+1;
                t4:=get2(a[i]+1,bit4,1);
                if t4>0 then d[i,4]:=max(d[i,4],t4+1);
                up2(a[i],bit4,1,d[i,4]);
                kq:=max(kq,d[i,4]);
        end;
        writeln(g,kq);
end;
procedure       sub2;
var     i,j     :       longint;
begin
        a[0]:=-maxlongint;
        for i:=1 to n do
        begin
         for j:=i-1 downto 0 do
          begin
           if a[i]>a[j] then
            begin
              d[i,1]:=max(d[i,1],d[j,1]+1);
              if d[j,2]>0 then
               d[i,3]:=max(d[i,3],d[j,2]+1);
              if d[j,3]>0 then
               d[i,3]:=max(d[i,3],d[j,3]+1);
            end;
           if a[i]<a[j] then
            begin
             if d[j,1]>1 then
             d[i,2]:=max(d[i,2],d[j,1]+1);
             if d[j,2]>0 then
              d[i,2]:=max(d[i,2],d[j,2]+1);
              //
            if d[j,3]>0 then
              d[i,4]:=max(d[i,4],d[j,3]+1);
             if d[j,4]>0 then d[i,4]:=max(d[i,4],d[j,4]+1);
             end;
           end;
           kq:=max(kq,d[i,4]);
        end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        kq:=0;
      // if n<1000 then sub2 else
        sub4;
        dong;
end.
