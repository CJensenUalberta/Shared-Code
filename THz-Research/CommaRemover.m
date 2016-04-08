function [ output_args ] = CommaRemover(AsciiFile)
%This function gets rid of those ugly commas that the DaVis 7.1 software
%uses instead of a decimal. It is designed to be in a loop, where the user calls
%it to remove all of the commas in every file.
%*************************************************************************
%The input variable AsciiFile needs to be a string.
%Sample use:
%       A = CommaRemover('MyFile.txt')
%
%*************************************************************************



file = memmapfile(AsciiFile,'writable',true);         %Defining the file as a writable type
comma = uint8(',');                                   %Storing the comma as a variable
point = uint8('.');                                   %Storing the decimal as a variable
file.Data( transpose( file.Data == comma)) = point;   %sending all commas in AsciiFile to decimals


end

