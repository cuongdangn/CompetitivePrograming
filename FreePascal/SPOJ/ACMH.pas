{$MODE OBJFPC}
program PRIME1;
var
    primes: array[1..4000] of integer;
    numprimes: integer;
    i,j: integer;
    cap: double;
    isprime: boolean;
    T,N,M: integer;
    isp: array[0..100001] of boolean;
    p,start: integer;


begin
    primes[1] := 2;
    numprimes := 1;
    for i := 3 to 32000 do
    begin
        isprime := true;
        cap := sqrt(i) + 1;
        for j := 1 to numprimes do
        begin
            if primes[j] >= cap then
                    break;

            if (i MOD primes[j] = 0) then
            begin
                isprime := false;
                break;
            end
        end;

        if isprime = true then
        begin
            numprimes := numprimes + 1;
            primes[numprimes] := i
        end
    end;

    read(T);

    for t := 1 to T do
    begin
        if t > 0 then
            writeln('');

        read(M);
        read(N);

        if M < 2 then
            M := 2;

        cap := sqrt(N) + 1;

        for i :=0 to 100001 do isp[i] := true;


        for i := 1 to numprimes do
        begin
            p := primes[i];
            if p >= cap then
                break;

            if p >= M then
                start := (p * 2);

            if p < M then
                start := M + ((p - (M MOD p)) MOD p);

            j := start;

            while j <= N do
            begin
                isp[j - M] := false;
                j := j + p;
            end;
        end;

        for i := M to N do
        begin
            if isp[i-M] = true then
                writeln(i);
        end;
    end;
end.
