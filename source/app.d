import std.stdio;
import std.string;
import core.stdc.stdlib;
import CL_manager; 
import std.conv;


    /** 
     SNshotAP 
     Programmer : khashayar Mobasheri (Abolfazl)
     Studio : Aripa Studio (Aripa Pars Studio)
     Start at : 2025-5-30;
     (Iran) 1404-3-9;
     end V1 at : null;
     */


public CLManagerPackage mng_package;
public CLManagerScreenShot mng_SnShot;
this()
{
    mng_package = new CLManagerPackage();
    mng_SnShot = new CLManagerScreenShot();
}

     
     
void main()
{
    auto mng_package = new CLManagerPackage();
    auto _mng_package_result = mng_package.Manage_package();
    if (_mng_package_result)
    {
        Help_menu();
        auto screenshotManager = new CLManagerScreenShot();
        while (true)
        {
            stdout.write("Enter command: ");
            string input = readln().tolower().strip();
            switch (input)
            {
                case "ss":
                {
                    screenshotManager.ScreenshotSS();
                    writeln("Screenshot saved to the Pictures folder.");
                    break;
                }
                case "sc":
                {
                    screenshotManager.ScreenshotSC();
                    writeln("Screenshot saved to the clipboard.");
                    break;
                }
                case "n":
                {
                    if (input.length > 1)
                    {
                        string timeStr = input[1 .. $];
                        try
                        {
                            int n = to!int(timeStr);
                            screenshotManager.ScreenshotTimeN(n);
                            writeln("Screenshot taken after "~n~" seconds and saved to the Pictures folder.");
                        }
                        catch (Exception e)
                        {
                            writeln("Invalid timer value: " ~ timeStr);
                            writeln("Please enter 'n' followed by the number of seconds (e.g., n5).");
                        }
                    }
                    else
                    {
                        writeln("Please enter the timer duration in seconds after 'n' (e.g., n5).");
                    }
                    break;
                }
                case "cn": 
                {
                    if(input.length > 1)
                    {
                        string timeStr = input[1 .. $];
                         try
                        {
                            int n = to!int(timeStr);
                            screenshotManager.ScreenshotTimeCN(n);
                            writeln( "Screenshot taken after "~n~"seconds and saved to the clipboard.");
                        }
                        catch (Exception e)
                        {
                            writeln("Invalid timer value: " ~ timeStr);
                            writeln("Please enter 'n' followed by the number of seconds (e.g., n5).");
                        }
                    }else
                    {
                        writeln("Please enter the timer duration in seconds after 'n' (e.g., n5).");
                    }
                    break;
                }
                case "sw":
                {
                    screenshotManager.ScreenshotSW();
                    writeln("Taking screenshot of the active window (you might be prompted to save).");
                    break;
                }
                case "sr":
                {
                    screenshotManager.ScreenshotSR();
                    writeln("Select the region to screenshot (you might be prompted to save).");
                    break;
                }
                case "h":
                {
                    Help_menu();
                    break;
                }
                case "help":
                {
                    Help_menu();
                    break;
                }
                case "exit":
                {
                    writeln("Exiting program.");
                    break;
                }
                default:
                {
                    writeln("Unknown command. Type 'H' or 'Help' for available commands.");
                }
            }
            if (input == "exit") break;
        }
    }
    else
    {
        writeln("Package manager initialization failed.");
    }
}

void Help_menu()
{
    writeln("Welcome to my Program (V1.0.0)");
    writeln("This software uses the MIT license.");
    writeln("Aripa Studio (Khashayar Mobasheri)");
    writeln("");
    writeln("Commands:");
    writeln("  SS: Take a full-screen screenshot and save it (defaults to the Pictures folder).");
    writeln("  SC: Take a full-screen screenshot and save it to the clipboard.");
    writeln("  N: Take a full-screen screenshot after N seconds (replace <N> with the number of seconds).");
    writeln(" example N : n5");
    writeln("  CN: Take a full-screen screenshot after N seconds and save it to the clipboard.");
    writeln("example CN : cn5");
    writeln("  SW: Take a screenshot of the active window.");
    writeln("  SR: Take a screenshot of a selected region.");
    writeln("  H or Help: Show this help menu.");
    writeln("  exit: Exit the program.");
}
