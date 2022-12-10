function [Exn, Eyn, Ezn, Bxn, Byn, Bzn] = fdtd(dl, dt, Ex, Ey, Ez, Bx, By, Bz, Jx, Jy, Jz)
    dimensions = size(Bx);
    S = zeros(dimensions(1), dimensions(2), dimensions(3));
    Exn = S; Eyn = S; Ezn = S; Bxn = S; Byn = S; Bzn = S;
    
    for i = 1:dimensions(1)
        for j = 1:dimensions(2)
            for k = 1:dimensions(3)
                Bxn(i, j, k) = -dt/dl*(Ez(i, j + 1, k) - Ez(i, j, k)) + dt/dl*(Ey(i, j, k + 1) - Ey(i, j, k)) + Bx(i, j, k);
                Byn(i, j, k) = -dt/dl*(Ex(i, j, k + 1) - Ex(i, j, k)) + dt/dl*(Ez(i + 1, j, k) - Ez(i, j, k)) + By(i, j, k);
                Bzn(i, j, k) = -dt/dl*(Ey(i + 1, j, k) - Ey(i, j, k)) + dt/dl*(Ex(i, j + 1, k) - Ex(i, j, k)) + Bz(i, j, k);
                
                Exn(i, j, k) = (1/dl*(Bz(i, j + 1, k) - Bz(i, j, k)) - 1/dl*(By(i, j, k + 1) - By(i, j, k)) - mu*Jx(i, j, k)) * dt/(mu*epsilon) + Ex(i, j, k);
                Eyn(i, j, k) = (1/dl*(Bx(i, j, k + 1) - Bx(i, j, k)) - 1/dl*(Bz(i + 1, j, k) - Bz(i, j, k)) - mu*Jy(i, j, k)) * dt/(mu*epsilon) + Ey(i, j, k);
                Ezn(i, j, k) = (1/dl*(By(i + 1, j, k) - By(i, j, k)) - 1/dl*(Bx(i, j + 1, k) - Bx(i, j, k)) - mu*Jz(i, j, k)) * dt/(mu*epsilon) + Ez(i, j, k)
            end
        end
    end
end