const   finp    =       '';
        fout    =       '';
        base    =       trunc(1e9)+7;
var     g,f     :       text;
        s1,s2   :       ansistring;
        n       :       longint;
        mau,kq     :       longint;
        hash    :       array[0..1000000] of longint;
        lt      :       array[0..1000000] of longint;
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
begin
        readln(f,s1);
        readln(f,s2);
end;
procedure       init;
var     i,j     :       longint;
begin
        n:=length(s2);
        mau:=0;
        for i:=1 to n do
         mau:=(int64(mau)*26 mod base+ord(s2[i])-97)mod base;
        n:=length(s1);
        for i:=1 to n do
         hash[i]:=(int64(hash[i-1])*26 mod base+ord(s1[i])-97) mod base;
         lt[0]:=1;
        for i:=1 to n do lt[i]:=int64(lt[i-1])*26 mod base;
end;
function        tinh(i,j:longint):longint;
var     tg      :longint;
begin
        tg:=((int64(hash[j])+(base-int64(hash[i-1])*int64(lt[j-i+1]) mod base))mod base);
        exit(tg);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        init;
        for i:=1 to n-length(s2)+1 do
                if mau=tinh(i,i+length(s2)-1) then write(g,i,' ');
       // writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.