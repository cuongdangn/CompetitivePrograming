const   finp    =       'NUMBER.INP';
        fout    =       'NUMBER.OUT';
type        bignum  =       ansistring;
var     g,f     :       text;
        n       :       longint;
        kq      :       bignum;
        maxn    :       longint;
        maxx    :       bignum;

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
function        min(a,b:bignum):bignum;
begin
        if length(a)>length(b) then exit(b);
        if length(a)<length(b) then exit(a);
        if a>b then exit(b)
        else exit(a);
end;
function bigDiv1(a:bigNum;b:longint):bigNum;
var     s,i,hold:longint;
        c:bigNum;
begin
        hold:=0;s:=0; c:='';
        for i:=1 to length(a) do
        begin
                hold:=hold*10 + ord(a[i])-48;
                s:=hold div b;
                hold:=hold mod b;
                c:=c+chr(s+48);
        end;
        while (length(c)>1) and(c[1]='0') do
        delete(c,1,1);
        bigDiv1:=c;
end;
procedure       xuly;
var     i,j,du,n1     :       longint;
        t       :  bignum;
begin

        kq:=maxx;
        maxn:=n;
        for i:=1 to 9 do
         if n mod i=0 then
         begin
          du:=0;
          t:='';
          n1:=n div i;
          for j:=1 to maxn+1 do
          begin
          t:=t+'1';
          du:=(du*10+1)mod n1;
           if du=0 then
            begin
             kq:=min(kq,bigdiv1(t,n1));
             maxn:=j;
             break;
            end;
          end;
        end;
        if kq=maxx then writeln(g,-1) else writeln(g,kq);
end;
procedure       doc;
var     i       :       longint;
begin
         for i:=1 to 1000001 do
         maxx:=maxx+'1';
       while not seekeof(f) do
       begin
        readln(f,n);
        xuly;
       end;
end;
begin
        mo;
        doc;
        dong;
end.
