const   finp    =       'EQUATION.INP';
        fout    =       'EQUATION.OUT';
var     g,f     :       text;
        a,b,c,d,v,p,q       :       int64;
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
function        ucln(a,b:int64):int64;
begin
         if b=0 then exit(a) else
          exit(ucln(b,a mod b));
end;
procedure       xuly;
var     t,t1,uc    :       int64;
begin
        p:=d*v-b;
        q:=a-c*v;
         if (c=0)and(d=0) then writeln(g,'NONE')
         else
         begin
        if (q=0)and(p=0) then writeln(g,'MULTIPLE')
        else
         if {((a+b)mod(c+d)=0)and((b-a)mod(d-c)=0)and}((a+100*b)/(c+100*d)=(b-27*a)/(d-27*c))then
          begin
          if (a+100*b)div(c+100*d)<>v then writeln(g,'NONE')
          else
         if q=0 then writeln(g,'NONE')
         end
         else
         if p=0 then writeln(g,'X = 0')
         else
          begin
           t:=abs(q);
           t1:=abs(p);
           uc:=ucln(t,t1);
           write(g,'X = ');
           if p*q<0 then write(g,'-');
           writeln(g,t1 div uc,'/', t div uc);
          end;
         end;
end;
procedure       doc;
begin
        while not seekeof(f) do
         begin
          readln(f,a,b,c,d,v);
          xuly;
         end;
end;
begin
        mo;
        doc;
        dong;
end.
