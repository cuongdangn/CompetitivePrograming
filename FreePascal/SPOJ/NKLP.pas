const  INP      =      '';
        OUT      =      '';

        maxn    =      100007;
        maxc    =      270000;

var    n , nmax :      longint;
        a        :      array[1..maxn+1] of longint;
        d , c    :      array[1..maxc+1] of longint;
        mark    :      array[0..maxn]  of boolean;
        fi , fo  :      text;

function fmax( x , y : longint ) : longint;
begin
    if x > y then fmax := x else fmax := y;
end;

procedure add( val , tt : longint );

    procedure visit( k , l , r : longint );
    var
        mid : longint;
    begin
        repeat
              inc( c[k] );
              d[k] := tt;
              if l = r then exit;

              mid := ( l + r ) shr 1;
              k := k shl 1;
              if ( l <= val )and( val <= mid ) then r := mid
              else
                    begin
                        inc( k ); l := mid + 1;
                    end;
        until false;
    end;

begin
    mark[val] := true;
    visit( 1 , 1 , nmax );
end;

function not_cover : longint;

    procedure visit( k , l , r : longint );
    var
        mid : longint;
    begin
        repeat
              if c[k] = 0 then begin
                  not_cover := l; exit;
              end;

              mid := ( l + r ) shr 1;
              k := k shl 1;
              if c[k] <= mid - l then r := mid
              else
                    begin
                        inc( k ); l := mid + 1;
                    end;
        until false;
    end;

begin
    if c[1] < nmax then visit( 1 , 1 , nmax )
    else not_cover := nmax + 1;
end;

function farthest( val : longint ) : longint;
var
    vt : longint;

    procedure visit( k , l , r : longint );
    var
        mid : longint;
    begin
        if r <= val then begin
            if d[k] > vt then vt := d[k];
            exit;
        end;

        mid := ( l + r ) shr 1;
        if l <= val then visit( k shl 1 , l , mid );
        if mid < val then visit( k shl 1 + 1 , mid + 1 , r );
    end;

begin
    vt := 0;
    visit( 1 , 1 , nmax );
    farthest := vt;
end;

procedure push_out( val : longint );

  procedure visit( k , l , r : longint );
  var
        mid : longint;
  begin
        dec( c[k] );
        if l = r then begin
          d[k] := 0; exit;
        end;

        mid := ( l + r ) shr 1;
        if ( l <= val )and( val <= mid ) then visit( k shl 1 , l , mid )
        else visit( k shl 1 + 1 , mid + 1 , r );

        d[k] := fmax( d[k shl 1] , d[k shl 1 + 1] );
  end;

begin
    mark[val] := false;
    visit( 1 , 1 , nmax );
end;

procedure process;
var
    vt , i , ht , max , val , gh : longint;
begin
    ht  := 0;
    max := 0;
    for i := 1 to n do begin
        if ( i + max > n )or( max = nmax ) then break;

        while not mark[ a[ht+1] ] do begin
              inc( ht );
              add( a[ht] , ht );
        end;

        if mark[1] then begin
          val := not_cover - 1;
          gh  := fmax( a[i] - 1 , max );

          while val > gh do begin
                vt := farthest( val );
                if vt - i + 1 = val then begin
                    max := val; break;
                end
                    else val := a[vt] - 1;
          end;
        end;

        push_out( a[i] );
    end;

    writeln( fo , max );
end;

procedure init;
var
    i : longint;
begin
    a[n+1]  := 0  ;
    mark[0] := true;
    for i := 1 to n do
        if nmax < a[i] then nmax := a[i];
end;

procedure nhapdl;
var
    i : longint;
begin
    read( fi , n );
    for i := 1 to n do read( fi , a[i] );
end;

procedure mofile;
begin
    assign( fi , INP ); reset( fi )  ;
    assign( fo , OUT ); rewrite( fo );
end;

procedure dongfile;
begin
    close( fi ); close( fo );
end;

BEGIN
    mofile  ;
    nhapdl  ;
    init    ;
    process ;
    dongfile;
END.
