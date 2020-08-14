const   finp    =       '';
        fout    =       '';
var     h       :       array[0..9] of string;
        a       :       array[1..4] of string;
        b       :       array[1..6,1..25] of char;
        i,j,z     :       longint;
        luu     :       array[1..4] of longint;
        kt,ktt:boolean;
        g,f     :       text;
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
begin
        mo;
        kt:=true;
        ktt:=true;
        h[0]:='.##.#..##..##..##..#.##.';
        h[1]:='...#..##.#.#...#...#...#';
        h[2]:='.##.#..#...#..#..#..####';
        h[3]:='####...#..#....#...####.';
        h[4]:='#..##..##..#####...#...#';
        h[5]:='#####...###....##..#.##.';
        h[6]:='.####...###.#..##..#.##.';
        h[7]:='####...#..#..#...#...#..';
        h[8]:='.##.#..#.##.#..##..#.##.';
        h[9]:='.##.#..##..#.###...####.';
        for i:=1 to 4 do luu[i]:=-1;
        for i:=1 to 6 do readln(f);
        for i:=1 to 6 do
                begin
                        j:=0;
                        while not eoln(f) do
                        begin
                        inc(j);
                        read(f,b[i,j]);
                        end;
                        readln(f);
                end;
        for i:=1 to 6 do
         begin
                for z:=1 to j div 10 +1 do a[1]:=a[1]+b[i,j];
                for j:=7 to 10 do a[2]:=a[2]+b[i,j];
                for j:=12 to 15 do a[3]:=a[3]+b[i,j];
                for j:=17 to 20 do a[4]:=a[4]+b[i,j];
         end;
         for i:=1 to 4 do
         begin
                kt:=true;
                for j:=0 to 9 do
                 begin
                 for z:=1 to 25 do
                  if z<25 then
                  if ((a[i][z] <> h[j][z])and (h[j][z]='.')) then break;
                  if (z=25) and kt then
                  begin
                 luu[i]:=j;
                 kt:=false;
                 end
                   else
                   if( z=25) and (kt=false)then
                   begin
                   ktt:=false;
                   break;
                   end;
                 end;
                 if (ktt=false)or (luu[i]=-1) then break;
       end;
       if (ktt=false) or (luu[i]=-1) then write(g,'ERROR')
       else
       begin
       for i:=1 to 4 do
 if i=2 then write(g,luu[i],':')
 else write(g,luu[i])
end;
dong;
end.









