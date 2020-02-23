function xdot = dcm(t, x, K, J, eta, L, R, v, tau)
    % t     :   time
    % x(1)  :   angular displacement (rad)
    % x(2)  :   angular velocity (rad/s)
    % x(3)  :   armature current (A)
    % K     :   armature constant (V/(rad/s) or Nm/A)
    % eta   :   viscious friction coefficient (Nms)
    % J     :   moment of intertia
    xdot =  [
            x(2);
            (K * x(3) - eta * x(2) - tau(x(1))) / J;
            (v(t) - K * x(2) - R * x(3)) / L
            ];
end

