uses    math;
const   fin     =       'DC.INP';
        fout    =       'DC.OUT';
        mn      =       20000;
var     f1,f2   :       text;
        n       :       longint;
        res     :       longint;
        h,l     :       longint;
        ok      :       boolean;
        a,f,t,kq:       array[1..mn] of longint;
        q       :       array[1..mn,0..mn] of longint;
        p       :       array[1..2*maxint] of longint;
//////////////////////////////
procedure       mofile;
begin
        assign(f1,fin);
        reset(f1);
        assign(f2,fout);
        rewrite(f2);
end;
////////////////////////////////
procedure       docfile;
var     i,j     :       longint;
begin
        readln(f1,n);
        for i:=1 to n do
        begin
                read(f1,a[i]); f[i]:=1;
        end;
end;
//////////////////////////////
procedure       sangngto(n:longint);
var     i,j     :       longint;
begin
        for i:=2 to trunc(sqrt(n))+1 do
                if p[i]=0 then
                begin
                        j:=i*i;
                        while j<=n do
                        begin
                                p[j]:=1;
                                j:=j+i;
                        end;
                end;
end;
///////////////////////
procedure       push(x,y:longint);
begin
        inc(q[x,0]);
        q[x,q[x,0]]:=y;
end;
////////////////////////////
procedure       tim(i:longint);
var     j       :       longint;
        k       :       longint;
begin
        if res<2 then
        begin
                for j:=i-1 downto 1 do
                        if p[a[i]+a[j]]=0 then
                        begin
                                ok:=true;
                                if f[j]>h then
                                begin
                                        h:=f[j];
                                        l:=j;
                                end;
                        end;
                exit;
        end;
        for j:=res downto 2 do
        begin
                for k:=1 to q[j,0] do
                        if p[a[i]+a[q[j,k]]]=0 then
                        begin
                                ok:=true;
                                h:=j;
                                l:=q[j,k];
                                exit;
                        end;
        end;
end;
////////////////////////////
procedure       xulyfile;
var     i,j,k   :       longint;
begin
        for i:=2 to n do
        begin
                ok:=false; h:=0;
                //tim(i);
                for j:=i-1 downto 1 do
                        if p[a[i]+a[j]]=0 then
                        begin
                                ok:=true;
                                if f[j]>h then
                                begin
                                        h:=f[j];
                                        l:=j;
                                end;
                        end;
                if ok then
                begin
                        f[i]:=h+1;
                        t[i]:=l;
                end;
                if f[i]>res then
                begin
                        res:=f[i];
                        k:=i;
                end;
                //push(f[i],i);
        end;
        writeln(f2,res);
        j:=0; i:=k;
        repeat
                inc(j);
                kq[j]:=i;
                i:=t[i];
        until i=0;
        for i:=j downto 1 do write(f2,kq[i],' ');
end;
////////////////////////////////
procedure       dongfile;
begin
        close(f1);
        close(f2);
end;
////////////////////////////////////
begin
        mofile;
        docfile;
        sangngto(maxint*2);
        xulyfile;
        dongfile;
end.
