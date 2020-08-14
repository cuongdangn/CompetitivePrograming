uses    math;
const   finp    =       'DNC.INP';
        fout    =       '';
        cs      =       trunc(1e8);
        t       =       8;
type    big     =       array[0..1000] of int64;

var     g,f     :       text;
        a,b     :       big;
        c       :       big;
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

procedure       xuat(a:big);
var     s       :       string;
        l,i       :       longint;
begin
        l:=a[0];
        write(g,a[l]);
        for i:=l-1 downto 1 do
         begin
                str(a[i],s);
                while length(s)<t do s:='0'+s;
                write(g,s);
         end;
         writeln(g);
end;
procedure       khoitao(var a:big;s:ansistring);
var    i,l,j      :       longint;
        stg     :       string;
begin
        l:=length(s);
        j:=0;
        stg:='';
        for i:=l downto 1 do
         begin
          inc(j);
          stg:=s[i]+stg;
          if j=t then
           begin
                inc(a[0]);
                val(stg,a[a[0]]);
                stg:='';
                j:=0;
           end;
          end;
          if j>0 then begin inc(a[0]);val(stg,a[a[0]]) end;
end;


function       add(a,b:big):big;
var     nho,s  :        int64;
        l,i       :       longint;
        c      :        big;
begin
        fillchar(c,sizeof(c),0);
        l:=max(a[0],b[0]);
        nho:=0;
        for i:=1 to l do
         begin
                s:=a[i]+b[i]+nho;
                c[i]:=s mod cs;
                nho:=s div cs;
         end;
         while nho>0 do
          begin
           inc(l);
           c[l]:=nho mod cs;
           nho:=nho div cs;
          end;
          c[0]:=l;
          exit(c);
end;
function        nhan(a:big;b:int64):big;
var     nho,s   :       int64;
        l,i       :       longint;
        c       :       big;
begin
        fillchar(c,sizeof(c),0);
        nho:=0;
        l:=a[0];
        for i:=1 to l do
         begin
                s:=a[i]*b+nho;
                c[i]:=s mod cs;
                nho:=s div cs;
         end;
         while nho>0 do
          begin
                inc(l);
                c[l]:=nho mod cs;
                nho:=nho div cs;
          end;
          c[0]:=l;
        exit(c);
end;
function        sub(a,b:big):big;
var     c       :       big;
        i,l     :       longint;
        nho,s     :       int64;
begin
        fillchar(c,sizeof(c),0);
        nho:=0;
        l:=max(a[0],b[0]);
        for i:=1 to l do
         begin
                s:=a[i]-b[i]-nho;
                if s<0 then
                 begin
                        nho:=1;
                        c[i]:=cs+s;
                 end
                 else
                  begin
                        nho:=0;
                        c[i]:=s;
                  end
         end;
         while c[l]=0 do dec(l);
         c[0]:=l;
         exit(c);
end;
procedure       xuly;
var     i,j     :       longint;
        s       :       ansistring;
begin
        readln(f,s);
        khoitao(a,s);
        readln(f,s);
        khoitao(b,s);
        c:=add(a,b);
        xuat(c);
        c:=sub(a,b);
        xuat(c);
        readln(f,j);
        c:=nhan(a,j);
        xuat(c);
end;
begin
        mo;
        xuly;
        dong;
end.
