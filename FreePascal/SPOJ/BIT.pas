uses    math;
const   finp    =       'BIT.INP';
        fout    =       'BIT.OUT';
        d       :       array[1..4] of integer=(1,-1,0,0);
        c       :       array[1..4] of integer=(0,0,1,-1);
type    re      =       record
        x,y     :longint;
        end;
        re1     =       record
        x,y,x1,y1:longint;
        end;
var     g,f     :       text;
        st      :       array[1..20000] of re;
        res      :       array[1..20000] of re1;
        s,dem,kq,n,m,dau,cuoi     :       longint;
        a       :       array[1..100,1..100] of char;
        kt      :  array[1..2] of re;
        dd      :  array[1..100,1..100] of byte;
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
        readln(f,n,m);
        for i:=1 to n do
                begin
                        for j:=1 to m do read(f,a[i,j]);
                        readln(f);
                end;
end;
function        check(x,y:longint):boolean;
begin
        if (x<=n)and(x>0)and(y<=m)and(y>0) then exit(true);
        exit(false);
end;
procedure       push(x,y:longint);
begin
        inc(cuoi);
        st[cuoi].x:=x;
        st[cuoi].y:=y;
end;
procedure       capnhap;
begin
        inc(kq);
        res[kq].x:=kt[1].x;
        res[kq].y:=kt[1].y;
        res[kq].x1:=kt[2].x;
        res[kq].y1:=kt[2].y;
end;
function        kt1:boolean;
var     s1,s,s2,mix1,miy1,mx1,may1,i,j,mix,miy,mx,may,da,cu     :       longint;
begin
        if ((dd[kt[1].x,kt[1].y]=1)and(dd[kt[2].x,kt[2].y]=1))
                or((dd[kt[1].x,kt[2].y]=1)and(dd[kt[2].x,kt[1].y]=1)) then exit(false);
        dem:=0;
         mix:=101;
        miy:=101;
        mx:=0;
        may:=0;
        s:=(kt[2].x-kt[1].x+1)*(kt[2].y-kt[1].y+1);
        for i:=kt[1].x to kt[2].x do
                begin
                        for j:=kt[1].y to kt[2].y do
                         if dd[i,j]=1 then
                         inc(dem)
                         else
                                begin
                                      mx:=max(mx,i);
                                      may:=max(may,j);
                                      mix:=min(mix,i);
                                      miy:=min(miy,j);
                                end;
                end;

        mix1:=101;
        miy1:=101;
        mx1:=0;
        may1:=0;
        for i:=mix to mx do
                begin
                        for j:=miy to may do
                              if dd[i,j]=1 then
                                begin
                                       mx1:=max(mx1,i);
                                      may1:=max(may1,j);
                                      mix1:=min(mix1,i);
                                      miy1:=min(miy1,j);
                                end;
              end;
         s1:=(mx-mix+1)*(may-miy+1);
         s2:=(mx1-mix1+1)*(may1-miy1+1);
        for i:=mix1 to mx1 do
                begin
                        for j:=miy1 to may1 do
                              if dd[i,j]=0 then exit(false);
              end;
        if s=dem+s1-s2 then exit(true);
end;
procedure       bfs(s,t:longint);
var             x,y,i,x1,x2:longint;
begin
        dau:=1;
        cuoi:=0;
        push(s,t);
        fillchar(kt,sizeof(kt),0);
        kt[1].x:=101;
        kt[1].y:=101;
        kt[2].x:=0;
        kt[2].y:=0;
        while dau<=cuoi do
                begin
                        x:=st[dau].x;
                        y:=st[dau].y;
                        inc(dau);
                        kt[2].x:=max(kt[2].x,x);
                        kt[2].y:=max(kt[2].y,y);
                        kt[1].x:=min(kt[1].x,x);
                        kt[1].y:=min(kt[1].y,y);
                        for i:=1 to 4 do
                                if check(x+d[i],y+c[i]) then
                                 if dd[x+d[i],y+c[i]]=0 then
                                        if a[x+d[i],y+c[i]]='1' then
                                begin
                                        dd[x+d[i],y+c[i]]:=1;
                                        push(x+d[i],y+c[i]);
                                end;
                end;
        if kt1 then capnhap;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to n do
                for j:=1 to m do
                 if (a[i,j]='1')and(dd[i,j]=0) then bfs(i,j);
                writeln(g,kq);
        for i:=1 to kq do writeln(g,res[i].x,' ',res[i].y,' ',res[i].x1,' ',res[i].y1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
