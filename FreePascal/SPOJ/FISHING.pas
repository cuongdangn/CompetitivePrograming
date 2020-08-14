uses    math;
const   finp    =       'Fishing.inp';
        fout    =       'fishing.out';
var     g,f     :       text;
        mk,m,n,kq :       longint;
        a       :       array[1..201,1..201] of int64;
        fx,gx   :       array[1..201,1..201,0..201] of int64;

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
var     i,j     :       longint;
begin
        readln(f,m,n);
        for i:=1 to m do
         for j:=1 to n do read(f,a[i,j]);
end;
procedure       xuly;
var      i,j,k    :       longint;
begin
        mk:=min(m,n);

        for i:=1 to m do
         for j:=1 to n do
          for k:=1 to mk do
           begin
            fx[i,j,k]:=maxlongint*100;
            gx[i,j,k]:=-maxlongint*100;
           end;
          fx[1,1,1]:=a[1,1];
          gx[1,1,1]:=a[1,1];

          for i:=2 to n do
          begin
           fx[1,i,1]:=min(a[1,i],fx[1,i-1,1]);
           gx[1,i,1]:=max(a[1,i],gx[1,i-1,1]);
          end;
          ////
          for j:=2 to m do
           begin
            fx[j,1,1]:=min(a[j,1],fx[j-1,1,1]);
            gx[j,1,1]:=max(a[j,1],gx[j-1,1,1]);
           end;
          ///;
          for i:=2 to m do
           for j:=2 to n do
            begin
             for k:=1 to mk do
              begin
               fx[i,j,k]:=min(fx[i-1,j-1,k-1]+a[i,j],min(fx[i-1,j,k],fx[i,j-1,k]));
               gx[i,j,k]:=max(gx[i-1,j-1,k-1]+a[i,j],max(gx[i-1,j,k],gx[i,j-1,k]));
              end;
            end;
          for i:=0 to mk div 2 do
            kq:=max(kq,gx[m,n,i]-fx[m,n,i*2]);
          /////;
          writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.