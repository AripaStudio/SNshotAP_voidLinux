module CL_executeShell;

import std.stdio;
import std.process;



class CL_executeShell_manager
{

    // for run command : 
    string[] executeShellCommand(string command)
	{
		auto pipes = pipeShell(command, Redirect.stdout | Redirect.stderr);		
		string output = pipes.stdout.byLine.map!(line => line.idup).join("\n");
		string errorOutput = pipes.stderr.byLine.map!(line => line.idup).join("\n");
		int exitCode = pipes.pid.wait();
		return [to!string(exitCode), output, errorOutput];
	}
}