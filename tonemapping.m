function [ output ] = tonemapping( input, lav, m )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

output=(1.0-lav^m./(input.^(1.0/2.2)+lav^m)).*255.0;

end

