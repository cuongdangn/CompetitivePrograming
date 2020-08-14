uses    math;
const   finp    =       '';
        fout    =       '';
        cs      =       14;
        ba      =       trunc(1e14);
type    big     =       array[0..57] of int64;
var     g,f     :       text;
        fx      :       array[1..3001,0..1,0..3] of big;
        dd      :       array[1..3001,0..1,0..3] of longint;
        s0,sa,s1:       big;
        n       :       longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
function        add(a,b :big):big;
var     c       :big;
        nho,t     :       int64;
        m,i       :       longint;
begin
        m:=max(a[0],b[0]);
        nho:=0;
        fillchar(c,sizeof(c),0);
        for i:=1 to m do
         begin
           t:=a[i]+b[i]+nho;
           c[i]:=t mod ba;
           nho:=t div ba;
         end;
         while nho>0 do
          begin
           inc(m);
           c[m]:=nho mod ba;
           nho:=nho div ba;
          end;
          c[0]:=m;
          exit(c);
end;



function        tinh(i,sll,sla:longint):big;
var     dem     :       big;
begin
 if i=n+1 then exit(s1);
 if dd[i,sll,sla]<>-1 then exit(fx[i,sll,sla]);
 dem:=s0;
 dem:=add(dem,tinh(i+1,sll,0));
 if sla<2 then dem:=add(dem,tinh(i+1,sll,sla+1));
 if sll=0 then dem:=add(dem,tinh(i+1,sll+1,0));
 fx[i,sll,sla]:=dem;
 dd[i,sll,sla]:=0;
 exit(dem);
end;
procedure       xuly;
var     i,j:    longint;
        kq      :       big;
        s       :       string;
begin
        s0[0]:=1;
        sa[0]:=1;
        sa[1]:=-1;
        s1[0]:=1;
        s1[1]:=1;
        fillchar(dd,sizeof(dd),255);
        kq:=tinh(1,0,0);
        j:=kq[0];
        write(g,kq[j]);
        for i:=j-1 downto 1 do
         begin
           str(kq[i],s);
           while length(s)<cs do s:='0'+s;
           write(g,s);
         end;
         writeln(g);
end;
procedure       doc;
begin
        while not seekeof(f) do
         begin
          readln(f,n);
          xuly;
         end;
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
begin
        mo;
        doc;
        dong;
end.