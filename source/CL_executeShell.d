module CL_executeShell;

import std.stdio;
import std.process; // Contains pipeShell, spawnShell, Redirect
import std.string;
import std.algorithm;
import std.conv;

class CL_executeShell_manager
{
    // for run command :
    string[] executeShellCommand(string command)
    {
        // pipeShell returns a Pipes struct, which has stdin, stdout, stderr, and pid
        auto pipes = pipeShell(command, Redirect.stdout | Redirect.stderr);
        string output = pipes.stdout.byLine.map!(line => line.idup).join("\n");
        string errorOutput = pipes.stderr.byLine.map!(line => line.idup).join("\n");
        int exitCode = to!int(pipes.pid.wait()); // Wait for the process to finish
        return [to!string(exitCode), output, errorOutput];
    }

    void installPackage(string packageName)
    {
        // Use pipeShell for installing packages to interact with stdin/stdout/stderr
        auto pipes = pipeShell(["sudo", "xbps-install", "-S", packageName].join(" "),
                               Redirect.stdin | Redirect.stdout | Redirect.stderr);

        auto stdinPipe = pipes.stdin;   // Get the stdin pipe
        auto stdoutPipe = pipes.stdout; // Get the stdout pipe
        auto stderrPipe = pipes.stderr; // Get the stderr pipe

        writeln("Please enter your sudo password:");
        string password = readln().strip();
        stdinPipe.writeln(password); // Write password to stdin pipe
        stdinPipe.close();           // Close stdin pipe to signal end of input

        string output = stdoutPipe.byLine.join("\n");
        string errors = stderrPipe.byLine.join("\n");
        int exitCode = pipes.pid.wait(); // Wait for the process to finish and get exit code

        writeln("Output:\n", output);
        if (!errors.empty)
        {
            stderr.writeln("Errors:\n", errors); // Use stderr.writeln instead of eprintln
        }
        writeln("Exit Code: ", exitCode);
    }
}