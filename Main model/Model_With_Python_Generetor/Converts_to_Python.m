function y = test_for_py(u1,u2,u3)

y = 0;

% coder.extrinsic('py.importlib.import_module')
% coder.extrinsic('py.importlib.reload')
% coder.extrinsic('py.mymod.fun1')
% coder.extrinsic('py.mymod.median')
% coder.extrinsic("pyversion")
% coder.extrinsic("py.math.sqrt")
coder.extrinsic("double")
coder.extrinsic("system")
coder.extrinsic("sprintf")
coder.extrinsic("str2double")


% % coder.extrinsic('py.sys.path')
% % coder.extrinsic('py.mymod.fun2')
% % 
% % if count(py.sys.path,'') == 0
% %     insert(py.sys.path,int32(0),'');
% % end 
% % 
% 
% mod = py.importlib.import_module('mymod');
% py.importlib.reload(mod);

arg1 = u1;
arg2 = u2;
arg3 = u3;


% Call the Python script with the argument and capture the output
command = sprintf('python Python_Code.py %d %d %d', arg1, arg2, arg3);
[status, output] = system(command);
disp(output);

% % 

y = str2double(output);


end

