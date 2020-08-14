const   finp    =       '';
        fout    =       '';
type    may     =       record
        a,b,cs     :       integer;
        end;
var     g,f     :       text;
        d,n1,n2       :       array[1..10000] of may;
        t,n     :       integer;
        tt,c      :       array[1..10000] of integer;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,d[i].a);
        readln(f);
        for i:=1 to n do
        begin
                d[i].cs:=i;
                read(f,c[i]);
        end;
        readln(f);
        for i:=1 to n do
                begin
                        read(f,d[i].b);
                        d[i].a:=d[i].a+c[i];
                        d[i].b:=d[i].b+c[i];
                end;
end;
procedure       qs(l,h:longint);
var     i,j,x:longint;
        tg      :       may;
begin
        i:=l;
        j:=h;
        x:=n1[(l+h)div 2].a;
        repeat
                while x > n1[i].a do inc(i);
                while x < n1[j].a do dec(j);
                if i<=j then
                 begin
                        tg:=n1[i];
                        n1[i]:=n1[j];
                        n1[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j    ;
        if j>l then qs(l,j);
        if i<h then qs(i,h);
end;
procedure       qs1(l,h:longint);
var     i,j,x:longint;
        tg      :       may;
begin
        i:=l;
        j:=h;
        x:=n2[(l+h)div 2].b;
        repeat
                while x < n2[i].b do inc(i);
                while x > n2[j].b do dec(j);
                if i<=j then
                 begin
                        tg:=n2[i];
                        n2[i]:=n2[j];
                        n2[j]:=tg;
                        inc(i);
                        dec(j);
                 end;
        until    i>j    ;
        if j>l then qs1(l,j);
        if i<h then qs1(i,h);
end;
procedure       xuly;
var     i,cs1,cs2    :       longint;
        sa,sb,sc   :    qword;
begin
        cs1:=0;
        cs2:=0;
        for i:=1 to n do
          if d[i].a<d[i].b then
                begin
                        inc(cs1);
                        n1[cs1]:=d[i];
                end
          else
                begin
                        inc(cs2);
                        n2[cs2]:=d[i];
                end;
         if cs1>0 then qs(1,cs1);
         if cs2>0 then qs1(1,cs2);
          for i:=1 to cs1 do tt[i]:=n1[i].cs;
          for i:=1 to cs2 do
          begin
          inc(cs1);
          tt[cs1]:=n2[i].cs;
          end;

          sa:=0;
          sb:=0;
          sc:=0;
          for i:=1 to n do
           begin
                sa:=sa+d[tt[i]].a-c[tt[i]];
                if sa>=sb then sb:=sa;
                 sb:=sb+c[tt[i]];
                if sb>=sc then sc:=sb;
                sc:=sc+d[tt[i]].b-c[tt[i]];
           end;

           writeln(g,sc);
           for i:=1 to n do write(g,tt[i],' ');
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
