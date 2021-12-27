function [pitch,roll,yaw] = EulerRotationAngles(RotationMatrix)
    pitch = rad2deg(asin(-RotationMatrix(3,1)))
    roll = rad2deg(atan((RotationMatrix(3,2)/cos(pitch))/(RotationMatrix(3,3)/cos(pitch))))
    yaw = rad2deg(asin(sqrt(RotationMatrix(2,1)/cos(pitch))))
end

