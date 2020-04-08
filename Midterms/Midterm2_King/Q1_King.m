function Q1_King()

[x, fval, exitflag] = fsolve( @(x) x^3 - 3*x^2 + 2*x +1 , [1] );

if exitflag == 1
    fprintf("Zero of x^3 - 3*x^2 + 2*x + 1 found at x = %f\n", x);
elseif exitflag < 0
    fprintf("ERROR: Solution not found. Fsolve exited with exitflag = %i\n", exitflag);
end

end


