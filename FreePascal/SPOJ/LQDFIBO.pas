{$MODE OBJFPC}
const
        inp = '';
        out = '';
{        max = 35;}
{**********************************************************}
var
        fi,fo : text;
        st,s1,s2 : string;
        dem,c1,c2,s : ansistring;
        n:longint;
        i,j : qword;

procedure input;
begin
        assign(fi,inp);
        reset(fi);
        readln(fi,n);
        readln(fi,s1);
        readln(fi,s2);
        read(fi,st);
        close(fi);
{        while st[1] = ' ' do delete(st,1,1);}
end;

function tinh(st1,st2 : ansistring) : integer;
var
        d1,l : integer;
begin
        d1 := 0;
        repeat
             l := pos(st1,st2);
             if l = 0 then break;
             inc(d1);
             delete(st2,1,l);
        until false;
        tinh := d1;
end;

function tong(so1,so2:string):string;
var
        m,n,tg,i,dd:integer;
        a,b,c:array[1..300] of integer;
        s,tg1:string;
begin
        m:=length(so1);     n:=length(so2);
        dd:=0;
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        fillchar(c,sizeof(c),0);
        for i:=m downto 1 do
                begin
                        inc(dd);
                        val(so1[i],a[dd]);
                end;
        dd:=0;
        for i:=n downto 1 do
                begin
                        inc(dd);
                        val(so2[i],b[dd]);
                end;

        tg:=0;
        if m>n then n:=m;

        for i:=1 to n+1 do
           if a[i]+b[i]+tg<10 then
                begin
                        c[i]:=a[i]+b[i]+tg;
                        tg:=0;
                end
           else
                begin
                        c[i]:=(a[i]+b[i]+tg) mod 10;
                        tg:=(a[i]+b[i]+tg) div 10;
                end;

        s:='';
        tg1:='';
        if c[n+1]<>0 then
                begin
                        str(c[n+1],tg1);
                        insert(tg1,s,length(s)+1);
                end;
        for i:=n downto 1 do
                begin
                        str(c[i],tg1);
                        insert(tg1,s,length(s)+1);
                end;
        tong:=s;
end;

procedure process;
var
        a,b,c : ansistring;
        t,dem1:integer;
begin
{        a := 'A';
        b := 'B';
}
        a:=s1;
        b:=s2;
        i := 2;
        repeat
                if pos(st,b) <> 0 then break;
                if i > 13 then
                      begin
                              i := 200;
                              exit;
                      end;
                inc(i);
                c := b + a;
                a := b;
                b := c;
        until false;

        dem1 := tinh(st,b);
        c := a + b;
        t := tinh(st,c) - dem1;
        if pos(st,a)<>0 then t:=t-tinh(st,a);
        str(t,c1);

{        c1 := tinh(st,c) - dem1;}

        c := b + b;
        t := tinh(st,c) -2*dem1;
        str(t,c2);

{        c2 := tinh(st,c) - 2*dem1;}

        c := b + a;
        t := tinh(st,c) - dem1;
        str(t,s);
        str(dem1,dem);
{        s := tinh(st,c) - dem1;}
end;

{****************************************************************}

procedure process2;
var
        tg,tg1 : ansistring;
        d : longint;
begin
        if n < i then
                begin
                        dem := '0';
                        exit;
                end;
        if n = i then exit;
        tg1 := dem;
        dem := tong(dem , s);

        inc(i);

        j := 1;
{tg1 la so lan xuat hien trong xau phia sau}
        for d := i+1 to n do
                begin
                        tg := tong(dem , tg1);
{tg=dem+tg1=so lan xuat hien trong xau truoc va sau, con` phan` noi'}
                        if j = 1 then
                               begin
                                        tg := tong(tg , c1);
                                        j := 2;
                               end
                               else
                               begin
                                        tg := tong(tg , c2);
                                        j := 1;
                               end;
                        tg1 := dem;{dem o? day la` dem' truoc'}
                        dem := tg;{thay doi? dem'}
                end;
end;

{*******************************************************************}

procedure output;
begin
        assign(fo,out);
        rewrite(fo);
        write(fo,dem);
        close(fo);
end;

begin
            dem:='';
            input;
            process;
            process2;
            output;
end.
