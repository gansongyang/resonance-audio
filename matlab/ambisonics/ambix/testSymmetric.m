
close all
clc
clear

% Ambisonic order.
ORDER = 3;

% Tolerated error margin.
EPSILON = 1e-12;

% Pre-compute AmbiX coefficient table for angles 0 - 90 degrees.
ENCODER_TABLE = getencodertable(ORDER);
SYMMETRY_MATRIX = getshsymmetries(ORDER);

for PHI = [158 ]
    for THETA = [-88 ]
        coeffsTested = ambencodecoeffsymmetric(ENCODER_TABLE, ...
            SYMMETRY_MATRIX, PHI, THETA);

                coeffsReference =  ambencodecoeff(ORDER, PHI * pi / 180, ...
            THETA * pi / 180);
    end
end
plot(coeffsTested - coeffsReference)