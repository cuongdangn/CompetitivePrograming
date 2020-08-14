uses    math;
const   finp    =       'CIRCLE.INP';
        fout    =       'CIRCLE.OUT';
type    arr     =       array[1..100001] of longint;
var     g,f     :       text;
        m,n       :       longint;
        d1,d2,d3,t:       int64;
        dd      :       array[1..100001] of boolean;
        b1      :       array[0..2] of arr;
        sl,deta,detaluu    :       array[0..2] of longint;
        a,b     :       array[0..100001] of longint;
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
procedure       xuly1;
var     i       :       longint;
begin
        a[n]:=t-d2;
        a[1]:=t-d3;
        a[0]:=a[n];
        write(g,a[1]);
        for i:=2 to n-1 do
                a[i]:=b[i-1]-a[i-1]-a[i-2];
        for i:=2 to n do write(g,' ',a[i]);
end;
procedure       xuly2;
var     i       :       longint;
begin
        a[1]:=d2-t;
        a[n]:=d1-t;
        a[0]:=a[n];
        write(g,a[1]);
        for i:=2 to n-1 do
                a[i]:=b[i-1]-a[i-1]-a[i-2];
        for i:=2 to n do write(g,' ',a[i]);
end;
function        tim:longint;
var     i,j     :       longint;
begin
        for i:=1 to n do
         if dd[i] then exit(i);
end;
function        thugan(t,deta:longint;a:arr):boolean;
var     i       :       longint;
begin
        for i:=1 to m do
        begin
         a[i]:=a[i]+deta;
         if (a[i]>n)or(dd[a[i]]=false) then exit(false);
         dd[a[i]]:=false;
        end;
        exit(true);
end;
function        ktra(t1,t2,t3:longint):boolean;
var     i,j,min1     :       longint;
begin
        j:=1;
        min1:=maxlongint;
        for i:=1 to n do dd[i]:=true;
        for i:=1 to m do
          min1:=min(b1[t1,i],min1);
        deta[t1]:=1-min1;
        if not thugan(t1,deta[t1],b1[t1]) then exit(false);
        ////////////////
        j:=tim;
        min1:=maxlongint;
        for i:=1 to m do
          min1:=min(b1[t2,i],min1);
        deta[t2]:=j-min1;
        if not thugan(t2,deta[t2],b1[t2]) then exit(false);
        ////////////////
        j:=tim;
        min1:=maxlongint;
        for i:=1 to m do
          min1:=min(b1[t3,i],min1);
        deta[t3]:=j-min1;
        if not thugan(t3,deta[t3],b1[t3]) then exit(false);
        exit(true);
end;
procedure       xuat1;
var     i,j     :       longint;
begin
        for i:=1 to n do  write(g,a[i]+deta[i mod 3],' ');

end;
procedure       xuat;
var     i,j     :       longint;
begin
        for i:=1 to n do  if deta[i mod 3] < detaluu[i mod 3] then
          begin detaluu:=deta;exit end
        else
          if deta[i mod 3]>detaluu[i mod 3] then exit;
end;
procedure       xulyrieng;
var     i,j,k     :       longint;
        ok      : boolean;
begin
        a[1]:=0;
        a[2]:=0;
        a[3]:=0;
        m:=n div 3;
        ok:=true;
        for i:=4 to n do
          a[i]:=b[i-1]-b[i-2]+a[i-3];
        for i:=1 to n do
         begin
          inc(sl[i mod 3]);
          b1[i mod 3,sl[i mod 3]]:=a[i];
         end;
         for i:=1 to 3 do
          for j:=1 to 3 do
          if (i<>j) then
           begin
            k:=3-i mod 3-j mod 3;
            if ktra(i mod 3,j mod 3,k mod 3) then begin {if ok then begin ok:=false;detaluu:=deta  end else }xuat1;exit;end;
           end;
           xuat1;
end;


procedure       doc;
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        read(f,b[i]);
                        if i mod 3=0 then d3:=d3+b[i];
                        if i mod 3=1 then d1:=d1+b[i];
                        if i mod 3=2 then d2:=d2+b[i];
                end;
        t:=(d1+d2+d3)div 3;
        if n mod 3=1 then xuly1 else
        if n mod 3=2 then xuly2 else
        if n mod 3=0 then
                       xulyrieng;
end;
begin
        mo;
        doc;
        dong;
end.
