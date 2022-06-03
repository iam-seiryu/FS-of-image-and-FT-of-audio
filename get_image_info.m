% read image file and click the edge of image using your mouse
% get x, y position value and save the position value
file_name = input("Type image name: ", 's');
image = imread("images/"+file_name+".jpeg");
imshow(image)
h = drawassisted;
x = (h.Position(:,1))';
y = (h.Position(:,2))';
t = linspace(0,1,length(x));
save(file_name+".mat",'x','y','t');