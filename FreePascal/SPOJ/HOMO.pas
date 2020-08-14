const   finp    =       'HOMO.INP';
        fout    =       'HOMO.OUT';
        maxn    =       100003;

type    bg      =       record
        gt,cs    :       longint;
        end;
var     g,f     :       text;
        ts,dd      :       array[1..maxn] of longint;
        a       :       array[0..maxn] of bg;
        tt      :       array[1..maxn] of longint;
        n       :longint;

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
procedure       cb(s:string;i:longint);
var           j :       longint;
              s1:       string;
              am        :       boolean;
begin
        s1:='';
        am:=false;
        if s[1]='i' then tt[i]:=1
        else tt[i]:=2;

        j:=8;
        if s[j]='-' then
        begin
        inc(j);
        am:=true;
        end;
        while (s[j]<='9')and(s[j]>='0') do
                begin
                        s1:=s1+s[j];
                        inc(j);
                end;
        val(s1,a[i].gt);
        if am then a[i].gt:=-a[i].gt;
        a[i].cs:=i;
end;
procedure       doc;
var     i:      longint;
        s       :       string;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        readln(f,s);
                        cb(s,i);
                end;
end;
procedure       QS(l,h  :       longint);
var     i,j,x        :       longint;
        tg      :    bg;
begin
        i:=l;
        j:=h;
        x:=a[(l+h) div 2].gt;
        repeat
                while a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j  then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                inc(i);
                                dec(j);
                        end;
        until           i>J;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       kt;
var     k,j,i       :       longint;
begin
        QS(1,n);
        k:=1;
        a[0].gt:=a[1].gt;
        for i:=1 to n do
        begin
                if a[i].gt=a[i-1].gt then ts[a[i].cs]:=k
                else
                        begin
                                inc(k);
                                ts[a[i].cs]:=k;
                        end;
        end;
end;
procedure       xuly;
var     i,j,sl     :       longint;
        gi :       longint;
        kh :       longint;
begin
        kt;
        sl:=0;
        gi:=0;
        kh:=0;
        for i:=1 to n do
              begin
                if tt[i]=1 then
                        begin
                                gi:=gi+dd[ts[i]];
                                kh:=kh+sl-(dd[ts[i]]);
                                inc(sl);
                                inc(dd[ts[i]]);
                        end
                else
                        if dd[ts[i]]>0 then
                        begin
                                gi:=gi-dd[ts[i]]-1;
                                kh:=kh-(sl-dd[ts[i]]);
                                dec(sl);
                                dec(dd[ts[i]]);
                        end;
                if (gi>=1)and (kh>=1) then writeln(g,'both')
                else if (gi>=1) then writeln(g,'homo')
                else if kh>=1 then writeln(g,'hetero')
                else writeln(g,'neither');
              end;
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
