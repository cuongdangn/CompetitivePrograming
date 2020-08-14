uses    math;
const   finp    =       '';
        fout    =       '';
        don     :       array[1..8] of integer=(-1,-1,0,1,1,1,0,-1);
        cot     :       array[1..8] of integer=(0,1,1,1,0,-1,-1,-1);
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        a       :       array[1..1000,1..1000] of char;
        q       :       array[1..3000000] of bg;
        n,m,dau,cuoi     :       longint;
        s       :       ansistring;
        dd      :       array[1..1000,1..1000] of longint;
        sl      :       array[1..1000001,1..8] of longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;

procedure       dong;
begin
        close(g);
        close(f);
end;

procedure       doc;
var     i,j       :       longint;
begin
        readln(f,n,m);
        readln(f,i,j);
        q[1].x:=i;
        q[1].y:=j;
        dd[i,j]:=1;
        for i:=1 to n do
         begin
         for j:=1 to m do read(f,a[i,j]);
         readln(f);
        end;
         read(f,s);
         while s[1]=' ' do delete(s,1,1);
         while s[length(s)]=' ' do delete(s,1,length(s));
         for i:=length(s) downto 1 do
          begin
                for j:=1 to 8 do
                 sl[i,j]:=sl[i+1,j];
                 case s[i] of
                 '1':sl[i,1]:=i;
                 '2':sl[i,2]:=i;
                 '3':sl[i,3]:=i;
                 '4':sl[i,4]:=i;
                 '5':sl[i,5]:=i;
                 '6':sl[i,6]:=i;
                 '7':sl[i,7]:=i;
                 '8':sl[i,8]:=i;
                 end;
          end;
end;
function        check(i,j:longint):boolean;
begin
        exit((i>0)and(i<=n)and(j>0)and(j<=m)and(a[i,j]='.'));
end;
procedure       loang;
var   i,j:longint;
        p       :       bg;
begin
        dau:=1;
        cuoi:=1;
        while dau<=cuoi do
        begin
                p:=q[dau];
                inc(dau);
                for i:=1 to 8 do
                 if (sl[dd[p.x,p.y],i]>0) then
                  if check(p.x+don[i],p.y+cot[i]) then
                      if dd[p.x+don[i],p.y+cot[i]]=0 then
                        begin
                                dd[p.x+don[i],p.y+cot[i]]:=sl[dd[p.x,p.y],i]+1;
                                inc(cuoi);
                                q[cuoi].x:=p.x+don[i];
                                q[cuoi].y:=p.y+cot[i];
                        end
                        else
                        if dd[p.x+don[i],p.y+cot[i]]>sl[dd[p.x,p.y],i]+1 then
                          begin
                                 dd[p.x+don[i],p.y+cot[i]]:=sl[dd[p.x,p.y],i]+1;
                                inc(cuoi);
                                q[cuoi].x:=p.x+don[i];
                                q[cuoi].y:=p.y+cot[i];
                          end
         end;
         for i:=1 to n do
         begin
          for j:=1 to m do
           if dd[i,j]<>0 then write(g,1)
           else write(g,0);
           writeln(g);
          end;
end;
begin
        mo;
        doc;
        loang;
        dong;
end.

