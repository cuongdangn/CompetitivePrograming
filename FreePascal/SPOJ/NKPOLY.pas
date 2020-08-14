const   finp    =       '';
        fout    =       '';
        maxx    =       trunc(1e15);
type    bg      =       record
        x,y     :       longint;
        end;
var     g,f     :       text;
        a       :       array[1..201] of bg;
        n       :       byte;
        d1,d2   :       array[1..201,1..201] of int64;
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
var     i,j     :       byte;
begin
        readln(f,n);
        for i:=1 to n do
          readln(f,a[i].x,a[i].y);

end;

function        max(a,b:int64):int64;
begin
        if a>b then exit(a);
        exit(b);
end;
function        min(a,b:int64):int64;
begin
        if a<b then exit(a);
        exit(b);
end;
function        s(a,b,c:bg):int64;
begin
        exit(abs(int64(b.x-a.x)*int64(a.y+b.y)+int64(c.x-b.x)*int64(c.y+b.y)+int64(a.x-c.x)*int64(a.y+c.y)));
end;
procedure       xuly;
var     i,j,l     :       byte;
begin
        for l:=3 to n do
         for i:=1 to n-l+1 do
          begin
                d1[i,i+l-1]:=maxx;
                for j:=i+1 to i+l-2 do
                 begin
                 d1[i,i+l-1]:=min(d1[i,i+l-1],max(s(a[i],a[j],a[i+l-1]),max(d1[i,j],d1[j,i+l-1])));
                 d2[i,i+l-1]:=max(max(d2[i,i+l-1],s(a[i],a[j],a[i+l-1])),max(d2[i,j],d2[j,i+l-1]));
                 end;
          end;
         writeln(g,d2[1,n]/2:0:1);
         writeln(g,d1[1,n]/2:0:1);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.