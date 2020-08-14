const   finp    =       '';
        fout    =       '';
        d1       :       array[1..4] of integer = (1,0,-1,0);
        c1       :       array[1..4] of integer = (0,1,0,-1);

type    bg      =       record
        x,y     :       byte;
        end;
var     g,f     :       text;
        a       :       array[1..100,1..100] of char;
        r,c,x1,y1,x2,y2,dau,cuoi     :       longint;
        d       :       array[1..100,1..100] of longint;
        st      :       array[0..100000] of bg;
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
var     i ,j    :       longint;
begin
        readln(f,r,c);
        for i:=1 to r do
        begin
                for j:=1 to c do
                begin
                read(f,a[i,j]);
                if a[i,j]='C' then begin x1:=i;y1:=j; end;
                if a[i,j]='B' then begin x2:=i;y2:=j; end;
                end;
                readln(f);
        end;
end;
procedure       push(a,b:longint);
begin
        inc(cuoi);
        st[cuoi].x:=a;
        st[cuoi].y:=b;
end;
procedure       BFS(n,m:longint);
var     i,j     :       longint;
        k       :       byte;  kt:boolean;
begin
        fillchar(d,sizeof(d),0);
        dau:=1;cuoi:=0;   kt:=false;
        push(n,m);
        while (dau<=cuoi)and(kt=false) do
         begin
                i:=st[dau].x;
                j:=st[dau].y;
                inc(dau);
                for k:=1 to 4 do
                if ((i+d1[k] )in [1..r]) and ((j+c1[k])in[1..c]) then
                if (a[i+d1[k],j+c1[k]]='.' )or (a[i+d1[k],j+c1[k]]='B') then
                if d[i+d1[k],j+c1[k]]=0 then
                 begin
                        d[i+d1[k],j+c1[k]]:=d[i,j]+1;
                        push(i+d1[k],j+c1[k]);
                        if a[i+d1[k],j+c1[k]]='B' then kt:=true;
                 end;
         end;
end;
begin
        mo;
        doc;
        BFS(x1,y1);
        writeln(g,d[x2,y2]);
        dong;
end.