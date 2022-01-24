function [axis,angle] = GetAxisAngleFromMatrix(rm)

angle = acosd(((rm(1,1)+rm(2,2)+rm(3,3)) -1) / 2);

a = rm(3,2)-rm(2,3);
b = rm(1,3)-rm(3,1);
c = rm(2,1)-rm(1,2);

k = sqrt(a^2 + b^2 * c^2);

axis(1) = a/k;
axis(2) = b/k;
axis(3) = c/k;


end

