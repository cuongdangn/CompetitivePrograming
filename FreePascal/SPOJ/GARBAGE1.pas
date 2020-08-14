uses    math;
const   finp    =       'GARBAGE.INP';
        fout    =       'GARBAGE.OUT';
          cs      =       100000000;
type    big  =       array[0..1000] of int64;

var     g,f     :       text;
        b       :       array['A'..'Z'] of longint;
        a       :       array[1..6] of string;
        dd      :       array[1..6] of big;
        d       :       array[1..100,1..6] of big;
        res1     :       big;
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
var     i:      longint;
begin
        for i:=1 to 6 do
             begin
                readln(f,a[i]);
                dd[i][0]:=1;
                dd[i][1]:=length(a[i]);
             end;
        b['N']:=1;
        b['S']:=2;
        b['W']:=3;
        b['E']:=4;
        b['U']:=5;
        b['D']:=6;
end;
function        add(a,b:big):big;
var     c       :big;
        i:longint;
        t,du       :       int64;
begin
        du:=0;
        fillchar(c,sizeof(c),0);
        c[0]:=max(a[0],b[0]);
        for i:=1 to c[0] do
         begin
          t:=a[i]+b[i]+du;
          c[i]:=t mod cs;
          du:=t div cs;
         end;
         if du>0 then
          begin
                inc(c[0]);
                c[c[0]]:=du;
          end;
          exit(c);
end;
function       DQ(i,j:longint):big;
var     k:longint;
        res,c     :       big;
begin
        if d[i,j][1]<>-1 then exit(d[i,j]);
        if i=1 then exit(dd[j]);
        res[0]:=1;
        res[1]:=0;
        fillchar(res,sizeof(res),0);
        for k:=1 to length(a[j]) do
             begin
              c:=DQ(i-1,b[a[j][k]]);
              res:=add(res,c);
              res:=add(res,res1);
             end;
        d[i,j]:=res;
        exit(res);
end;
procedure       xuly;
var     i,j       :       longint;
        c       :       char;
       aa       :       big;
       s        :       string;
begin
        for i:=1 to 100 do
         for j:=1 to 6 do
          begin
           d[i,j][0]:=1;
           d[i,j][1]:=-1;
          end;
        readln(f,c,i);
        res1[0]:=1;
        res1[1]:=1;
        if i=1 then
              begin
                writeln(g,1);
                exit;
               end
                else aa:=DQ(i-1,b[c]);
        aa:=add(aa,res1);
        write(g,aa[aa[0]]);
        for i:=aa[0]-1 downto 1 do
                begin
                        str(aa[i],s);
                        while length(s)<8 do s:='0'+s;
                        write(g,s);
                end;

end;
begin

        mo;
        doc;
        xuly;
        dong;
end.
