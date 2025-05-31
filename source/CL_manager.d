module CL_manager;


import std.stdio;
import CL_executeShell;
import std.string;
import core.stdc.stdlib;
import std.conv;

class CLManagerScreenShot
{

    CL_executeShell_manager executeShell;
    this()
    {
        executeShell = new CL_executeShell_manager();
    }


    public void ScreenshotSS()
    {
        auto command = "xfce4-screenshooter -f";
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]); 
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error checking for Screenshot: %s", errorOutput);
                return;
            }
        }catch(Exception ex)
        {
            writeln("Error : ScreenShot " , ex.msg);
        }
    }

    public void ScreenshotSC()
    {
        auto command = "xfce4-screenshooter -c";
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]); 
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error checking for Screenshot: %s", errorOutput);
                return;
            }
        }catch(Exception ex)
        {
            writeln("Error : ScreenShot " , ex.msg);
        }
    }

    public void ScreenshotTimeN(int N)
    {
        auto command = "xfce4-screenshooter -d "~to!string(N)~" -f"; 
        if(N <= 0)
        {
            writeln("Input is Empth ");
            writeln("<N> = 1S in Default");
            N = 1;
        }
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]); 
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error checking for Screenshot: %s", errorOutput);
                return;
            }
        }catch(Exception ex)
        {
            writeln("Error : ScreenShot " , ex.msg);
        }
    }

    public void ScreenshotTimeCN(int N)
    {
        auto command = "xfce4-screenshooter -d "~to!string(N)~" -c"; 
        if(N <= 0)
        {
            writeln("Input is Empth ");
            writeln("<N> = 1S in Default");
            N = 1;
        }
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]); 
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error checking for Screenshot: %s", errorOutput);
                return;
            }
        }catch(Exception ex)
        {
            writeln("Error : ScreenShot " , ex.msg);
        }
    }

    public void ScreenshotSW()
    {
        auto command = "xfce4-screenshooter -w -s";
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]); 
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error checking for Screenshot: %s", errorOutput);
                return;
            }
        }catch(Exception ex)
        {
            writeln("Error : ScreenShot " , ex.msg);
        }
    }
    public void ScreenshotSR()
    {
        auto command = "xfce4-screenshooter -r -s";
         try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]); 
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error checking for Screenshot: %s", errorOutput);
                return;
            }
        }catch(Exception ex)
        {
            writeln("Error : ScreenShot " , ex.msg);
        }
    }




    

    
}

class CLManagerPackage
{

    CL_executeShell_manager executeShell;
    this()
    {
        executeShell = new CL_executeShell_manager();
    }

    public bool check_Xfce()
    {
        try
        {
            auto command = "pgrep xfce";
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];

            if(exitCode != 0)
            {
                writefln("Error checking for XFCE: %s", errorOutput);
                return false;
            }
            if(output.empty)
            {
                writeln("It seems you are not using XFCE.");
                return false;
            }

            writeln("You are using XFCE.");
            return true;



        }catch(Exception ex)
        {
             writeln("Error in checking XFCE: %s", ex.msg);
            return false;
        }
    }

     public string check_package_xfce_screenshooter()
    {
        try
        {
            auto command = "xbps-query -s xfce4-screenshooter";
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];

            if (exitCode != 0)
            {
                writefln("Error checking for xfce4-screenshooter: %s", errorOutput);
                return "Error";
            }
            if (output.empty)
            {
                writeln("The 'xfce4-screenshooter' package is not installed.");
                writeln("To use this software, you need to install it. Do you want to install it? (Y/n)");
                while (true)
                {
                   string rawInput = readln(); // Read the line
                    string strippedInput = rawInput.strip(); // Strip whitespace
                    string input = std.string.toLower(strippedInput); // Convert to lowercase
                    if (input == "y")
                    {
                        return "Install";
                    }
                    else if (input == "n")
                    {
                        return "exit";
                    }
                    else if (input == "help")
                    {
                        writeln("The 'xfce4-screenshooter' package is not installed.");
                        writeln("To use this software, you need to install it. Do you want to install it? (Y/n)");
                    }
                    else
                    {
                        writeln("Please enter 'y' for install or 'n' for exit. For help, type 'help'.");
                    }
                }
            }
            else
            {
                return "found";
            }
        }
        catch (Exception ex)
        {
            writeln("Error in checking package: %s", ex.msg);
            return "Error";
        }
    }

    public void install_package_xfce_screenshooter()
    {
        auto check_package = check_package_xfce_screenshooter();
        switch (check_package)
        {
            case "Error":
            {
                writeln("An error occurred while checking the package.");
                break;
            }
            case "found":
            {
                break;
            }
            case "Install":
            {
                writeln("Starting installation of xfce4-screenshooter...");
                try
                {
                    executeShell.installPackage("xfce4-screenshooter");
                    writeln("xfce4-screenshooter installed successfully.");
                }
                catch (Exception ex)
                {
                    writeln("Error installing package: %s", ex.msg);
                }
                break;
            }
            case "exit":
            {
                writeln("To use this program, 'xfce4-screenshooter' is required.");
                writeln("Are you sure you want to exit? (e/d)");
                bool loopExited = false;
                while (true)
                {
                    string rawInput = readln(); // Read the line
                    string strippedInput = rawInput.strip(); // Strip whitespace
                    string input = std.string.toLower(strippedInput); // Convert to lowercase
                    switch (input)
                    {
                        case "e":
                        {
                            exit(1);
                        }
                        case "d":
                        {
                            writeln("Starting installation of xfce4-screenshooter...");
                            try
                            {
                                executeShell.installPackage("xfce4-screenshooter");
                                writeln("xfce4-screenshooter installed successfully.");
                                loopExited = true;
                            }
                            catch (Exception ex)
                            {
                                writeln("Error installing package: %s", ex.msg);
                            }
                            break;
                        }
                        default:
                        {
                            writeln("Please enter 'e' to exit or 'd' to download.");
                        }
                        if(loopExited) break;
                    }
                }
                break;
            }
            default:
            {
                writeln("Unknown status.");
            }
        }
    }

    public bool Manage_package()
    {
        auto check_xfce = check_Xfce();
        if (check_xfce)
        {
            install_package_xfce_screenshooter();
            return true;
        }
        else
        {
            writeln("This program requires XFCE to run.");
            return false;
        }
    }

}