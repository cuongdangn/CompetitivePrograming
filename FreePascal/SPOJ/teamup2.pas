const   finp    =       'teamup.INP';
        fout    =       'teamup.OUT';
var     g,f     :       text;
        n,t1,t2,dem1,dem2,kq,dem3       :       integer;
        a       :       array[1..100,1..100] of byte;
        n1,n2,dd,bo,chuyen   :       array[1..100] of byte;

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
                        readln(f);
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
                dem1:=1;
                dem2:=1;
                exit;
              end;
         if n mod 2=0 then writeln(g,0)
         else writeln(g,1);
         dong;
         halt;
end;
procedure       kt2;
var     i,j       :longint;
begin
        kt;
        for i:=1 to n do
        if (a[i,t1]=1) and (a[i,t2]=0)and(dd[i]=0) then
                begin
                        inc(dem1);
                        n1[dem1]:=i;
                        dd[i]:=1;
                end;
        for i:=1 to n do
        if (a[i,t1]=0) and (a[i,t2]=1)and(dd[i]=0) then
                begin
                        inc(dem2);
                        n2[dem2]:=i;
                        dd[i]:=1;
                end;
        for i:=1 to dem1 do
        for j:=1 to dem1 do
                if i<>J then
                begin
                        if a[n1[i],n1[j]]=0 then
                                begin
                                        writeln(g,'No solution');
                                        dong;
                                        halt;
                                end;
                end;
        for i:=1 to dem2 do
               for j:=1 to dem2 do
                if i<>j then
                        begin
                                if a[n2[i],n2[j]]=0 then
                                begin
                                        writeln(g,'No solution');
                                        dong;
                                        halt;
                                end;
                        end;
end;
procedure       xuly;
var     i,dem,j       :longint;
        OK1,OK2,ok4,ok3 :       BOOLEAN;
begin
        kt2;
        dem:=0;
        for i:=1 to n do
          if dd[i]=0 then
                if a[i,t1]=0 then
                        begin
                         writeln(g,'No solution');
                         dong;
                         halt;
                        end
                else
                        begin
                                inc(dem);
                                chuyen[dem]:=i;

                        end;
                ok3:=true;
          while ok3 do
          begin
           ok3:=false;
           dem3:=0;
        for i:=1 to dem do
                if bo[i]=0 then
                begin
                        ok1:=true;
                        for j:=1 to dem1 do if a[n1[j],chuyen[i]]=0 then
                                begin
                                        ok1:=false;
                                        break;
                                end;
                        ok2:=true;
                        for j:=1 to dem2 do
                        if a[n2[j],chuyen[i]]=0 then
                                begin
                                        ok2:=false;
                                        break;
                                end;
                        if (not ok1) and (not ok2) then
                                begin
                                        writeln(g,'No solution');
                                        dong;
                                        halt;
                                end
                        else
                        if ok1 and ok2 then
                                begin
                                        inc(dem3);
                                end
                        else
                        if ok1  then
                                begin
                                        inc(dem1);
                                        n1[dem1]:=chuyen[i];
                                        bo[i]:=1;
                                        ok3:=true;
                                end
                        else
                                begin
                                        inc(dem2);
                                        n2[dem2]:=chuyen[i];
                                        bo[i]:=1;
                                        ok3:=true;
                                end;
                end;
        end;
        if dem3>0 then
                begin
                     while (dem1<dem2)and(dem3>0) do
                        begin
                                inc(dem1);
                                dec(dem3);
                        end;
                     while (dem1>dem2)and(dem3>0) do
                        begin
                                inc(dem2);
                                dec(dem3);
                        end;
                end;
        if dem3>0 then
                if dem3 mod 2=0 then
                        begin
                                writeln(g,0);
                                dong;
                                halt;
                        end
                else
                        begin
                                writeln(g,1);
                                dong;
                                halt;
                        end;
        writeln(g,abs(dem2-dem1));
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
