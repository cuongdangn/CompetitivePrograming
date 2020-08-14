const   finp    =       'DNC.INP';
        fout    =       'DNC.OUT';
var      g,f     :       text;
         ss     :       array[1..6,1..24] of longint;
         tt     :       array[1..24,1..2] of byte;
         ss1    :       array[1..4,1..6] of  longint;
         tt1,dd    :       array[1..4] of byte;
         tong,t,kq,tong1,ktra   :       int64;
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
var     i:longint;
begin
        for i:=1 to 4 do
         begin
         readln(f,ss1[i,1],ss1[i,6],ss1[i,3],ss1[i,4],ss1[i,2],ss1[i,5]);
         t:=t+ss1[i,1]+ss1[i,6]+ss1[i,3]+ss1[i,4]+ss1[i,2]+ss1[i,5];
         end;
end;
procedure       kt;
var     i,j,dem:byte;
begin
        dem:=0;
        for i:=1 to 6 do
                for j:=1 to 6 do
                        if (i<>J)and((j+i)<>7) then
                                begin
                                        inc(dem);
                                        tt[dem,1]:=i;
                                        tt[dem,2]:=j;
                                end;
end;

procedure       duyet(i,j:longint);
var     x       :longint;
begin
        for x:=1 to 24 do
                begin
                        if i=1 then
                                        if ss1[tt1[i],tt[j,2]]=ss1[tt1[i+1],7-tt[x,2]] then
                                                        duyet(i+1,x);

                        if i=2 then
                                        if ss1[tt1[i],tt[j,1]]=ss1[tt1[i+1],7-tt[x,1]] then
                                                        begin
                                                        tong1:=ss1[tt1[i+1],7-tt[x,1]]+ss1[tt1[i+1],7-tt[x,2]];
                                                        duyet(i+1,x);

                                                        end;

                        if i=3 then
                                        if (ss1[tt1[i],7-tt[j,2]]=ss1[tt1[i+1],tt[x,2]]) and (tong-ss1[tt1[i+1],7-tt[x,1]]=ktra) then
                                                begin
                                                        if kq>tong+tong1 then kq:=tong+tong1;
                                                end;
                end;
end;
procedure       xuly1;
var     i:longint;
begin
        for i:=1 to 24 do
        begin

        tong:=ss1[tt1[1],tt[i,1]]+ss1[tt1[1],tt[i,2]];
        ktra:=ss1[tt1[1],tt[i,2]];
        duyet(1,i);
        end;

end;
procedure       duyet1(i:longint);
var     j:byte;
begin
        for j:=1 to 4 do
                if dd[j]=0 then
                        begin
                                dd[j]:=1;
                                tt1[i]:=j;
                                if i=4 then xuly1
                                else
                                duyet1(i+1);
                                dd[j]:=0;
                        end;
end;
begin
        mo;
        doc;
        kt;
        kq:=maxlongint;
        duyet1(1);
        if kq=maxlongint then writeln(g,-1) else writeln(g,t-2*kq);
        dong;
end.
