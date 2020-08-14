uses    math;
const   finp    =       '';
        fout    =       '';
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        n,m,kq,k     :       longint;
        s       :    ansistring;
        st,luu      :    array[1..100000] of longint;
        top     :    longint;
        kt      :    array['('..')'] of longint;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       xuly;
var     i,j,sl     :       longint;
begin
        read(f,s);
        kt['(']:=1;
        kt[')']:=-1;
        n:=length(s);
        top:=0;
        sl:=0;
        for i:=1 to n do
          begin
          if s[i]='#' then
           begin
            inc(m);

            if (sl=0)and(top=0) then begin writeln(g,-1);exit end;
            if sl=0 then
             begin
               dec(luu[st[top]]);
                if luu[st[top]]=1 then dec(top);
                sl:=1;
             end;
             luu[m]:=sl;
            if luu[m]>1 then
             begin
              inc(top);
              st[top]:=m;
             end;
            sl:=0;
           end
          else
           begin
             sl:=sl+kt[s[i]];
             if sl<0 then
              begin
                if top=0 then begin writeln(g,-1);exit end;
                dec(luu[st[top]]);
                if luu[st[top]]=1 then dec(top);
                sl:=0;
              end;
           end;
           end;
           if sl>0 then writeln(g,-1)
           else
           for i:=1 to m do writeln(g,luu[i]);
end;
begin
        mo;
        xuly;
        dong;
end.