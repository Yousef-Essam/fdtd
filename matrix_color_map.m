function matrix_color_map(M,x_name,y_name) 
%x = linspace(1, 3); 
x=linspace(.5,2.5);%to set the x axis from 0 to 3
y=linspace(.5,2.5) ;%to set the y axis from 0 to 3
imagesc(flipud(x),y,M)% to plot anf 'flipud' to have the number on the axis in an increasing way
colormap(jet) % the way of coloring
set(gca,'YDir','normal') %  to have the number on the axis in an increasing way
colorbar % to having a color bar which specify each value with its intensity 
xlabel(x_name);
ylabel(y_name);