const   finp    =       'MEO.INP';
        fout    =       'MEO.OUT';
                        //DNC.OUT
var     g,f     :       text;
        n,k     :       longint;
        s1,s2,s3   :       ansistring;
        d       :       array[0..729] of string;
        c       :       array[0..729] of char;
        ch      :       array['A'..'Z'] of byte;
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
        if i=0 then exit('000000');
        while i<>0 do
         begin
                s:=s+char(i mod 3+48);
                i:=i div 3;
         end;
         while length(s)<6 do s:=s+'0';
         exit(s);
end;
function        tinh(s:string):string;
var     i       :longint;
begin
        for i:=1 to 5 do
                if s[i]<>s[i+1] then
                 begin
                        s[i]:=char(3-ord(s[i])+48-ord(s[i+1])+48+48);
                        s[i+1]:=s[i];
                 end;
                exit(s);
end;
procedure       kt;
var     i,j       :       longint;
        s       : string;
begin
        ch['R']:=0;
        ch['G']:=1;
        ch['W']:=2;
        for i:=0 to 729 do
         begin
                s:=chuyen(i);
                d[i]:=tinh(s);
                c[i]:=d[i][6];
                delete(d[i],6,1);
         end;
end;
procedure       xuly;
var     i,j,j1,t       :       longint;
begin
        readln(f,n,k);
        read(f,s1);

        for i:=1 to n do s1[i]:=char(ch[s1[i]]+48);
        for I:=1 to k do
         begin
                j:=1;
                s2:='';
                while j+5<=n do
                begin
                        t:=(ord(s1[j])-48)+(ord(s1[j+1])-48)*3+(ord(s1[j+2])-48)*9+(ord(s1[j+3])-48)*27+(ord(s1[j+4])-48)*81+(ord(s1[j+5])-48)*243;
                        s2:=s2+d[t];
                        s1[j+5]:=c[t];
                        j:=j+5;
                end;
                s1[1]:=s2[1];
                for j1:=j to n-1 do
                 if s1[j1]<>s1[j1+1] then
                 begin
                         s1[j1]:=char(3-ord(s1[j1])+48-ord(s1[j1+1])+48+48);
                         s1[j1+1]:=s1[j1];
                 end;
                 if s1[n]<>s1[1] then
                 begin
                        s1[n]:=char(3-ord(s1[1])+48-ord(s1[n])+48+48);
                        s1[1]:=s1[n];
                 end;
                 s2:=s2+copy(s1,j,n-j+1);
                 s2[1]:=s1[1];
                 s1:=s2;
         end;
         for i:=1 to n do
          if s1[i]='0' then write(g,'R')
          else if s1[i]='1' then write(g,'G')
          else write(g,'W');
end;
begin
        mo;
        kt;
        xuly;
        dong;
end.