uses    math;
const   finp    =       'COINS.INP';
        fout    =       'COINS.OUT';
        l       =       8;
        cs      =       trunc(1e8);
type    bignum  =       array[0..100] of longint;
var     g,f     :       text;
        n,m,dem     :       longint;
        a       :       array[1..51] of longint;
        d       :       array[1..230301] of bignum;
        kq1,h       :       int64;
        kq2 :       bignum;
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
var     i       :       longint;
begin
        readln(f,n,m);
        for i:=1 to n do
         readln(f,a[i]);
end;
function        UCLN(u,v:int64):int64;
begin
        if v=0 then exit(u)
        else exit(UCLN(v,u mod v));
end;
function        BCNN(a,b:int64):int64;
begin
        exit((a div UCLN(a,b))*b);
end;
function        nhan(a:bignum;b:int64):bignum;
var     c:bignum;
        i,n       :       longint;
        t,nho     :       int64;
begin
        fillchar(c,sizeof(c),0);
        nho:=0;
        for i:=1 to a[0] do
         begin
                t:=(a[i]*b+nho)mod cs;
                c[i]:=t;
                nho:=(a[i]*b+nho)div cs;
         end;
         while nho>0 do
          begin
                inc(i);
                c[i]:=nho mod cs;
                nho:=nho div cs;
          end;
         c[0]:=i;
        exit(c);
end;

function        BCNN4(a,b,c,d   :       int64):bignum;
var     t,t1    :       int64;
        t2   :       bignum;
begin
        t:=BCNN(a,b);
        t1:=BCNN(c,d);
        fillchar(t2,sizeof(t2),0);

        t2[0]:=0;

        t:=t Div UCLN(t,t1);
         while t>0 do
          begin
                inc(t2[0]);
                t2[t2[0]]:=t mod cs;
                t:=t div cs;
          end;
        exit(nhan(t2,t1));
end;
function        ss(a,b  :       bignum):bignum;
var     s,s1:   string;
        i       :       longint;
begin
        if a[0]>b[0] then exit(b)
        else if a[0]<b[0] then exit(a)
        else
         begin
            if a[a[0]]>b[b[0]] then exit(b);
            if a[a[0]]<b[b[0]] then exit(a);
            for i:=a[0]-1 downto 1 do
             begin
                str(a[i],s);
                str(b[i],s1);
                while length(s)<l do s:='0'+s;
                while length(S1)<l do s1:='0'+s1;
                if s>s1 then exit(b);
                if s<s1 then exit(a);
             end;
         end;
         exit(a);
end;

procedure       xuly;
var     i,j,k,t     :       longint;
begin
        dem:=0;
        for i:=1 to n-3 do
         for j:=i+1 to n-2 do
          for k:=j+1 to n-1 do
           for t:=k+1 to n do
           begin
               inc(dem);
               d[dem]:=BCNN4(a[i],a[j],a[k],a[t]);
            end;
end;
procedure       xuly1;
var     i,j,k,i1       :       longint;
        s,s1       :   string;
        t,t1       :  int64;
        tg:bignum;
        ok:boolean;

begin
        xuly;
       for i1:=1 to m do
        begin
        readln(f,h);
        kq1:=0;
        kq2[0]:=25;
        ok:=false;
        for i:=1 to dem do
         begin
                str(d[i][d[i][0]],s);
                if length(s)+(d[i][0]-1)*l<=18 then
                 begin
                      s1:=s;
                      for j:=d[i][0]-1 downto 1 do
                       begin
                         str(d[i][j],s);
                         while length(s)<l do s:='0'+s;
                         s1:=s1+S;
                       end;
                 val(s1,t);
                 kq1:=max(kq1,(h div t)*t);
                 if kq1=h then
                        begin
                                writeln(g,kq1,' ',kq1);
                                ok:=true;
                                break;
                        end;

                 tg[0]:=1;
                 t1:=h div t+1;
                  while t1>0 do
                   begin
                        inc(tg[0]);
                        tg[tg[0]]:=t1 mod cs;
                        t1:=t1 div cs;
                   end;
                 tg:=nhan(tg,t);
                 kq2:=ss(kq2,tg);
                 end
                 else
                                kq2:=ss(d[i],kq2);
          end;
          if not ok then
          begin
          write(g,kq1,' ');
          write(g,kq2[kq2[0]]);
          for i:=kq2[0]-1 downto 1 do
           begin
                str(kq2[i],s);
                while length(s)<l do s:='0'+s;
                write(g,s);
           end;
          writeln(g);
          end;
end;
end;
begin
        mo;
        doc;
        xuly1;
        dong;
end.
