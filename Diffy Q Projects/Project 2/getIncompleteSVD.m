function approx = getIncompleteSVD(A,So,Vo,n)
    [r, c] = size(So);
    
    V = Vo(:,1:n);
    S = zeros(n, n);
    
    if r == 1
        for i = 1:n
            S(i,i) = So(1,i);
        end
    else
        for i = 1:n
            S(i,i) = So(i,i);
        end
    end
    
    U = zeros(1320,n);

    for i = 1:n
        U(:,i) = (A * V(:,i)) / S(i,i);
    end

    approx = U * S * V';
end

