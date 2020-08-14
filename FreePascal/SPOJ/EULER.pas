const   finp    =       'DNC.INP';
        fout    =       '';
type    node    =       ^re;
        re      =       record
        c       :       longint;
        next    :       node;
        end;
        bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        dau,n,m :       longint;
        ke      :       array[1..200] of node;
        st,luu  :       array[1..400] of longint;
        dd      :       array[1..400] of boolean;
        e       :       array[1..400] of bg;
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
procedure       nap(var ke:node;u:longint);
var     p       :       node;
begin
        new(p);
        p^.c:=u;
        p^.next:=ke;
        ke:=p;
end;
procedure       doc;
var     i,j:    longint;
begin
        readln(f,n,m);
        for i:=1 to n do readln(f);
        for i:=1 to m do
         begin
          readln(f,e[i].x,e[i].y);
          nap(ke[e[i].x],i);
          nap(ke[e[i].y],i);
         end;
end;
procedure       xuly;
var     i,j,u     :       longint;
        p       : node;
begin
        st[1]:=1;
        dau:=1;
        j:=m;
        fillchar(dd,sizeof(dd),false);
        repeat
         u:=st[dau];
         p:=ke[u];
         while (p<>nil)and(dd[p^.c]) do p:=p^.next;
         ke[u]:=p;
         if p<>nil then
          begin
            inc(dau);
            st[dau]:=e[p^.c].y+e[p^.c].x-u;
            dd[p^.c]:=true;
          end
         else
          begin
                luu[m+1]:=u;
                dec(dau);
                dec(m);
          end;
         until dau=0;
         writeln(g,j);
         for i:=j+1 downto 1 do write(g,luu[i],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.