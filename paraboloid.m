% This script will plot a paraboloid and show various features.
%   Planned features include: level curves, gradf, vector field,
%   normal, tangent plane

% X and Y domain for plot
X_MIN = -2;
X_MAX = 2;
Y_MIN = -2;
Y_MAX = 2;
INCREMENT = 0.1;

% Generate points for the paraboloid
x_range = X_MIN:INCREMENT:X_MAX;
y_range = Y_MIN:INCREMENT:Y_MAX;
[X, Y] = meshgrid(x_range, y_range);
Z = X.^2 + Y.^2; % z = x^2 + y^2

% Graph paraboloid
paraboloid_gr = surf(X, Y, Z);