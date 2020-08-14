uses    math;
const   finp    =       'JOURNEY.INP';
        fout    =       'JOURNEY.OUT';
var     g,f     :       text;
        di,dj   :       longint;
        s       :       ansistring;
        slu,slr,sll,sld:        longint;
        n,m     :       longint;
        ixp,jxp:        longint;
        ii,jj   :       array['A'..'Z'] of longint;
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
begin
        readln(f,di,dj);
        readln(f,s);
end;
procedure       xuly;
var     i,j,jj1    :       longint;
begin
        n:=length(s);
        ii['L']:=-1;
        ii['R']:=1;
        jj['U']:=1;
        jj['D']:=-1;
        for i:=1 to n do
        if s[i]<>'?' then
         begin
          ixp:=ixp+ii[s[i]];
          jxp:=jxp+jj[s[i]];
         end
         else inc(m);
         if ixp<=di then
          begin
           slr:=di-ixp;
           sll:=0;
          end
          else
           begin
            sll:=ixp-di;
            slr:=0;
           end;
          m:=m-max(sll,slr);
          ///////////////////////
          sld:=-1;
          for i:=m downto 0 do
         begin
           jj1:=jxp-i;
           if jj1<=dj then
           if i+dj-jj1=m then
           begin
            sld:=i;
            slu:=dj-jj1;
           end;
         end;
         if sld=-1 then begin writeln(g,'IMPOSSIBLE');exit end;

         for i:=1 to n do
          if s[i]='?' then
          begin
           if sld>0 then
            begin s[i]:='D';dec(sld) end
            else
             if sll>0 then
              begin
               s[i]:='L';
               dec(sll);
              end
             else
             if slr>0 then
              begin
               s[i]:='R';
               dec(slr);
              end
             else
              begin
               s[i]:='U';
               dec(slu);
              end;
          end;
          writeln(g,s);

end;
begin
        mo;
        doc;
        xuly;
        dong;
end.