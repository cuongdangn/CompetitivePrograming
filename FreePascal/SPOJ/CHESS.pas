const   finp    =       'CHESS.INP';
        fout    =       '';
        dk      :       array[1..8] of integer=(-1,-1,-1,0,0,1,1,1);
        ck      :       array[1..8] of integer=(-1,0,1,-1,1,-1,0,1);
        dm      :       array[1..8] of integer=(-1,-2,-2,-1,1,2,2,1);
        cm      :       array[1..8] of integer=(-2,-1,1,2,2,1,-1,-2);
var     s       :       string;
        a       :       array[1..8,1..8] of byte;
        f,g     :       text;
        n,kq       :       integer;
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
procedure       diX(h,c:longint);
var     i1,j1:longint;
begin

                                        i1:=h;
                                        j1:=c+1;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin
                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1;
                                                        j1:=j1+1;
                                                end;
                                        i1:=h+1;
                                        j1:=c;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin
                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1+1;
                                                        j1:=j1;
                                                end;
                                          i1:=h;
                                        j1:=c-1;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin
                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1;
                                                        j1:=j1-1;
                                                end;
                                          i1:=h-1;
                                        j1:=c;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin
                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1-1;
                                                        j1:=j1;
                                                end;
                                        a[h,c]:=2;
end;
procedure       dt(h,c:longint);
var     i1,j1:longint;
            begin
                                        i1:=h-1;
                                        j1:=c-1;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin
                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1-1;
                                                        j1:=j1-1;
                                                end;
                                         i1:=h-1;
                                        j1:=c+1;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin

                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1-1;
                                                        j1:=j1+1;
                                                end;
                                        i1:=h+1;
                                        j1:=c-1;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin

                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1+1;
                                                        j1:=j1-1;
                                                end;
                                         i1:=h+1;
                                        j1:=c+1;
                                        while (i1<=8)and(i1>0)and(j1>0)and(j1<=8) do
                                                begin
                                                        if a[i1,j1]=0 then a[i1,j1]:=1
                                                        else if a[i1,j1]=2 then break;
                                                        i1:=i1+1;
                                                        j1:=j1+1;
                                                end;
                                        a[h,c]:=2;
            end;
procedure   ktao;
var     i,h,c   :   longint;
begin
        h:=1;
        c:=0;
        i:=1;
        while i<=n do
        begin
                if (s[i]<='9')and(s[i]>='0') then
                begin
                c:=c+ord(s[i])-48;
                inc(i)
                end
                else if s[i]='/' then
                        begin
                                inc(i);
                                inc(h);
                                c:=0;
                        end
                else
                        begin
                                inc(c);
                                a[h,c]:=2;
                                inc(i);

                        end
        end;
end;
procedure       doc;
var     i,h,c,j,i1,j1       :       longint;

begin
        readln(f,s);
        n:=length(s);
        ktao;
        h:=1;
        c:=0;
        i:=1;
        while i<=n do
        begin
                if (s[i]<='9')and(s[i]>='0') then
                begin
                c:=c+ord(s[i])-48;
                inc(i)
                end
                else if s[i]='/' then
                        begin
                                inc(i);
                                inc(h);
                                c:=0;
                        end
                else
                        begin
                        if s[i]='p' then
                                begin
                                        inc(c);
                                        if (h+1>0)and(h+1<=8)and(c+1>0)and(1+c<=8)then
                                        if a[h+1,c+1]<=0 then
                                        a[h+1,c+1]:=1;
                                        if (h+1>0)and(h+1<=8)and(c-1>0)and(c-1<=8)then
                                        if a[h+1,c-1]<=0 then
                                        a[h+1,c-1]:=1;
                                        a[h,c]:=2;

                                        inc(i);

                                end
                                else
                        if s[i]='P' then
                                begin
                                        inc(c);
                                        if (h-1>0)and(h-1<=8)and(c+1>0)and(c+1<=8)
                                        then if a[h-1,c+1]<=0 then
                                        a[h-1,c+1]:=1;
                                         if (h-1>0)and(h-1<=8)and(c-1>0)and(c-1<=8) then
                                        if a[h-1,c-1]<=0 then
                                        a[h-1,c-1]:=1;
                                        a[h,c]:=2;

                                        inc(i);

                                end
                        else
                        if (s[i]='k')or(s[i]='K') then
                                begin
                                      inc(c);
                                      for j:=1 to 8 do
                                       if (h+dk[j]>0)and(h+dk[j]<=8)and(c+ck[j]>0)and(ck[j]+c<=8) then
                                      if a[dk[j]+h,ck[j]+c]=0 then
                                      a[dk[j]+h,ck[j]+c]:=1;
                                      a[h,c]:=2;
                                      inc(i);


                                end
                        else
                        if (s[i]='N')or(s[i]='n') then
                                begin
                                        inc(c);
                                        for j:=1 to 8 do
                                         if (h+dm[j]>0)and(h+dm[j]<=8)and(c+cm[j]>0)and(cm[j]+c<=8)
                                           then if a[dm[j]+h,cm[j]+c]=0 then
                                           a[dm[j]+h,cm[j]+c]:=1;
                                           a[h,c]:=2;
                                           inc(i);


                                end
                        else
                         if (s[i]='B')or(s[i]='b') then
                         begin
                         inc(c);
                         dt(h,c);
                         inc(i);


                         end
                         else
                                if (s[i]='r')or(s[i]='R') then
                                begin
                                inc(c);
                                dix(h,c);
                                inc(i);


                                end
                         else
                                begin
                                   inc(c);
                                   dt(h,c);
                                   dix(h,c);
                                   inc(i);

                                end;
        end;
end;
end;
procedure       xuly;
var     i,j     :       longint;
begin
        for i:=1 to 8 do for j:=1 to 8 do if a[i,j]=0 then inc(kq);
        writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.


