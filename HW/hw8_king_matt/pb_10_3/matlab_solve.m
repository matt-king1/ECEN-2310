function sol = matlab_solve(ydot, init, t)
    [dummy, sol] = ode45(ydot, t, init);
    sol = sol'
end