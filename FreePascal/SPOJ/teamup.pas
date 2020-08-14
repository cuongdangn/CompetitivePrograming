uses    math;
const   finp    =       'DNC.INP';
        fout    =       'teamup.OUT';
var     g,f     :       text;
        n,t1,t2,dem1,dem2,kq       :       integer;
        a       :       array[1..100,1..100] of byte;
        n1,n2,dd,bo,chuyen1   :       array[1..100] of byte;

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
var     i,t      :        longint;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        read(f,t);
                        while t<>0 do
                        begin
                                a[i,t]:=1;
                                a[t,i]:=1;
                                read(f,t);
                        end;
                end;
end;
procedure       kt;
var     i,j       :       integer;
begin
        for i:=1 to n do
         for j:=1 to n do
         if (i<>j)and(a[i,j]=0) then
              begin
                t1:=i;
                n1[1]:=i;
                n2[1]:=j;
                t2:=j;
                dd[i]:=1;
                dd[j]:=1;
                exit;
              end;
         if n mod 2=0 then writeln(g,0)
         else writeln(g,1);
         dong;
         halt;
end;
procedure       xuly1;
var     i,dem,res,j       :       integer;
        ok      :       boolean;
        chuyen  :       array[1..100] of longint;
begin
        dem:=0;
        for i:=1 to dem1 do
        if (a[n1[i],t2]=1)and(bo[n1[i]]=0) then
                begin
                        inc(dem);
                        chuyen[dem]:=n1[i];
                end;
        res:=kq;
        for i:=1 to dem do
                begin
                        ok:=true;
                        for j:=1 to dem2 do if a[chuyen[i],n2[j]]=0 then ok:=false;
                        if ok then res:=abs(res-2);
                        kq:=min(res,kq);
                end;
end;

procedure       xuly;
var     i,j,loi,dem     :       integer;
        chuyen  :array[1..100] of byte;
        ok      :       boolean;
begin

        kt;
        dem1:=1;
        dem2:=1;
        loi:=0;
        for i:=1 to n do
         if (a[i,t1]=1)and(i<>j) then
                begin
                        inc(dem1);
                        n1[dem1]:=i;
                        dd[i]:=1;
                end;
        for i:=1 to n do
        if (a[i,t2]=1)and(i<>j)and(dd[i]=0) then
                begin
                        inc(dem2);
                        n2[dem2]:=i;
                        dd[i]:=1;
                end;
        for i:=1 to n do
        if dd[i]=0 then
                begin
                        writeln(g,'No solution');
                        dong;
                        halt;
                end;
        for i:=1 to dem1-1 do
                 if (bo[n1[i]]=0) then
                 for j:=i+1 to dem1 do
                  if bo[n1[j]]=0 then
                        begin
                                if (i<>j) and (a[n1[i],n1[j]]=0) then
                                        begin
                                                if a[t2,n1[j]]=0 then
                                                begin
                                                writeln(g,'No solution');
                                                dong;
                                                halt;
                                                end
                                                else
                                                        begin
                                                          loi:=loi+2;
                                                          chuyen[loi]:=n1[i];
                                                          chuyen[loi-1]:=n1[j];
                                                          bo[n1[i]]:=1;
                                                          bo[n2[j]]:=1;
                                                          break;
                                                        end

                                        end;
                        end;
                        dem1:=dem1-loi;
                for i:=1 to dem2-1 do
                        for j:=i+1 to dem2 do
                        if i<>j then
                        begin
                                if a[n2[i],n2[j]]=0 then
                                        begin
                                                writeln(g,'NO solution');
                                                dong;
                                                halt;
                                        end
                        end;
                dem:=0;
//////////////////////////////////////////////////////////////////////////////////////
           for i:=1 to loi do
                begin
                        ok:=true;
                        for j:=1 to dem2 do if  a[chuyen[i],n2[j]]=0 then ok:=false;
                        ok1=true;
                        for j:=1 to dem1 do
                        if (bo[n1[j]]=0)and(a[n1[j],chuyen[i]]=0 then  then ok1:=false;
                        if ok and ok1 then
                                begin
                                        inc(dem);
                                        chuyen1[dem]:=chuyen[i];
                                end
                        else if ok then
////////////////////////////////////////////////////////////////////////////
        dem1:=n-dem2;
        if dem1<=dem2 then writeln(g,dem2-dem1)
        else
        begin
                kq:=dem1-dem2;
                xuly1;
                writeln(g,kq);
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
