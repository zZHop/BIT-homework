function printConMat(conMat)
%load result.mat conMat;

[m,n] = size(conMat);
x = 1:m;
y = 1:n;

imagesc(conMat);        %# Create a colored plot of the matrix values  
colormap(flipud(gray)); %# Change the colormap to gray (so higher values are  
                        %#   black and lower values are white)  
  
textStrings = num2str(conMat(:),'%0.02f');      %# Create strings from the matrix values  
textStrings = strtrim(cellstr(textStrings));    %# Remove any space padding  

[sx,sy] = meshgrid(x,y);                      %# Create x and y coordinates for the strings  

hStrings = text(sx(:),sy(:),textStrings(),...     %# Plot the strings  
                'HorizontalAlignment','center');  
midValue = mean(get(gca,'CLim'));               %# Get the middle value of the color range  
textColors = repmat(conMat(:) > midValue,1,3);  %# Choose white or black for the  
                                                %#   text color of the strings so  
                                                %#   they can be easily seen over  
                                                %#   the background color  
set(hStrings,{'Color'},num2cell(textColors,2)); %# Change the text colors  
  
xStrings = strcat('c',num2str(x(:),'%-2d'));
yStrings = strcat('c',num2str(y(:),'%-2d'));

set(gca,'XTick',1:m,...                         %# Change the axes tick marks  
        'XTickLabel',xStrings,...  %#   and tick labels  
        'YTick',1:n,...  
        'YTickLabel',yStrings,...  
        'TickLength',[0 0]);  