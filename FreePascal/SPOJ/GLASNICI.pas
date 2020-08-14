const   finp    =       'glasnici.in.2';
        fout    =       '';
        //glasnici.out.2
var     g,f     :       text;
        kq,d       :       extended;
        a,b,kn     :       array[1..100001] of extended;
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
var     i       :       longint;
begin
        readln(f,d);
        readln(f,n);
        for i:=1 to n do readln(f,a[i]);
end;
function        ktra(t:extended):boolean;
var     i,j     :       longint;
        x       :       extended;
begin
        b:=a;
        b[1]:=b[1]+t;
        kn[1]:=t;
        for i:=2 to n do
          begin
            if b[i]-b[i-1]=d then kn[i]:=0
            else
             if b[i]-b[i-1]>d then
              begin
               b[i]:=b[i]-kn[i-1];
               if b[i]-b[i-1]>d then exit(false);
               kn[i]:=kn[i-1];
               b[i]:=b[i]+d-(b[i]-b[i-1]);
              end


          end;
          exit(true);
end;
procedure       chat;
var     dau,cuoi,giua   :       extended;
begin
        dau:=0.001;
        cuoi:=10000000;
        while cuoi-dau>=0.001 do
         begin
          giua:=(dau+cuoi)/2;
          if ktra(giua) then
           begin
           kq:=giua;
           cuoi:=giua-0.001;
           end
          else dau:=giua+0.001;
         end;
         writeln(g,kq:0:3);
end;
begin
        mo;
        doc;
        chat;
        dong;
end.
