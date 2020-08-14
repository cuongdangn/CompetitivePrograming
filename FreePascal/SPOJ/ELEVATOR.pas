const   finp    =       '';
        fout    =       '';
type    bg      =       record
        h,a,c   :       longint;
        end;
var     g,f:    text;
        d,dd    :       array[0..41000] of boolean;
        a1      :array[0..410] of bg;
        n       :       longint;
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
        readln(f,n);
        for i:=1 to n do
        readln(f,a1[i].h,a1[i].a,a1[i].c);
end;

procedure       QS(l,h:longint);
var     i,j,x:longint;
        tg      :bg;
begin
        i:=l;
        j:=h;
        x:=a1[(l+h) div 2].a;
        repeat
                while a1[i].a<x do inc(i);
                while a1[j].a>x do dec(j);
                if i<=j then
                        begin
                                tg:=a1[i];
                                a1[i]:=a1[j];
                                a1[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until     i>j;
if i<h then QS(i,h);
if j>l then QS(l,j);
end;
procedure       xuly;
var     i,j,k       :       longint;
begin
        QS(1,n);

        for i:=1 to a1[1].c do
            if a1[1].h*i<=a1[1].a then d[a1[1].h*i]:=true;

        for i:=2 to n do
         begin
                for j:=1 to a1[i-1].a do  dd[j]:=false;
                for j:=1 to a1[i].a do
                        begin
                                dd[j]:=d[j];
                                if not dd[j] then
                                for k:=1 to a1[i].c do
                                        begin
                                             if a1[i].h*k=j then dd[j]:=true
                                             else
                                             if j>a1[i].h*k then
                                             dd[j]:=d[j-a1[i].h*k] ;
                                             if dd[j] then break;
                                        end;
                        end;
                d:=dd;
         end;
      for i:=a1[n].a downto 1 do
       if dd[i] then
        begin
                writeln(g,i);
                exit;
        end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
