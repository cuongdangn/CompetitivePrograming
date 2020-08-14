const   finp    =       'MSQUARE.INP';
        fout    =       'MSQUARE.OUT';
type    arr     =       array[1..8] of integer;
var     g,f     :       text;
        n       :       byte;
        c       :       arr;
        dd,bd     :       longint;
        st      :       array[0..40321] of int64;
        d       :       array[342225..16434825] of longint;
        ktu     :       array[342225..16434825] of char;
        kq      :       array[0..40321] of char;
        dau,cuoi     :       longint;
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
function        sh(x:arr):longint;
var   i,j       :longint;
      c :       longint;
begin
        i:=2097152;
        c:=0;
        for j:=1 to 8 do
        begin
        c:=c+x[j]*i;
        i:=i div 8;
        end;
        exit(c);
end;
procedure       doc;
var     i  :longint;
begin
        for i:=1 to 8 do
                begin
                        read(f,c[i]);
                        c[i]:=c[i]-1;
                end;
        dd:=sh(c);
end;
function        doixau(x:longint):arr;
var     i,dem       :       longint;
        c       :       arr;
begin
        dem:=8;
        i:=x;
        while dem>0 do
                begin
                        c[dem]:=i mod 8;
                        i:=i div 8;
                        dec(dem);
                end;
                exit(c);
end;
procedure       push(u:int64);
begin
        inc(cuoi);
        st[cuoi]:=u;
end;
function        bda(a:arr):arr;
var     i:byte;
        c:arr;
begin
        for i:=1 to 8 do c[8-i+1]:=a[i];
        exit(c);
end;
function bdb(a:arr):arr;
var     i       :       byte;
        c       :       arr;
begin
        for i:=2 to 4 do c[i]:=a[i-1];
        for i:=5 to 7 do c[i]:=a[i+1];
        c[1]:=a[4];
        c[8]:=a[5];
        exit(c);
end;
function       bdc(a:arr):arr;
var     i:byte;
        c       :       arr;
begin
        c:=a;
        c[2]:=a[7];
        c[3]:=a[2];
        c[6]:=a[3];
        c[7]:=a[6];
        exit(c);
end;
procedure       BFS;
var     i,u,v       :       longint;
        c,k       : arr;
begin
        dau:=1;
        cuoi:=0;
        push(342391);
         if dd=342391 then exit;
        while dau<=cuoi do
                begin

                      u:=st[dau];
                      c:=doixau(u);
                      inc(dau);

                      k:=bda(c);
                      v:=sh(K);


                      if d[v]=0 then
                      begin
                      d[v]:=u;
                      push(v);
                      ktu[v]:='A';
                      if v=dd then exit;
                      end;

                      k:=bdb(c);

                      v:=sh(K);

                      if d[v]=0 then
                      begin
                      d[v]:=u;
                      push(v);
                      ktu[v]:='B';
                      if v=dd then exit;
                      end;

                      k:=bdc(c);
                      v:=sh(K);

                      if d[v]=0 then
                      begin
                      d[v]:=u;
                      push(v);
                      ktu[v]:='C';
                      if v=dd then exit;
                      end;
                end;
end;
procedure       xuly;
var     i       :       longint;
begin
        BFS;
        i:=dd;
        while i<>342391 do
                begin
                        inc(bd);
                        kq[bd]:=ktu[i];
                        i:=d[i];
                end;
        writeln(g,bd);
        for i:=bd downto 1 do write(g,kq[i]);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.








