const           fi='DNC.inp';
                fo='';
var
                f,g:text;
                s:string;
                k:longint;
procedure       mo;
begin
                assign(f,fi);
                assign(g,fo);
                reset(f);
                rewrite(g);
end;
procedure       doc;
begin
                readln(f,k);
                readln(f,s);
end;
procedure       xuly;
var
                i,dem,max,vt,m:longint;
                c:string;
begin

                c:='';
                max:=-1;
                dem:=0;
                m:=k;
                while (k>=0) and (dem<>m)do
                        begin
                                max:=0;
                                for i:=1 to k+1 do

                                       begin
                                                if ord(s[i])-48>max then
                                                        begin
                                                                max:=ord(s[i])-48;
                                                                vt:=i;
                                                        end;
                                       end;
                                                c:=c+s[vt];
                                                delete(s,1,vt);
                                                dem:=dem+1;
                                                k:=k-(vt-1);
                        end;

                if (dem=m)and (k=0) then c:=c+s;
                writeln(g,c);
end;
begin
                mo;
                doc;
                xuly;
                close(f);
                close(g);
end.
