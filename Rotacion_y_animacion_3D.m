close all
clc
clear
%Se imprime en la pantalla para pedir al usuario los grados que se desea
%rotar con respecto a cada eje.
prompt= 'Cuanto deseas rotar en grados con respecto al eje X (phi)=';
phiDeg = input(prompt);

prompt= 'Cuanto deseas rotar en grados con respecto al eje Y (theta)=';
thetaDeg = input(prompt);

prompt= 'Cuanto deseas rotar en grados con respecto al eje Z (psi)=';
psiDeg = input(prompt);

%Funcion para realizar la conversiones en radianes
phiRad= deg2rad(phiDeg);
thetaRad= deg2rad(thetaDeg);
psiRad= deg2rad(psiDeg);

for phi=0:0.01:phiRad
    clf 
    for theta=0:0.01:thetaRad
        clf
        for psi=0:0.01:psiRad
            clf
line([-8 8],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-8 8],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-8 8],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul

%Puntos de la figura que se traza en el plano cordenado
p1=[0 0 0]; 
p2=[7 0 0]; 
p3=[7 3 0]; 
p4=[0 3 0]; 
p5=[0 0 2]; 
p6=[0 3 2]; 
p7=[7 0 2]; 
p8=[7 3 2]; 

grid on 

puntos(p1,p2,p3,p4,p5,p6,p7,p8)

view(120,30)

%Matriz de rotacion en X
Rx= [1   0       0;
     0 cos(phi) -sin(phi); 
     0 sin(phi) cos(phi)];
%Matriz de rotacion en Y
Ry= [cos(theta) 0 sin(theta) ;
       0     1    0;
    -sin(theta) 0 cos(theta) ];
%Matriz de rotacion en Z
Rz= [cos(psi) -sin(psi) 0;
     sin(psi) cos(psi)  0; 
       0      0       1];

Rt = Rz*Ry*Rx;

p1 = Rx*p1'; 
p2 = Rx*p2';
p3 = Rx*p3';
p4 = Rx*p4';
p5 = Rx*p5';
p6 = Rx*p6';
p7 = Rx*p7';
p8 = Rx*p8';
puntos(p1,p2,p3,p4,p5,p6,p7,p8)

p1 = Ry*p1;  
p2 = Ry*p2;
p3 = Ry*p3;
p4 = Ry*p4;
p5 = Ry*p5;
p6 = Ry*p6;
p7 = Ry*p7;
p8 = Ry*p8;
puntos(p1,p2,p3,p4,p5,p6,p7,p8)

p1 = Rz*p1; 
p2 = Rz*p2;
p3 = Rz*p3;
p4 = Rz*p4;
p5 = Rz*p5;
p6 = Rz*p6;
p7 = Rz*p7;
p8 = Rz*p8;
puntos(p1,p2,p3,p4,p5,p6,p7,p8)
pause (0.01)
        end
    end
end