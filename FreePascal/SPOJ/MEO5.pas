const   finp    =       '';
        fout    =       '';
                       //MEO.OUT
var     g,f     :       text;
        n,k,m,du     :       longint;
        lt      : array[0..10] of longint;
        d,c,tr,c1,tr1,d1       :       array[0..243] of longint;
        ch      :       array['A'..'Z'] of byte;
        kq      :       array['0'..'2'] of char;
        ch1,ch11     :       array[0..243] of string;
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

function        chuyen1(i,k:longint):string;
var     s       :       string;
        j:longint;
begin
        s:='';
        if i=0 then
         begin
          for j:=1 to k do s:=s+'0';
          exit(s);
         end;

        while i<>0 do
         begin
                s:=s+char(i mod 3+48);
                i:=i div 3;
         end;
         while length(s)<k do s:=s+'0';
         exit(s);
end;
function        tinh1(s:string;k:longint):string;
var     i       :longint;
begin
        for i:=1 to k-1 do
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
        for i:=1 to 10 do lt[i]:=lt[i-1]*3;
        for i:=0 to lt[5]-1 do
         begin
                s:=chuyen1(i,5);
                 ch1[i]:=kq[s[1]]+kq[s[2]]+kq[s[3]]+kq[s[4]]+kq[s[5]];
                  c[i]:=ord(s[5])-48;
                   tr[i]:=ord(s[1])-48;
                s1:=tinh1(s,5);
                t:=(ord(s1[1])-48)+(ord(s1[2])-48)*3+(ord(s1[3])-48)*9+(ord(s1[4])-48)*27+(ord(s1[5])-48)*81;
                d[i]:=t;

         end;
end;

procedure       kt1(k:longint);
var      i,j,t       :       longint;
        s,s1       : string;
begin
        for i:=0 to lt[k]-1 do
         begin
          s:=chuyen1(i,k);
          c1[i]:=ord(s[k])-48;
          tr1[i]:=ord(s[1])-48;
          s1:=tinh1(s,k);
          t:=0;
          for j:=1 to k do t:=t+(ord(s1[j])-48)*lt[j-1];
          d1[i]:=t;
         end;

end;
procedure       xuly6;
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
        while i+4<=n  do
         begin
           inc(j);
           a[j]:=(ord(s1[i])-48)+(ord(s1[i+1])-48)*3+(ord(s1[i+2])-48)*9+(ord(s1[i+3])-48)*27+(ord(s1[i+4])-48)*81;
           i:=i+5;
         end;
         m:=j;
         kt1(n mod 5);
         for t:=i to n  do  a[m+1]:=a[m+1]+s[t]*lt[t mod 5-1];
          du:=n mod 5;

         for i:=1 to k do
          begin
           for j:=1 to m-1 do
            begin
             a[j]:=d[a[j]];
             if c[a[j]]<>tr[a[j+1]] then
                begin
                        t:=c[a[j]]+tr[a[j+1]];
                        a[j+1]:=a[j+1]-tr[a[j+1]]+3-t;
                        a[j]:=a[j]-c[a[j]]*81+(3-t)*81;
                end;
            end;
            a[m]:=d[a[m]];

            if c[a[m]]<>tr1[a[m+1]] then
                begin
                        t:=c[a[m]]+tr1[a[m+1]];
                        a[m+1]:=a[m+1]-tr1[a[m+1]]+3-t;
                        a[m]:=a[m]-c[a[m]]*81+(3-t)*81;
                end;
            a[m+1]:=d1[a[m+1]];
               if c1[a[m+1]]<>tr[a[1]] then
                begin
                        t:=c1[a[m+1]]+tr[a[1]];
                        a[1]:=a[1]-tr[a[1]]+3-t;
                        a[m+1]:=a[m+1]-c1[a[m+1]]*lt[du-1]+(3-t)*lt[du-1];
                end;


           end;


end;
procedure       xuly5;
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
        while i+4<=n  do
         begin
           inc(j);
           a[j]:=(ord(s1[i])-48)+(ord(s1[i+1])-48)*3+(ord(s1[i+2])-48)*9+(ord(s1[i+3])-48)*27+(ord(s1[i+4])-48)*81;
           i:=i+5;
         end;

         m:=j;
         for i:=1 to k do
          begin
           for j:=1 to m-1 do
            begin
             a[j]:=d[a[j]];

             if c[a[j]]<>tr[a[j+1]] then
                begin
                        t:=c[a[j]]+tr[a[j+1]];
                        a[j+1]:=a[j+1]-tr[a[j+1]]+3-t;
                        a[j]:=a[j]-c[a[j]]*81+(3-t)*81;
                end;
            end;
            a[m]:=d[a[m]];
            if c[a[m]]<>tr[a[1]] then
                begin
                        t:=c[a[m]]+tr[a[1]];
                        a[1]:=a[1]-tr[a[1]]+3-t;
                        a[m]:=a[m]-c[a[m]]*81+(3-t)*81;
                end;
           end;


end;
procedure       xuat;
var     i,j     :       longint;
begin
 for i:=1 to m do
             write(g,ch1[a[i]]);
             s1:=chuyen1(a[m+1],du);
             for i:=1 to du do write(g,kq[s1[i]]);
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
        if n<=6 then xuly1 else
        begin
        if n mod 5=0 then xuly5 else xuly6;
        xuat;
        end;
        dong;
end.
