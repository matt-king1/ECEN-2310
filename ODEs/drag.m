function drag
    % DRAG: Sphere falling with air drag.
    %   DRAG
    % Plots the position and velocity of a
    % sphere falling in the air
    g = 9.81;
    d = 0.47;
    r = 0.025;
    a = pi * r * r;
    s = 1000;
    m = 4 * a * r * s / 3;
    rho = 1.2922;
    k = rho * a * d / 2;
    x0 = [0; 0];
    sol = ode45(@(t,x) f(t,x,m,g,k), [0 12], x0);
    plot(sol.x, sol.y)
    legend('position (m)', 'velocity (m/s)', 'location','southwest')
    title('falling sphere with air drag')
    xlabel('time (s)')
end