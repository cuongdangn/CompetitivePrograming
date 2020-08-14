const fi='';
      fo='';
      maxn=20000;

type lg=longint;

var f:text;
    i,x,y,n,m,s,t,t1:integer;
    vao,ra:array[1..maxn] of integer;

begin
        fillchar(vao,sizeof(vao),0);
        fillchar(ra,sizeof(ra),0);
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to m do
            begin
            readln(f,x,y);
            inc(ra[x]);
            inc(vao[y]);
            end;
        close(f);

        assign(f,fo);
        rewrite(f);
        x:=0;y:=0;
        for i:=1 to n do
        begin
        if (vao[i]=0) then begin inc(x);s:=i; end;
        if (ra[i]=0) then begin inc(y);t:=i; end;
        if (ra[i]>0)and(vao[i]>0) then t1:=i;
        end;
        if (x=1) and (y=1) then
           begin
           writeln(f,'YES');
           if t<>s then write(f,t,' ',s);
           end
           else
           if (x=1)and(y=0) then
                begin
                       writeln(f,'YES');
                       write(f,t1,' ',s);
                end
           else
           if (x=0)and(y=1) then
                begin
                         writeln(f,'YES');
                         write(f,t,' ',t1);
                end
           else
           write(f,'YES');
        close(f);


end.
