exp = input('Input experimental points (xi,yi) in the form of an nx2 matrix: ');
xi = exp(:,1);  % takes all xi points from input
yi = exp(:,2);  % takes all yi points from input
for deg = 1:10
    if deg < size(xi,1)
        ply = polyfit(xi,yi,deg);
        fx = polyval(ply,xi);
        er = yi - fx;
        if deg == 1 || maxe > norm(er) % finds the best fit
            maxe = norm(er);
            maxd = deg; 
        end
    end
end
ply = polyfit(xi,yi,maxd);
fprintf('The coefficients in polynomial curve fitting are: \n')
disp(ply);
