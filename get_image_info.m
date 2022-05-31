% read image file and click the edge of image using your mouse
% get x, y position value and save the position value
image = input("Type image name: ", 's');
im = imread("images/"+image+".jpeg");
imshow(im)
h = drawassisted;
x = (h.Position(:,1))';
y = (h.Position(:,2))';
t = linspace(0,1,length(x));
save(image+".mat",'x','y','t');