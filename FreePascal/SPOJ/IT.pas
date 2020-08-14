{$MODE OBJFPC}
const   max=    100000;
type
        TEndPointType = (eptOpen,eptClose);
        Tendpoint       =       record
                value:integer;
                ept:  tendpointtype;
                rid:integer;
        end;
        trect   =       record
        x1,y1,x2,y2     :       integer;
        end;
        TEndPointArray  = array[1..2*max]of TEndPoint;
        Tnode   =       record
        point:Integer;
        sign:Integer;
        sum,maxsum:Integer;
        POM:Integer;
        end;
var     x,y     :       TEndPointArray;
        r       :       array[1..max] of trect;
        tree    :       array[0..2*max] of tnode;
        ptr     :       array[1..2*max] of integer;
        n,resx,resy,m   :       integer;
procedure       doc;
var     i,j     :       integer;
begin
        readln(f,n);
        for i:=1 to n do
                begin
                        j:=2*n+1-i;
                        read(f,x[i].value);
                        x[i].Ept:=eptopen;
                        x[i].rid:=i;
                        Read(f,y[i].value);
                        y[i].Ept:=eptOpen;
                        read(f,x[j].value);
                        x[j].rid:=i;
                        read(f,y[j].value);
                        y[j].ept:=eptclose;
                        y[j].rid:=i;
                end;
end;

operator        < (const p,q:TEndPoint) : boolean;
begin
        result  := (p.value <q.value) or (p.value=q.value)and (p.ept<q.ept);
end;
procedure       sort(var k:TEndPointArray);
procedure Partition(L, H:Integer);
var     i,j:Integer;
        Pivot:TEndPoint;
begin
        if l>=h then exit;
        i:=l + random(h-l+1);
        pivot:=k[i];
        k[i]:=k[l];
        i:=l;
        j:=h;
        repeat
                while (pivot<k[j])and(i<j) do dec(j);
                if i<j then
                        begin
                                k[i]:=k[j];
                                inc(i);
                        end
                        else break;
                while (k[i]< pivot) and( i<j) do inc(i);
                if i<J then
                        begin
                                k[j]:=k[i];
                                dec(j);
                        end
                        else break;
                until i=j;
                k[i]:=pivot;
                Partition(L,i - 1);
                Partition(i+1, H);

        end;
begin
        Partition(1,2*n);
end;
procedure       RefineRects;
var     i:integer;
begin
        for i:=1 to 2*n do
         begin
                with x[i] do
                 if ept= eptOpen then r[rid].x1:=i
                 else r[rid].x2:=i;
                with y[i] do
                 if ept= eptOpen then r[rid].y1:=i
                 else r[rid].y2:=i;
         end;
end;
function        valid(x:integer):boolean;
begin
        result:=x <= 2*n;
end;
function        left(x : integer):integer;
begin
        if valid(x*2) then result:= x*2
        else result:=0;
end;
function        right(x:integer):integer;
begin
        if valid(x*2 +1) then result:=x*2+1
        else result:=0;
end;
procedure       buildtree;
var     i:integer;
        procedure   InOrderTraversal(x:Integer);
        begin
                if not valid(x) then exit;
                InOrderTraversal(x*2);
                inc(i);
                tree[x].point:=i;
                ptr[i]:=x;
                 InOrderTraversal(x*2+1);
        end;
begin
        fillbyte(tree,sizeof(tree),0);
        i:=0;
        InOrderTraversal(1);
end;
function        choosemax3(var  target:integer;a,b,c:integer):integer;
begin
        target:=a;
        result:=1;
        if target<b theb
                begin
                        target:=b;
                        result:=2;
                end;
        if target < c then
                begin
                        target:=c;
                        result:=3;
                end;
end;
procedure       setpoint(p:integer;s:integer);
var     node,l,r,choice:integer;
begin
        node:=ptr[p];
        tree[node].sign:=s;
        repeat
                l:=left(node);
                r:=right(node);
                tree[node].sum:=tree[node].sign+tree[l].sum+tree[r].sum;
                choice:=ChooseMax3(tree[Node].maxsum,tree[l].maxsum,tree[l].sum+tree[node].sign,tree[l].sim+tree[l].sign+tree[l.maxsum);
                case    choice of
                1:tree[node].pom:=tree[l].pom;
                2:tree[node].pom:=tree[node].point;
                3: tree[node.pom:=tree[r].pom;
                end;
                node:=node div 2;
                until   node=0;
end;
procedure       InsertInterval(x1,x2: integer);
begin
        setpoint(x1,+1);
        setpoint(x2,-1);
end;
procedure       DeleteInterval (x1,x2:integer);
begin
        setpoint(x1,0);
        setpoint(x2,0);
end;
procedure       sweep;
var     sweepY, POM:integer;
begin
        buildtree;
        m:=0;
        for sweepY:=1 to 2*n do
                with y[sweepY] do
                        if ept = eptopen then
                                begin
                                InsertInterval(r[rid].x1,r[rid].x2);
                                if tree[1].maxsum>m then
                                begin
                                        m:=tree[1].maxsum;
                                        pom:=tree[1].pom;
                                        res[x]:=x[pom].value;
                                        resy:=y[sweepY].value;
                                end;
                                end
                        else DeleteInterval(r[rid].x1,r[rid].x2);
end;














