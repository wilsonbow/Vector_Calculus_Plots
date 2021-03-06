% This script will plot a paraboloid and show various features.
%   Planned features include: level curves, gradf, vector field,
%   normal, tangent plane

% X and Y domain for plot
X_MIN = -2;
X_MAX = 2;
Y_MIN = -2;
Y_MAX = 2;
INCREMENT = 0.1;
QUIVER_INCREMENT = 0.5;

% Generate points for the paraboloid
x_range = X_MIN:INCREMENT:X_MAX;
y_range = Y_MIN:INCREMENT:Y_MAX;
[X, Y] = meshgrid(x_range, y_range);
Z = X.^2 + Y.^2; % z = x^2 + y^2

% Generate level curves
% TODO - Find max constant required
%           in order to auto-find range of consts to use

% Generate curves using parametric circle equations
r_index = 1;
for r = 0:0.5:2
    theta_index = 1;
    for theta = 0:0.1:(2*pi+0.1)
        X_curves(theta_index, r_index) = r*cos(theta);
        Y_curves(theta_index, r_index) = r*sin(theta);
        theta_index = theta_index + 1;
    end
    r_index = r_index + 1;
end

% Generate vector field parameters (for "quiver")
%   U represents Df/Dx, V represents Df/Dy both at P(x,y)
% Create new X, Y meshgrid for cosmetic purposes
x_quiver_range = X_MIN:QUIVER_INCREMENT:X_MAX;
y_quiver_range = Y_MIN:QUIVER_INCREMENT:Y_MAX;
[X_quiver, Y_quiver] = meshgrid(x_quiver_range, y_quiver_range);

U_quiver = 2 .* X_quiver;
V_quiver = 2 .* Y_quiver;

%% GRAPHING FUNCTIONS
% Graph paraboloid
figure();
paraboloid_ax = subplot(2,2,1);
paraboloid_gr = surf(X, Y, Z);

% Graph level curves
level_curves_ax = subplot(2,2,2);
hold all;
for plot_index = 1:5
    plot(X_curves(:, plot_index), Y_curves(:, plot_index));
end

% Graph vector field
quiver(X_quiver, Y_quiver, U_quiver, V_quiver);
set(level_curves_ax, 'XLim', [-3 3], 'YLim', [-3 3]); % rescale axes
