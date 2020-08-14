const   finp    =       'Bai4.inp';
        fout    =       'Bai4.out';
        mang    :       array[1..10] of char =('A','B','C','D','E','F','G','H','I','J');
var     g,f     :text;
        a       :       array[1..15,1..15] of char;
        sv,n    :       longint;
        ok1     :       boolean;
        dd,sl,res,chuaxet      :       array['A'..'J'] of byte;
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
var     i,j     :       longint;
        c       :       char;
begin
        readln(f,sv);
        readln(f,n);
        for i:=1 to n do
         begin
         for j:=1 to n do
               begin
                read(f,a[i,j]);
                if a[i,j]<>'.' then
                        inc(sl[a[i,j]]);
               end;
         readln(f);
        end;
       for c:='A' to mang[sv] do if sl[c]=0 then
                chuaxet[c]:=1;

end;
function        kt(x,y:longint;c:char):boolean;
var  i,j,dem        :longint;
begin
        dem:=0;
        if not((x+4<=n)and(y+4<=n)) then exit(false);
        for i:=x to x+4 do
         for j:=y to y+4 do
         if a[i,j]<>'.' then
           begin
           if (a[i,j]=c)or(chuaxet[a[i,j]]=1) then
           begin
           if a[i,j]=c then inc(dem);
           end
           else exit(false);
          end
          else exit(false);
         if dem<>sl[c] then exit(false);
         exit(true);
end;
procedure       truy(x,y,q:longint;c:char);
var     i,j     :       longint;
begin
        for i:=x to x+4 do
         for j:=y to y+4 do
                        if a[i,j]<>c then dd[a[i,j]]:=q;
end;
procedure       xuly1(x,y:longint;c:char);
var     i,j,q,m     :       longint;
        c1      :     char;
begin
        q:=0;
        fillchar(dd,sizeof(dd),0);
        for i:=1 to 5 do
         for j:=1 to 5 do
          begin
                if (x-i+1>0)and(y-j+1>0) then
                 if kt(x-i+1,y-j+1,c) then
                 begin
                  inc(q);
                  truy(x-i+1,y-j+1,q,c);
                 end;
          end;
          if q>0 then
                begin
                        m:=0;
                        chuaxet[c]:=1;
                        for c1:='A' to 'J' do
                         begin
                          if (dd[c1]>0)and(res[c1]=0) then
                           begin
                                 if (m<>0)and(m<>dd[c1]) then exit
                                 else if m=0 then m:=dd[c1];
                           end;
                          end;
                        for c1:='A' to 'J' do
                        if dd[c1]>0 then res[c1]:=1;
                end
          else ok1:=false;
end;
procedure       xuly;
var     i,j     :       longint;
        ok:     boolean;
        c1       :       char;
begin
        repeat
        ok:=true;
        for i:=1 to n do
         for j:=1 to n do
                if (a[i,j]<>'.') then
                 if (chuaxet[a[i,j]]=0) then
                        begin
                             ok1:=true;
                             xuly1(i,j,a[i,j]);
                             if ok1 then
                                ok:=false;
                        end;
         until ok;
         ok1:=false;
         for c1:='A' to mang[sv] do
                 if chuaxet[c1]=0 then
                        begin
                                ok1:=true;
                                break;
                        end;
                 if ok1 then write(g,'NO')
                 else
         for c1:='A' to mang[sv] do
          if res[c1]=0 then write(g,c1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
