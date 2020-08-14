const   finp    =       'LIST.INP';
        fout    =       'LIST.OUT';
type    bg      =       record
        tr,sa   :       longint;
        end;
        bg1     =       record
        cs,gt   :       longint;
        end;
var     g,f     :       text;
        n,m,kq  :       longint;
        ds      :       array[0..500001] of bg;
        a,tru       :       array[0..500001] of longint;
        bit     :       array[0..500001] of bg1;
        dd      :       array[0..500001] of boolean;
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
procedure       truoc(u,v:longint);
var     tg2,tg1     :       bg;
begin
        tg1:=ds[u];
        tg2:=ds[v];
        ds[ds[u].tr].sa:=ds[u].sa;
        ds[ds[u].sa].tr:=ds[u].tr;
        ds[ds[v].tr].sa:=u;
        ds[u].tr:=ds[v].tr;
        ds[v].tr:=u;
        ds[u].sa:=v;
end;
procedure       sau(u,v:longint);
var     tg1,tg2 :       bg;
begin
        tg1:=ds[u];
        tg2:=ds[v];
        ds[ds[u].tr].sa:=ds[u].sa;
        ds[ds[u].sa].tr:=ds[u].tr;
        ds[ds[v].sa].tr:=u;
         ds[u].sa:=ds[v].sa;
        ds[v].sa:=u;
        ds[u].tr:=v;

end;
procedure       doc;
var     i,u,v     :       longint;
        c       :       char;
begin
        readln(f,n,m);
        for i:=1 to n do
         begin
                ds[i].tr:=i-1;
                ds[i].sa:=i+1;
         end;
         ds[0].sa:=1;
         ds[n+1].tr:=n;

        for i:=1 to m do
         begin
                readln(f,c,u,v);
                if c='A' then
                     truoc(u,v)
                else sau(u,v);
         end;
end;
procedure       init;
var     i,j:    longint;
begin
        i:=0;
        j:=0;
        while i<n do
         begin
           inc(i);
           a[i]:=ds[j].sa;
           j:=ds[j].sa;
         end;
end;
function        get(i:longint):bg1;
var     tg      :       bg1;
begin
        tg.cs:=0;
        tg.gt:=0;
        while i>0 do
         begin
                if tg.gt<bit[i].gt then
                        tg:=bit[i];
                i:=i-i and (-i);
         end;
        exit(tg);
end;
procedure       up(i:longint;u:bg1);
begin
        while i<=n do
         begin
                if bit[i].gt<u.gt then
                 bit[i]:=u;
                i:=i+i and (-i);
         end;
end;
procedure       xuly;
var     i,j,luu,tr     :       longint;
        tg      :       bg1;
begin
        init;
        for i:=1 to n do
         begin
                tg:=get(a[i]-1);
                tg.gt:=tg.gt+1;

                tru[i]:=tg.cs;
                  tg.cs:=i;
                if kq<tg.gt then
                  begin
                        kq:=tg.gt;
                        luu:=i;
                  end;
                up(a[i],tg);
         end;
        writeln(g,n-kq);
        fillchar(dd,sizeof(dd),false);
        while luu>0 do
         begin
                dd[a[luu]]:=true;
                luu:=tru[luu];
         end;
         tr:=1;
        { for i:=1 to n do
           if dd[i] then
            begin
                for j:=i-1 downto tr do
                        writeln(g,'A',' ',j,' ',j+1);
                tr:=i+1;
            end;
         for i:=tr to n do writeln(g,'B',' ',i,' ',i-1);    }
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.