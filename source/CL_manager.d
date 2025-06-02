module CL_manager;

import std.stdio;
import CL_executeShell; 
import std.string;
import CL_GLV;
import core.stdc.stdlib; 
import std.conv; 

class CLManagerScreenShot
{
    CL_executeShell_manager executeShell; 

    this()
    {
        executeShell = new CL_executeShell_manager();
    }

    // Opens the graphical user interface of xfce4-screenshooter
    public void OpenScreenshotGui()
    {
        auto command = "xfce4-screenshooter";
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln(Cl_GLV.tRED ~ "Error opening screenshot GUI: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success, as it typically opens a GUI
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error opening screenshot GUI: " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }

    // Takes a full-screen screenshot and saves it to the default location (e.g., Pictures folder)
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
                writefln(Cl_GLV.tRED ~ "Error checking for Screenshot: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success, as it typically opens a GUI
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error : ScreenShot " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }

    // Takes a full-screen screenshot and saves it to the clipboard
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
                writefln(Cl_GLV.tRED ~ "Error checking for Screenshot: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error : ScreenShot " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }

    // Takes a full-screen screenshot after N seconds and saves it
    public void ScreenshotTimeN(int N)
    {
        if(N <= 0)
        {
            writeln(Cl_GLV.tYELLOW ~ "Input is Empty or invalid. Setting N to 1 second." ~ Cl_GLV.tRESET);
            writeln(Cl_GLV.tYELLOW ~ "<N> = 1S in Default" ~ Cl_GLV.tRESET);
            N = 1;
        }
        auto command = "xfce4-screenshooter -d "~to!string(N)~" -f";
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln(Cl_GLV.tRED ~ "Error checking for Screenshot: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error : ScreenShot " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }

    // Takes a full-screen screenshot after N seconds and saves it to the clipboard
    public void ScreenshotTimeCN(int N)
    {
        if(N <= 0)
        {
            writeln(Cl_GLV.tYELLOW ~ "Input is Empty or invalid. Setting N to 1 second." ~ Cl_GLV.tRESET);
            writeln(Cl_GLV.tYELLOW ~ "<N> = 1S in Default" ~ Cl_GLV.tRESET);
            N = 1;
        }
        auto command = "xfce4-screenshooter -d "~to!string(N)~" -c";
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln(Cl_GLV.tRED ~ "Error checking for Screenshot: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error : ScreenShot " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }

    // Takes a screenshot of the active window
    public void ScreenshotSW()
    {
        auto command = "xfce4-screenshooter -w -s"; // -s is often used for saving, -w for active window
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln(Cl_GLV.tRED ~ "Error checking for Screenshot: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error : ScreenShot " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }

    // Takes a screenshot of a selected region
    public void ScreenshotSR()
    {
        auto command = "xfce4-screenshooter -r -s"; // -r for region, -s for saving
        try
        {
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln(Cl_GLV.tRED ~ "Error checking for Screenshot: %s" ~ Cl_GLV.tRESET, errorOutput);
                return;
            }
            // No specific output expected for success
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error : ScreenShot " ~ ex.msg ~ Cl_GLV.tRESET);
        }
    }
}

// Class to manage XFCE and package related checks
class CLManagerPackage
{
    CL_executeShell_manager executeShell; // Instance of the shell execution manager

    this()
    {
        executeShell = new CL_executeShell_manager();
    }

    // Checks if XFCE is running
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
                writefln(Cl_GLV.tRED ~ "Error checking for XFCE: %s" ~ Cl_GLV.tRESET, errorOutput);
                return false;
            }
            if(output.empty)
            {
                writeln(Cl_GLV.tYELLOW ~ "It seems you are not using XFCE." ~ Cl_GLV.tRESET);
                return false;
            }

            writeln(Cl_GLV.tGREEN ~ "You are using XFCE." ~ Cl_GLV.tRESET);
            return true;
        }
        catch(Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error in checking XFCE: %s" ~ ex.msg ~ Cl_GLV.tRESET);
            return false;
        }
    }

    // Checks if xfce4-screenshooter package is installed
    public string check_package_xfce_screenshooter()
    {
        try
        {
            // Assuming xbps-query is the package manager command for Void Linux
            auto command = "xbps-query -s xfce4-screenshooter";
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = to!int(result[0]);
            auto output = result[1];
            auto errorOutput = result[2];

            if (exitCode != 0)
            {
                writefln(Cl_GLV.tRED ~ "Error checking for xfce4-screenshooter: %s" ~ Cl_GLV.tRESET, errorOutput);
                return "Error";
            }
            if (output.empty)
            {
                writeln(Cl_GLV.tYELLOW ~ "The 'xfce4-screenshooter' package is not installed." ~ Cl_GLV.tRESET);
                writeln(Cl_GLV.tYELLOW ~ "To use this software, you need to install it. Do you want to install it? (Y/n)" ~ Cl_GLV.tRESET);
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
                        writeln(Cl_GLV.tYELLOW ~ "The 'xfce4-screenshooter' package is not installed." ~ Cl_GLV.tRESET);
                        writeln(Cl_GLV.tYELLOW ~ "To use this software, you need to install it. Do you want to install it? (Y/n)" ~ Cl_GLV.tRESET);
                    }
                    else
                    {
                        writeln(Cl_GLV.tYELLOW ~ "Please enter 'y' for install or 'n' for exit. For help, type 'help'." ~ Cl_GLV.tRESET);
                    }
                }
            }
            else
            {
                writeln(Cl_GLV.tGREEN ~ "'xfce4-screenshooter' package is found." ~ Cl_GLV.tRESET);
                return "found";
            }
        }
        catch (Exception ex)
        {
            writeln(Cl_GLV.tRED ~ "Error in checking package: %s" ~ ex.msg ~ Cl_GLV.tRESET);
            return "Error";
        }
    }

