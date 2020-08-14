const   finp    =       '';fout    =       '';
var     g,f     :       text;
        s,m     :       longint;
        maxxx   :       string;
        d1,d    :       array[0..101,0..900] of string;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,m,s);
        if (9*m<s) then
         begin
          writeln(g,-1,' ',-1);
          dong;
          halt;
         end;
end;

function        maxx(a,b:string):string;
begin
 if length(a)<length(b) then exit(b);
 if length(b)<length(a) then exit(a);
 if a<b then exit(b)
 else exit(a);
end;
function        minn(a,b:string):string;
begin
 if length(a)<length(b) then exit(a);
 if length(b)<length(a) then exit(b);
 if a<b then exit(a)
 else exit(b);
end;
procedure       xuly;
var     i,j     :       longint;
        dau,c       :       char;
begin
 if s=0 then
  begin
   if m>1 then begin writeln(g,-1,' ',-1); exit end;
   writeln(g,0,' ',0);
   exit;
  end;
 for i:=1 to m+1 do maxxx:=maxxx+'9';
 for i:=0 to m do
 for j:=0 to s do
  begin
   d[i,j]:=maxxx;
   d1[i,j]:='';
  end;
  d[0,0]:='';
  d1[0,0]:='';
        for i:=1 to m do
         begin
          if i=1 then dau:='1' else
           dau:='0';
          for c:=dau to '9' do
           begin
            for j:=0 to s-ord(c)+48 do
             begin
             d[i,j+ord(c)-48]:=minn(d[i,j+ord(c)-48],d[i-1,j]+c);
             d1[i,j+ord(c)-48]:=maxx(d1[i,j+ord(c)-48],d1[i-1,j]+c);
             end;
            end;
          end;
          writeln(g,d[m,s],' ',d1[m,s]);
end;
begin
        mo;doc;
        xuly;dong;
end.

