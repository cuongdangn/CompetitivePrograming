const   finp    =       'MEO.INP';
     	fout	=	'MEO.OUT';

var     s:ansistring;
        j,i,n,l:Longint;
        k       :longint;
        g,f	:	text;
procedure       xuly(a,b:longint);
var     ch:char;
begin
          ch:=chr(240-(ord(s[a])+ord(s[b])));
          s[a]:=ch;
          s[b]:=s[a];
end;
begin
	assign(f,finp);
	reset(f);
	assign(g,fout);
	rewrite(g);
        readln(f,n,k);
        read(f,s);
        for i:=1 to k do
                begin
                for j:=1 to n-1 do
                   begin
                   l:=j+1;
                   if s[l]<>s[j]  then
                   xuly(j,l);
                   end;
               if s[1]<>s[n]  then
               xuly(1,n);
                end;
         write(g,s);
	close(f);
	close(g);
end.