    // Installs the xfce4-screenshooter package if not found
    public void install_package_xfce_screenshooter()
    {
        auto check_package = check_package_xfce_screenshooter();
        switch (check_package)
        {
            case "Error":
            {
                writeln(Cl_GLV.tRED ~ "An error occurred while checking the package." ~ Cl_GLV.tRESET);
                break;
            }
            case "found":
            {
                // Package is already found, no action needed
                break;
            }
            case "Install":
            {
                writeln(Cl_GLV.tYELLOW ~ "Starting installation of xfce4-screenshooter..." ~ Cl_GLV.tRESET);
                try
                {
                    executeShell.installPackage("xfce4-screenshooter"); // Assuming this method exists
                    writeln(Cl_GLV.tGREEN ~ "xfce4-screenshooter installed successfully." ~ Cl_GLV.tRESET);
                }
                catch (Exception ex)
                {
                    writeln(Cl_GLV.tRED ~ "Error installing package: %s" ~ ex.msg ~ Cl_GLV.tRESET);
                }
                break;
            }
            case "exit":
            {
                writeln(Cl_GLV.tYELLOW ~ "To use this program, 'xfce4-screenshooter' is required." ~ Cl_GLV.tRESET);
                writeln(Cl_GLV.tYELLOW ~ "Are you sure you want to exit? (e/d)" ~ Cl_GLV.tRESET);
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
                            exit(1); // Exit the program
                            
                        }
                        case "d":
                        {
                            writeln(Cl_GLV.tYELLOW ~ "Starting installation of xfce4-screenshooter..." ~ Cl_GLV.tRESET);
                            try
                            {
                                executeShell.installPackage("xfce4-screenshooter");
                                writeln(Cl_GLV.tGREEN ~ "xfce4-screenshooter installed successfully." ~ Cl_GLV.tRESET);
                                loopExited = true; // Set flag to exit loop
                            }
                            catch (Exception ex)
                            {
                                writeln(Cl_GLV.tRED ~ "Error installing package: %s" ~ ex.msg ~ Cl_GLV.tRESET);
                            }
                            break; // Exit switch, then check loopExited
                        }
                        default:
                        {
                            writeln(Cl_GLV.tYELLOW ~ "Please enter 'e' to exit or 'd' to download." ~ Cl_GLV.tRESET);
                        }
                    }
                    if(loopExited) break; // Exit the while loop if installation was attempted
                }
                break;
            }
            default:
            {
                writeln(Cl_GLV.tRED ~ "Unknown status from package check." ~ Cl_GLV.tRESET);
            }
        }
    }

    // Manages XFCE and xfce4-screenshooter package presence
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
            writeln(Cl_GLV.tYELLOW ~ "This program requires XFCE to run." ~ Cl_GLV.tRESET);
            return false;
        }
    }
}