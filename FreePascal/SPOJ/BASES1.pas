const   finp    =       'BASES.INP';
        fout    =       'BASES.OUT';
type    bit     =       array[1..39] of byte;
var     g,f     :       text;
        n       :       int64;
        lt      :       array[0..39] of int64;
        a       :       bit;
        b,c,k     :       longint;
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
var     i:byte;
begin
        readln(f,n,b,c);
        lt[0]:=1;
        for i:=1 to 39 do lt[i]:=lt[i-1]*(c);
end;
procedure       cd(var a:bit;x:int64);
begin
    k:=0;
    while x>0 do
     begin
        inc(k);
        a[k]:=x mod b;
        x:=x div b;
     end;
end;
function        tinh(x:int64;var ok:boolean):int64;
var     i       :       longint;
        dem     :       int64;
begin
        cd(a,x);
        dem:=0;
        ok:=false;
        for i:=k downto 1 do
         begin
          if a[i]>=c then
           begin
            dem:=dem+lt[i];
            ok:=true;
            break;
           end
          else
           begin
            dem:=dem+lt[i-1]*(a[i]);
            continue
           end;
         end;
         if ok then dem:=dem-1;
         exit(dem);
end;
procedure               chat;
var     l,h,m,t1  :        int64;
        i,j     : longint;
        s       :       bit;
        ok      :  boolean;
begin
        l:=1;
        h:=trunc(1e18);
        while l<=h do
                begin
                        m:=(l+h) div 2;
                        t1:=tinh(m,ok);
                        if ((m-t1)=n)and ok then
                                begin
                                        writeln(g,m);
                                        dong;
                                        halt;
                                end
                        else
                         if (m-t1)>=n then h:=m-1
                         else l:=m+1;
                end;
end;
begin
        mo;
        doc;
        chat;
        dong;
end.
