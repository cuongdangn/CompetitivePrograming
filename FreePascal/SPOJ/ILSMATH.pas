uses    math;
var n,i:longint;x:real;
begin
	readln(n);
	 if n=1 then
	  begin
	  	writeln(3);
	  	writeln(1,' ',2,' ',6);
	  end
          else
	 if n=3 then
	 	begin
	 		writeln(2);
	 		writeln(120,' ',720);
	 	end
          else
                if n=2 then
                        begin
                                writeln(1);
                                writeln(24);
                        end
                else
                begin
                x:=0;i:=2;
                while trunc(x)<n-1 do
                begin
                        x:=x+log10(i);
                        if trunc(x)=n-1 then
                                begin
                                        writeln(1);
                                        writeln(i);
                                        break;
                                end
                        else
                                if trunc(x)>n-1 then
                                        begin
                                                writeln('NO');
                                                break;
                                        end;
                        inc(i);
                end;
              end;
end.
