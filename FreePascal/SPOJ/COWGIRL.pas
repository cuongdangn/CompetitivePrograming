const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        da      :       array[0..30,0..30] of int64;
        hop     :       array[0..63,0..63] of byte;
        d       :       array[0..63,0..30] of int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
function        getbit(k,x      :       longint):byte;
begin
        getbit:=(x shr (k-1)) and 1;
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       QHD(n,m : longint);
var     i,j,x,y,tr,sa :       longint;  ok:boolean;
begin
                fillchar(hop,sizeof(hop),0);
                fillchar(da,sizeof(da),0);
                fillchar(d,sizeof(d),0);

                for i:=0 to (1 shl n)-1 do
                        for j:=0 to (1 shl n)-1 do
                                if hop[i,j]=0 then
                                begin
                                x:=i xor j; tr:=getbit(1,x);
                                ok:=true;
                                for y:=2 to n do
                                        begin
                                                sa:=getbit(y,x);
                                                if (tr=sa)and(tr=0) then
                                                        if getbit(y,i)=getbit(y-1,i) then
                                                                begin
                                                                        ok:=false;
                                                                        break;
                                                                end;
                                                tr:=sa;
                                        end;
                                if ok then
                                begin
                                hop[i,j]:=1;
                                hop[j,i]:=1;
                                end
                                 else
                                 begin
                                 hop[i,j]:=2;
                                 hop[j,i]:=2;
                                 end;
                                end;

                for i:=0 to (1 shl n) -1 do
                        d[i,1]:=1;
                for i:=2 to m do
                        for j:=0 to (1 shl n)-1 do
                         for x:=0 to (1 shl n)-1 do
                          if hop[j,x]=1 then
                                        d[j,i]:=d[j,i]+d[x,i-1];
                for i:=0 to (1 shl n)-1 do da[n,m]:=da[n,m]+d[i,m];

 writeln(g,da[n,m]);
end;
procedure       doc;
var     i,t,n,m       :       longint;
begin
        readln(f,t);
        for i:=1 to t do
         begin
                readln(f,n,m);
                if n<m then QHD(n,m) else QHD(m,n);
         end;
end;
begin
        mo;
        doc;
        dong;
end.



