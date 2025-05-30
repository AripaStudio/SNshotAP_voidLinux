module CL_executeShell;

import std.stdio;
import std.process;
import std.string;



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

    void installPackage(string packageName)
    {
        auto process = spawnShell(["sudo", "xbps-install", "-S", packageName], Redirect.stdin | Redirect.stdout | Redirect.stderr);
        auto stdinPipe = process.stdin;
        auto stdoutPipe = process.stdout;
        auto stderrPipe = process.stderr;

        writeln("Please enter your sudo password:");
        string password = readln().strip();
        stdinPipe.writeln(password);
        stdinPipe.close();

        string output = stdoutPipe.byLine.join("\n");
        string errors = stderrPipe.byLine.join("\n");
        int exitCode = process.wait();

        writeln("Output:\n", output);
        if (!errors.empty)
        {
            eprintln("Errors:\n", errors);
        }
        writeln("Exit Code: ", exitCode);
    }
}