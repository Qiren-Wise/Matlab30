% get skeleton of an object in a binary image

close all; clear; clc;

warning off all;

imgdat = logical([1, 0, 0; 1, 0, 1; 0, 0, 1]);

retdat = bwmorph(imgdat, 'bridge') % using 'brige' option

imgdat = logical([0, 0, 0; 0, 1, 0; 0, 0, 0]);

retdat = bwmorph(imgdat, 'clean') % using 'clean' option

imgdat = logical([1, 1, 1; 1, 0, 1; 1, 1, 1]);

retdat = bwmorph(imgdat, 'fill') % using 'fill' option