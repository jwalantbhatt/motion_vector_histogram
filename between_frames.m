%input image
imgP = imread('frame1080.jpg');
imgI = imread('frame1090.jpg');
MV_hist = zeros(8,1);
mbSize = 8;
p = 25;

[motionVect, SS4Computations] = motionEst4SS(imgP, imgI, mbSize, p);
for k = 1:97200
    if (motionVect(1,k) == 0) && (motionVect(2,k) == 0)
    else
        angle = atand(motionVect(2,k)/motionVect(1,k));
        length = sqrt(motionVect(2,k)^2 + motionVect(1,k)^2);
        if ((angle >= -5.0 && angle <= 5.0) || (angle <= -175.0 && angle >= 175.0)) 
            MV_hist(1) = MV_hist(1) + length;

        elseif ((angle >= 85.0 && angle <= 95.0) || (angle <= -85.0 && angle >= -95.0))

            MV_hist(2) = MV_hist(2) + length;

        elseif ((angle >= 40.0 && angle <= 50.0) || (angle <= -130.0 && angle >= -140.0))

            MV_hist(3) = MV_hist(3) + length;

        elseif((angle >= 130.0 && angle <= 140.0) || (angle <= -40.0 && angle >= -50.0))

            MV_hist(4) = MV_hist(4) + length;

        elseif((angle > 5.0 && angle < 40.0) || (angle < -140.0 && angle > -175.0))

             MV_hist(5) = MV_hist(5) + length;

        elseif((angle > 140.0 && angle < 175.0) || (angle < -5.0 && angle > -40.0))

            MV_hist(6) = MV_hist(6) + length;

        elseif((angle > 50.0 && angle < 85.0) || (angle < -95.0 && angle > -130.0))

            MV_hist(7) = MV_hist(7) + length;

        else

            MV_hist(8) = MV_hist(8) + length;
        end
    end
end


