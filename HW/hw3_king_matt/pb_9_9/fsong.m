function samples = fsong( score )
  % Constructs a sampled signal corresponding to the
  % song specified by 'score'.  The format of 'score'
  % is an N x 3 matrix, where each row corresponds to
  % a note specification:
  %   [ octave, note, duration ]
  % where
  %  - octave specifies the number of octaves away
  %    from middle A (440 Hz);
  %  - note specifies one of the 12 pitches of the
  %    chromatic scale, 0-11;
  %  - duration specifies the length in seconds.
  % If the 'note' element is -1, the row specifies a
  % rest of the given duration and the octave
  % specifier is ignored.

  % The matrix to hold the signal, which consists of
  % concatenated sine wave samples.
  samples = [];
  % Extract the number of notes.
  [N, width] = size(score);
  if width ~= 3 % ~= is 'not equal'
    error('malformed input')
  end
  % For each note specification...
  for n = 1:N
    % extract the components of the specification...
    octave = score(n, 1);
    note = score(n, 2);
    duration = score(n, 3);
    % compute the frequency...
    freq = 0;
    if note >= 0 % it's not a rest
      freq = 2^(octave + note/12) * middleA;
    end
    % and concatenate its wave.
    samples = [samples tone(duration, freq)];
  end
end

function rv = middleA
  % Defines the frequency of middle A.  Constants in
  % MATLAB are generated in this peculiar way.
  rv = 440;
end

function rv = tone(duration, freq)
  % Generates the samples sine wave for the given 'freq'
  % and 'duration'.  The sampling rate is 8192 Hz.
  sampleTimes = (0:duration*8192-1)/8192;
  rv = sin(2*pi*freq*sampleTimes) * .999 .* exp(-sampleTimes*10); % scale
end
