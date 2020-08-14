const   finp    =       '';
        fout    =       '';
                //meo.out
var     g,f     :       text;
        n,k,m     :       longint;
        d,c,tr       :       array[0..2186] of longint;
        ch      :       array['A'..'Z'] of byte;
        kq      :       array['0'..'2'] of char;
        lt      :       array[0..10] of longint;
        ch1     :       array[0..729] of string;
        a,s       :       array[1..100000] of longint;
        s1:ansistring;
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
function        chuyen(i:longint):string;
var     s       :       string;
begin
        s:='';
        if i=0 then exit('0000000');
        while i<>0 do
         begin
                s:=s+char(i mod 3+48);
                i:=i div 3;
         end;
         while length(s)<7 do s:=s+'0';
         exit(s);
end;
function        tinh(s:string):string;
var     i       :longint;
begin
        for i:=1 to 6 do
                if s[i]<>s[i+1] then
                 begin
                        s[i]:=char(3-ord(s[i])+48-ord(s[i+1])+48+48);
                        s[i+1]:=s[i];
                 end;
                exit(s);
end;
procedure       kt;
var     i,j,t       :       longint;
        s,s1       : string;
begin
        ch['R']:=0;
        ch['G']:=1;
        ch['W']:=2;
        kq['1']:='G';
        kq['0']:='R';
        kq['2']:='W';
        lt[0]:=1;
        lt[1]:=3;
        lt[2]:=9;
        lt[3]:=27;
        lt[4]:=81;
        lt[5]:=243;
        lt[6]:=729;
        for i:=0 to 2186 do
         begin
                s:=chuyen(i);
                s1:=tinh(s);
                t:=0;
                for j:=1 to 6 do
                t:=t+(ord(s1[j])-48)*lt[j-1];
                d[i]:=t;
                c[i]:=ord(s1[7])-48;
                tr[t]:=ord(s1[1])-48;
                ch1[t]:=kq[s1[1]]+kq[s1[2]]+kq[s1[3]]+kq[s1[4]]+kq[s1[5]]+kq[s1[6]];
         end;
end;
procedure       xuly;
var     i,j,j1,t       :       longint;
begin

        read(f,s1);
        j:=0;
        for i:=1 to n do
        begin
        s[i]:=ch[s1[i]];
        s1[i]:=char(ch[s1[i]]+48);

        end;
        s[n+1]:=s[1];
        i:=1;
        while i+5<=n  do
         begin
           inc(j);
           for t:=0 to 5 do
           a[j]:=a[j]+(ord(s1[i+t])-48)*lt[t];
           i:=i+6;
         end;
         m:=j;
         for i:=1 to k do
          begin
           for j:=1 to m-1 do
            begin
             t:=tr[a[j+1]]*729+a[j];

             a[j]:=d[t];
             a[j+1]:=a[j+1]-tr[a[j+1]]+c[t];
            end;
            s[n+1]:=tr[a[1]];
            t:=a[m]+s[m*6+1]*729;
            a[m]:=d[t];
            s[m*6+1]:=c[t];

            for j:=m*6+1 to n do
              if s[j]<>s[j+1] then
                 begin
                         s[j]:=3-s[j]-s[j+1];
                         s[j+1]:=s[j];
                 end;
              a[1]:=a[1]-tr[a[1]]+s[n+1];
           end;

           for i:=1 to m do
            write(g,ch1[a[i]]);
             for j:=m*6+1 to n do write(g,kq[char(s[j]+48)]);
end;
procedure       xuly2(a,b:longint);
var     ch:char;
begin
          ch:=chr(240-(ord(s1[a])+ord(s1[b])));
          s1[a]:=ch;
          s1[b]:=s1[a];
end;
procedure       xuly1;
var     i,l,j     :       longint;

begin

        read(f,s1);
        for i:=1 to k do
                begin
                for j:=1 to n-1 do
                   begin
                   l:=j+1;
                   if s1[l]<>s1[j]  then
                   xuly2(j,l);
                   end;
               if s1[1]<>s1[n]  then
               xuly2(1,n);
                end;
         write(g,s1);
end;
begin
        mo;
        kt;
        readln(f,n,k);
        if n<=6 then xuly1 else xuly;
        dong;
end.
