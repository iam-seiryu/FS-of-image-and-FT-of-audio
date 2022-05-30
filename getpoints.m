image = input("Type image name: ", 's');
im = imread(image+".jpeg");
imshow(im)
h = drawassisted;
x = (h.Position(:,1))';
y = (h.Position(:,2))';
t = linspace(0,1,length(x));
save(image+".mat",'x','y','t');