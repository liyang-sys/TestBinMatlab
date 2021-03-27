function [ output ] = tonemapping( input, lav, m )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

output=(1.0-lav^m./(input.^(1.0/2.2)+lav^m)).*255.0;

end

