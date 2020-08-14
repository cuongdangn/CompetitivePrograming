const   fi='DNC.inp';
        fo='DNC.out';
var     f,g:text;
        n:byte;
        c:integer;
        a:array[1..16] of integer;
        b:array[0..5000*16] of byte;

procedure       mo;
begin
        assign(f,fi);
        assign(g,fo);
        reset(f);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var i:byte;
begin
        readln(f,c,n);
        for i:=1 to n do readln(f,a[i]);
end;
procedure       xuly;
var i,j,max:integer;
begin
        fillchar (b,sizeof(b),0);
        b[0]:=1;
        max:=0;
        for i:=1 to n do
        begin
        for j:=max downto 0 do if b[j]=1 then b[j+a[i]]:=1;
        max:=max+a[i];
        end;
        for i:=c downto 0 do if b[i]=1 then break;
        writeln(g,i);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
