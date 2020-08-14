const   finp    =       'PAPERS.INP';
        fout    =       'PAPERS.OUT';
        base    =       trunc(1e9)+7;
var     g,f     :       text;
        n,m,k,kq   :       int64;

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
var     i,t       :       longint;
begin
        readln(f,m,n);
        for i:=1 to n do
         begin
          read(f,t);
          m:=m-t+1;
         end;
         k:=n-1;
         n:=m-1;
end;
function pow(a,t:longint):longint;
var     tmp             :               longint;
begin
        if t=1 then exit(a mod base);
        tmp:=pow(a,t div 2);
        tmp:=(int64(tmp)*tmp) mod base;
        if t mod 2=1 then
                tmp:=(int64(tmp)*a) mod base;
        exit(tmp);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        if k>n then begin writeln(g,0);exit end;
         kq:=1;
         for i:=(n-k+1) to n do kq:=(int64(kq)*int64(i))mod base;
         for i:=1 to k do
           kq:=int64(kq)*pow(i,base-2) mod base;
           writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.