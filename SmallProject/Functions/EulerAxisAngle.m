function [angle,axis] = EulerAxisAngle(RotationMatrix)

        angle = (RotationMatrix(1,1)+RotationMatrix(2,2)+RotationMatrix(3,3)-1)*0.5

        axis(1) = (RotationMatrix(3,2) - RotationMatrix(2,3)) / (2* rad2deg(sin(angle)))
        axis(2) = (RotationMatrix(1,3) - RotationMatrix(3,1)) / (2* rad2deg(sin(angle)))
        axis(3) = (RotationMatrix(2,1) - RotationMatrix(1,2)) / (2* rad2deg(sin(angle)))
end

