% Beethoven's Eighth Symphony, first movement's main theme.
% One line per bar.
bs8 = [ 1 3 1/4; 1 0 1/8; 1 1 1/8; 1 3 1/8; 1 0 1/8;
        0 8 1/2; 0 3 1/8; 0 8 1/8;
        0 8 1/8; 0 7 1/8; 0 7 1/8; 0 8 1/8; 0 10 1/8; 1 0 1/8;
        1 1 1/4; 0 -1 1/2;
        0 1 1/4; -1 10 1/8; 0 0 1/8; 0 1 1/8; 0 2 1/8;
        0 3 1/2; 0 1 1/4;
        0 0 1/8; 0 3 1/8; -1 8 1/4; -1 10 1/4;
        -1 10 1/2; 0 0 1/4
      ];
%Adjust tempo to metronome marking by scaling durations.
bs8(:,3) = bs8(:,3) * 80/69;

sound(0.7*fsong(bs8))
