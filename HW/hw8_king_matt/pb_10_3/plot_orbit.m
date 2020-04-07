function plot_orbit(y0, T, s)
    [t, y] = ode45(@orbit, 0:s:T, y0)
    t = t';
    y = y';
    clf;
    
    subplot(2,1,1);
    hold on;
    title('Position');
    xlabel('X');
    ylabel('Y');
    plot([0], [0], 'or');
    plot(t, y, '-b');
    axis('equal');
end

function ydot = orbit(t, y)
    r = sqrt(y(1:2)' * y(1:2));
    ydot = [y(3);            ...
            y(4);            ...
            -1/r^3 * y(1);   ...
            -1/r^3 * y(2)];
end

function V = velocity(sol)
    V = sqrt(sol(3,:).*sol(3,:) + sol(4,:).*sol(4,:));
end

