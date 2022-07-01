%*************ETN 1016***********
%***+TELECOMUNICACIONES II*****
%CODIFICACION SHANNON-FANO
%BY. UNIV. CONDORI YUJRA MOISES MARTIN
%limpiando la ventana de comando
clc;            
clear all;
close all;
%ingrsando la cantidad de simbolos y sus respectivas probabilidades
m=input('Ingresar la cantidad de Simbolos: ');
if m<2|| m>16  % condicion que limita la cantidad de simbolos que se debe introducir
    fprintf('\nError!! la cantidad de simbolos es menor a 2 o mayor a 16\n\n');    
else
display('Ingresar las probabilidades de los simbolos:');
for i=1:m   % condicion para el ingreso de las respectivas probabilidades
    fprintf('Simbolo %d:   ',i);% el valor de la probabilidad se muestra en pantalla
    pin(i,1)=input('');
end
for uv=1:m
    prob(uv)=pin(uv,1);
end
for i=1:m           %condicion para que la suma de probabilidades sea igual a 1
for j=1:m-i             
if pin(j,1)<pin(j+1,1)        %realiza la suma de probabilidades de cada 
    aux=pin(j,1);            %simbolo ingresado
    pin(j,1)=pin(j+1,1);
    pin(j+1,1)=aux;
end
end
end
for uv=1:m
    prob2(uv)=pin(uv,1);
end
s=0;
for i=1:m
    s=s+pin(i,1);
end
if (0.99999>s)||(1.00001<s)     %verifica que la suma se igual a 1 haciendo cumplir la anterior condicion
no=fprintf('\n\n Error!!! La Suma de probabilidades no es 1\n\n');    %caso contrario mostrara un mensaje de error
else   
%%cuando la suma se igual a 1 prosigue con el ordenamiento de las
%%probabilidades
variable=1;
for k=1:m
    p(k,1)=variable;
    variable=variable+1;    
end
resu=1;
%se analiza el orden de las probabilidades
for i=1:m
    a=0;
    b=0;
    for j=1:i
        a=a+pin(j,1);
    end
    for k=i+1:m
        b=b+pin(k,1);
    end
    res2=abs(a-b);
    if res2<resu
    resu=res2;
    for jj=1:i
    p(jj,2)=0;
    end
    
    for kk=i+1:m
    p(kk,2)=1;
    end   
    else
    resu=resu;
    end
end

for i=1:m
    for j=3:m+5
     p(i,j)=5;
    end
end
for ll=1:m
    p(m+1,ll)=0;
end
for ii=3:m
    nn=0;
    for kk=1:m 
     %mediante la creacion de un vector se hace la comparacion
    if p(kk,ii-1)~=p(kk+1,ii-1)         %y realiza la respectiva asignacion de unos y ceros
    
    if nn>0; % condicion la cual nos indica que ya no se puede diividir y se iso la
    % asignacion
    res3=1;
    for iii=kk-nn:kk
    d=0;
    e=0;
    for jjj=kk-nn:iii
    d=d+pin(jjj,1);
    end
    for kkk=iii+1:kk
    e=e+pin(kkk,1);
    end
    res4=abs(d-e);
    if res4<res3
    res3=res4;
 
    for jjjjj=kk-nn:iii
    p(jjjjj,ii)=0;
    end
    for kkkkk=iii+1:kk
    p(kkkkk,ii)=1;
    end   
    else
    res3=res3;
    end
    end
    end 
    nn=0;
    else
        nn=nn+1;   
    end
    end
end
for hh=1:m
for ss=1:m+5
pp(hh,ss)=p(hh,ss);
end
end
fprintf('\n');
fprintf('Mensaje\t\tX\t\t Prob    Código');
fprintf('\n');
fprintf('\n');
ent=0;
long=0;
%se realiza el analisis de los resultados, para la creacion de las
%longitudes de pallabras individuales para posteriormente ser sumadas
for tt=1:m
  mm=0;  
    for uu=2:m+5
    if mm==0                            
    if pp(tt,uu)==5                                
    for bb=1:m
    if prob(bb)==prob2(tt)
    fprintf('Simbolo %d\t',bb);
    prob2(tt)=2;
    prob(bb)=3;
    end
    end
   fprintf('X%d\t%10.3f',tt,pin(tt,1));
    for xx=2:uu-1
    fprintf('   %d',pp(tt,xx));
    end
    long=long+((uu-2)*pin(tt,1));        %se calcula la suma de la longitud de palabra total
    fprintf('\n');
    mm=mm+1;                            
    end                            
    end
    end
end
for zz=1:m
    ent=ent+(pin(zz,1)*(log2(1/pin(zz,1))));  %se realiza el calculo de la entropia
end
fprintf('\n');
fprintf('Entropia: H =%1.3f',ent)       %se muestra el valor de la entropia en pantalla 
fprintf('\n');
fprintf('\n');
fprintf('Longitud Promedio de la Palabra: L =%1.3f',long) %se muestra en pantalla la longitud de la palabra
fprintf('\n');
fprintf('\n');
fprintf('Eficiencia: E =%1.3f %',100*(ent/long))  %se calcula y se muestra en el valor de la eficiencia en pantalla
fprintf('\n');
fprintf('\n');
end
end
