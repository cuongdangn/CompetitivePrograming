const   finp    =       '';
        fout    =       '';
var     t      :       array[0..51] of longint;
        gt     :       array['C'..'Z'] of byte;
        a       :      string; dem:longint;
        g,f     :   text;
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
procedure       xuly;
var     i,n,j       :byte;  x:byte;
begin
        readln(f,a);
        n:=length(a);
        gt['C']:=12;
        gt['H']:=1;
        gt['O']:=16; j:=1;i:=1;
        while i<= n do
        begin
                if a[i] in ['1'..'9'] then
                        begin
                        x:=ord(a[i])-48;
                        t[j]:=t[j]-gt[a[i-1]]+gt[a[i-1]]*x;
                        inc(i);
                        end
                else if a[i]='(' then
                begin
                inc(i);
                inc(j);
                end
                else if a[i]=')' then
                begin
                dec(j);
                t[j]:=t[j]+t[j+1];
                if a[i+1] in ['1'..'9'] then
                begin
                x:=ord(a[i+1])-48;
                t[j]:=t[j]+t[j+1]*x-t[j+1];
                i:=i+1;
                end;
                t[j+1]:=0;
                inc(i);
                end
                else
                begin
                t[j]:=t[j]+gt[a[i]];
                inc(i);
                end;
        end;
        writeln(g,t[j]);
end;
begin
        mo;
        xuly;
        dong;
end.


