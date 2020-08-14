uses    math;
const   finp    =       'SEQ.INP';
        fout    =       'SEQ.OUT';
var     g,f     :       text;
        n       :       longint;
        a       :       array[1..200011] of longint;
        s,max1,max11,max22,max2       :       array[0..200011] of int64;
        kq      :       int64;

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
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        max1[0]:=-maxlongint*200001;
        max1[1]:=max1[0];
        max1[2]:=max1[0];
        max11[0]:=max1[0];
        max11[1]:=max1[0];
        max11[2]:=max1[0];
        s[0]:=0;
        s[1]:=a[1];
        s[2]:=a[1]+a[2];
        for i:=3 to n do
         begin
          s[i]:=s[i-1]+a[i];
          max1[i]:=max(s[i]-s[i-3],s[i]-s[i-3]+max1[i-3]);
          max11[i]:=max(max11[i-1],max1[i]);
         end;
        /////////////////;
        max2[n+1]:=max1[0];
        max2[n]:=max1[0];
        max2[n-1]:=max1[0];
        max22[n+1]:=max1[0];
        max22[n]:=max1[0];
        max22[n-1]:=max1[0];

        for i:=n-2 downto 1 do
         begin
           max2[i]:=max(s[i+2]-s[i-1],s[i+2]-s[i-1]+max2[i+3]);
           max22[i]:=max(max22[i+1],max2[i]);
         end;
        /////////////////;
        kq:=max1[0];
        for i:=1 to n-1 do
          kq:=max(kq,max11[i]+max22[i+1]);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

