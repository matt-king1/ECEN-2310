function xdot = chaotic(t, X)
    xdot = [
            10*(X(2)-X(1)) ;
            -X(1)*X(3) + 28*X(1) - X(2);
            X(1)*X(2) - 8*X(3)/3
            ];
end