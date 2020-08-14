const   finp    =       'Palinn.inp';
        fout    =       'Palinn.out';
var     g,f     :       text;
        n,m     :       byte;
        k       :       qword;
        d       :       array[1..41,0..101] of int64;
        res     :       array[1..41] of byte;

        lt      :       array[0..40] of int64;

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
procedure      doc;
var         i:longint;
begin
        readln(f,n,m);
        readln(f,k);
        lt[0]:=1;
        for  i:=1 to n do lt[i]:=(lt[i-1]*10) mod m;
end;
procedure       xuat;
var     i       :longint;
begin
        for i:=1 to (n div 2) do
                res[n+1-i]:=res[i];
        for i:=1 to n do write(g,res[i]);
end;

function        tinh(i,j:longint):int64;
var             s:int64;
                k,h:longint;
begin
        if d[i,j]<>-1  then exit(d[i,j]);
        if i > n div 2 then
                begin
                        if n mod 2=1 then
                                begin
                                s:=0;
                                for k:=0 to 9 do
                                 if (j+k*lt[i-1]) mod m=0 then inc(s);
                                 d[i,j]:=s;
                                 exit(s);
                                end
                        else if j=0 then
                        begin
                        d[i,j]:=1;
                        exit(1)
                        end
                        else
                        begin
                        d[i,j]:=0;
                        exit(0);
                        end
                end;
        s:=0;
        if i=1 then k:=1 else k:=0;
        for h:=k to 9 do s:=s+tinh(i+1,(j+h*lt[n-i]+h*lt[i-1])mod m);
        d[i,j]:=s;
        exit(s);
end;
procedure        vt(i,j:longint);
var      h,h1:byte;
begin
         if i> n div 2 then
                begin
                      if n mod 2=1 then
                                begin
                                for h:=0 to 9 do
                                 if (j+h*lt[i-1]) mod m=0 then
                                 begin
                                 if k>1 then k:=k-1
                                 else
                                        begin
                                                res[i]:=h;
                                                xuat;
                                                dong;
                                                halt;
                                        end;

                                end
                                end
                        else if (j=0)and(k=1) then
                        begin
                                xuat;
                                dong;
                                halt;
                        end;
                      end;
         if i=1 then h1:=1 else h1:=0;
         for h:=h1 to 9 do
                if k>d[i+1,(j+h*lt[n-i]+h*lt[i-1])mod m] then k:=k-d[i+1,(j+h*lt[n-i]+h*lt[i-1])mod m]
                else
                begin
                     res[i]:=h;
                     vt(i+1,(j+h*lt[n-i]+h*lt[i-1])mod m);
                     break;
                end;
end;
begin
        mo;
        doc;
        fillchar(d,sizeof(d),255);
        writeln(g,tinh(1,0));
        vt(1,0);
        dong;
end.
