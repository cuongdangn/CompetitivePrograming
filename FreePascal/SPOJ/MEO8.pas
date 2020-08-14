const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,k,n1     :       longint;
        s       :       ansistring;
        b       :       array[1..10000] of byte;
        lt      :       array[0..5] of byte;
        dau:       array[0..243] of byte;
        kt      :  array[0..2] of char;
        noi1    :  array[0..2,0..2] of byte;
        cuoi,vt1       :    array[0..2,0..243] of byte;
        a       :       array[0..1,0..2100] of byte;
        c       :       array[0..243,0..2,0..3] of byte;
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
        readln(f,n,k);
        read(f,s);
end;
function        sosangx(i:longint):string;
var     s1      :       string;
        t       :       longint;
begin
        s1:='';
        repeat
           t:=i mod 3;
           s1:=char(t+48)+s1;
           i:=i div 3;
        until i=0;
        while length(s1)<5 do s1:='0'+s1;
        exit(s1);
end;
function        xausangs(s1:string):longint;
var     t,i       :       longint;
begin
        t:=0;
        for i:=1 to 5 do
             t:=t+(ord(s1[i])-48)*lt[5-i];
             exit(t);
end;

function        noi(var t,t1:longint;var s3:string;s1:string):string;
var     i       :       longint;
        ch      :       char;
begin
        for i:=1 to 6 do
        begin
         if i=6 then
         begin
         t:=ord(s1[i])-48;
         s3:=copy(s1,2,5);
         end;
         if i=2 then t1:=ord(s1[1])-48;
        if s1[i]<>s1[i+1] then
        begin
          ch:=chr(3-(ord(s1[i])-48+ord(s1[i+1])-48)+48);
          s1[i]:=ch;
          s1[i+1]:=s1[i];
        end;
        end;
        exit(s1);
end;
procedure       ktao;
var     i,j,j1,t,t1     :       longint;
        s1,s2,s3      :       string;
        ch      :  char;
begin
         for i:=1 to n do
         if s[i]='R' then
          begin
          b[i]:=0;
          s[i]:='0';
          end
         else if s[i]='G' then
         begin
         b[i]:=1;
         s[i]:='1';
         end
         else
         begin
         b[i]:=2;
         s[i]:='2';
         end;
         kt[0]:='R';
         kt[1]:='G';
         kt[2]:='W';
        lt[0]:=1;
        for i:=1 to 5 do lt[i]:=lt[i-1]*3;

        for i:=0 to 242 do
         begin
                s1:=sosangx(i);
                dau[i]:=ord(s1[1])-48;
                for j:=0 to 2 do
                 for j1:=0 to 2 do
                  begin
                      s2:=chr(j+48)+s1+chr(j1+48);
                      s2:=noi(t,t1,s3,s2);
                      cuoi[j,i]:=t;
                      vt1[j,i]:=t1;
                      s2:=copy(s2,2,5);
                      t:=xausangs(s2);
                      c[i,j,j1]:=t;
                      t:=xausangs(s3);
                      c[i,j,3]:=t;
                  end;
         end;
        i:=2;j:=0;
        while n-i>4 do
         begin
                s1:=copy(s,i,i+4);
                inc(j);
                a[0,j]:=xausangs(s1);
                i:=i+5;
         end;
         n1:=j;
        if n mod 5=0 then
         begin
          s1:=copy(s,n-3,n)+s[1];
          a[0,n1+1]:=xausangs(s1);
             n1:=n1+1;
         end;
         for i:=0 to 2 do
          for j:=0 to 2 do
          if i<>j then
           noi1[i,j]:=3-i-j
           else noi1[i,j]:=i;

end;

procedure       xuly;
var     i,j,t,l     :       longint;
        ch      :       char;
        s1:      string;
begin
         l:=0;
        for j:=1 to k do
         begin
         t:=b[1];
         b[1]:=vt1[t,a[l,1]];
            for i:=1 to n1-1 do
             begin
              a[1-l,i]:=c[a[l,i]][t][dau[a[l,i+1]]];
              t:=cuoi[t,a[l,i]]
             end;
             a[1-l,n1]:=c[a[l,n1]][t][b[n1*5+2]];
              t:=cuoi[t,a[l,n1]];
              b[n1*5+2]:=noi1[b[n1*5+2],t];
       for i:=n1*5+2 to n-1 do
        begin
          b[i]:=noi1[b[i],b[i+1]];
          b[i+1]:=b[i];
        end;
          b[1]:=noi1[b[n],b[1]];
          b[n]:=b[1];
           l:=1-l;
        end;
      if n>5 then  write(g,kt[b[1]]);
        for i:=1 to n1 do
         begin
          s1:=sosangx(a[l,i]);
          for j:=1 to length(s1) do write(g,kt[ord(s1[j])-48]);
         end;
         for i:=n1*5+2 to n do write(g,kt[b[i]]);
end;

procedure       xuly3;
var     i,j,t,l,t1     :       longint;
        ch      :       char;
        s1:      string;
begin
         l:=0;
         t:=ord(s[1])-48;
        for j:=1 to k do
         begin
         t1:=vt1[t,a[l,1]];
            for i:=1 to n1-1 do
             begin
              a[1-l,i]:=c[a[l,i]][t][dau[a[l,i+1]]];
              t:=cuoi[t,a[l,i]]
             end;
             a[l,n1]:=a[l,n1]-a[l,n1]mod 3+t1;
             a[1-l,n1]:=c[a[l,n1]][t][3];
              t:=a[1-l,n1] mod 3;
           l:=1-l;
        end;
        s1:=sosangx(a[l,n1]);
        write(g,kt[ord(s1[5])-48]);
        for i:=1 to n1 do
         begin
          s1:=sosangx(a[l,i]);
          if i=n1 then t:=4 else t:=5;
          for j:=1 to t do write(g,kt[ord(s1[j])-48]);
         end;
end;

procedure       xuly2(a,b:longint);
var     ch:char;
begin
          ch:=chr(240-(ord(s[a])+ord(s[b])));
          s[a]:=ch;
          s[b]:=s[a];
end;
procedure       xuly1;
var     i,l,j     :       longint;

begin
        for i:=1 to k do
                begin
                for j:=1 to n-1 do
                   begin
                   l:=j+1;
                   if s[l]<>s[j]  then
                   xuly2(j,l);
                   end;
               if s[1]<>s[n]  then
               xuly2(1,n);
                end;
         write(g,s);
end;
begin
        mo;
        doc;
        if n<11 then
        begin
        xuly1;
        dong;
        halt;
        end;
        ktao;
        if n mod 5=0 then xuly3 else
        xuly;
        dong;
end.
