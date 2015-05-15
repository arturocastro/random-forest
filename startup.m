
prefix = pwd;

addpath(prefix);
addpath([ prefix '/MLOtools']);
addpath([ prefix '/MLOtools/External']);
addpath([ prefix '/MLOtools/External/libsvm']);
addpath([ prefix '/MLOtools/Core']);
addpath([ prefix '/MLOtools/Classifiers/HelpText']);
addpath([ prefix '/MLOtools/Classifiers']);
addpath([ prefix '/MLOtools/FSToolbox']);
addpath([ prefix '/MLOtools/MIToolbox']);
addpath([ prefix '/MLOtools/PreprocessingToolbox']);
addpath([ prefix '/MLOtools/61011']);
addpath([ prefix '/MLOtools/61011/data']);
addpath([ prefix '/MLOtools/61011/demlin']);
addpath([ prefix '/MLOtools/61011/demdigits']);
addpath([ prefix '/MLOtools/61011/demgd']);

rmpath(fileparts(which('svmclassify')));

clear prefix
rehash

disp('MLOtools setup is in progress.');
testmlotools
