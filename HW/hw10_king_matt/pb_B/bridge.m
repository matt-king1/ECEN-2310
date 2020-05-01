function rv = bridge(R,Vs)
    [r, c] = size(R);
    
    if r ~= 5
        fprintf("R is the wrong size; defaulting to 1 kOhm for all resistors");
        r1 = 1000;
        r2 = 1000;
        r3 = 1000;
        r4 = 1000;
        r5 = 1000;
    else
        r1 = R(1);
        r2 = R(2);
        r3 = R(3);
        r4 = R(4);
        r5 = R(5);
    end
    
    syms va vb
    eqn1 = ((1/r1) + (1/r3) + (1/r4))*va - (1/r3)*vb == (1/r1)*Vs;
    eqn2 = (-1/r3)*va + ((1/r2)+(1/r3)+(1/r5))*vb == (1/r2)*Vs;
    
    [A,B] = equationsToMatrix([eqn1, eqn2], [va, vb]);
    
    X = linsolve(A,B);
    
    fprintf("\nVa found: %2.3f\nVb found: %2.3f\n", X(1), X(2))
    rv = [X(1),X(2)];
end

