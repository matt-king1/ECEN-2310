function freefallode
    % FREEFALLODE: Trajectory of free fall.
    % FREEFALLODE
    
    g = 9.81;
    h = 10;
    v0 = 0;
    % Time to reach the ground
    T = v0/g + sqrt((v0/g)^2 + 2*h/g);
    sol = ode45(@(~,x) freefall(x,g),[0 T],[h; v0]);
    hp = plot(sol.x, sol.y);
    xlim([0 T])
    line(xlim,[0 0], 'Color', 'k')
    legend(hp, 'position (m)', 'velocity (m/s)','location','southwest')
    title('Free Fall')
    xlabel('time (s)')
end

