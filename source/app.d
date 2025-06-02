module app;

import std.stdio;
import std.string;
import core.stdc.stdlib; 
import CL_manager; 
import CL_GLV; 
import std.conv; 


/**
 SNshotAP
 Programmer : khashayar Mobasheri (Abolfazl)
 Studio : Aripa Studio (Aripa Pars Studio)
 V1.0.1
 Start at : 2025-5-30;
 (Iran) 1404-3-9;
 end V1.0.0 at : 2025-5-31;
 V1.0.2 at : 2025-6-2;
 */


class importedClass
{
    public CLManagerPackage mng_package; // Package manager instance
    public CLManagerScreenShot mng_SnShot; // Screenshot manager instance

    this()
    {
        mng_package = new CLManagerPackage();
        mng_SnShot = new CLManagerScreenShot();
    }

    bool Manage_package()
    {
        return mng_package.Manage_package();
    }
}


void main()
{
    auto importedS = new importedClass(); 
    auto _mng_package_result = importedS.Manage_package(); 

    if (_mng_package_result)
    {
        Help_menu(); 
        while (true)
        {
            stdout.write(Cl_GLV.tYELLOW ~ "Enter command: " ~ Cl_GLV.tRESET);
            string rawInput = readln(); // Read the user input
            string strippedInput = rawInput.strip(); // Remove leading/trailing whitespace
            string input = std.string.toLower(strippedInput); // Convert to lowercase for case-insensitive comparison

            switch (input)
            {
                case "ss":
                {
                    importedS.mng_SnShot.ScreenshotSS();
                    writeln(Cl_GLV.tGREEN ~ "Screenshot saved to the Pictures folder." ~ Cl_GLV.tRESET);
                    break;
                }
                case "sc":
                {
                    importedS.mng_SnShot.ScreenshotSC();
                    writeln(Cl_GLV.tGREEN ~ "Screenshot saved to the clipboard." ~ Cl_GLV.tRESET);
                    break;
                }
                case "n":
                {
                    writeln(Cl_GLV.tYELLOW ~ "Please Enter a Number For Timer Screenshot (in seconds):" ~ Cl_GLV.tRESET);
                    string inputN = readln().strip();
                        try
                        {
                            int n = to!int(inputN);
                            importedS.mng_SnShot.ScreenshotTimeN(n);
                            writeln(Cl_GLV.tGREEN ~ "Screenshot taken after "~to!string(n)~" seconds and saved to the Pictures folder." ~ Cl_GLV.tRESET);
                        }
                        catch (Exception e)
                        {
                            writeln(Cl_GLV.tRED ~ "Invalid timer value: " ~ inputN ~ ". " ~ e.msg ~ Cl_GLV.tRESET);
                            writeln(Cl_GLV.tYELLOW ~ "Please enter 'n' and then a valid number." ~ Cl_GLV.tRESET);
                        }
                    break;
                }
                case "cn":
                {
                    writeln(Cl_GLV.tYELLOW ~ "Please Enter a Number For Timer Screenshot (in seconds):" ~ Cl_GLV.tRESET);
                    string inputN = readln().strip();
                        try
                        {
                            int n = to!int(inputN);
                            importedS.mng_SnShot.ScreenshotTimeCN(n);
                            writeln(Cl_GLV.tGREEN ~ "Screenshot taken after "~to!string(n)~" seconds and saved to the clipboard." ~ Cl_GLV.tRESET);
                        }
                        catch (Exception e)
                        {
                            writeln(Cl_GLV.tRED ~ "Invalid timer value: " ~ inputN ~ ". " ~ e.msg ~ Cl_GLV.tRESET);
                            writeln(Cl_GLV.tYELLOW ~ "Please enter 'cn' and then a valid number." ~ Cl_GLV.tRESET);
                        }
                    break;
                }
                case "sw":
                {
                    importedS.mng_SnShot.ScreenshotSW();
                    writeln(Cl_GLV.tGREEN ~ "Attempting to take screenshot of the active window (you might be prompted to save)." ~ Cl_GLV.tRESET);
                    break;
                }
                case "sr":
                {
                    importedS.mng_SnShot.ScreenshotSR();
                    writeln(Cl_GLV.tGREEN ~ "Please select the region to screenshot (you might be prompted to save)." ~ Cl_GLV.tRESET);
                    break;
                }
                case "h":
                case "help":
                {
                    Help_menu();
                    break;
                }
                case "g":
                {
                    importedS.mng_SnShot.OpenScreenshotGui();
                    writeln(Cl_GLV.tGREEN ~ "Opening xfce4-screenshooter GUI." ~ Cl_GLV.tRESET);
                    break;
                }
                case "exit":
                {
                    writeln(Cl_GLV.tRED ~ "Exiting program." ~ Cl_GLV.tRESET);
                    break; // This break exits the switch, then the if (input == "exit") breaks the while loop
                }
                default:
                {
                    writeln(Cl_GLV.tRED ~ "Unknown command. Type 'H' or 'Help' for available commands." ~ Cl_GLV.tRESET);
                }
            }
            if (input == "exit") break; // Exit the main loop if command is "exit"
        }
    }
    else
    {
        writeln(Cl_GLV.tRED ~ "Package manager initialization failed. Program cannot run without XFCE or xfce4-screenshooter." ~ Cl_GLV.tRESET);
    }
}

void Help_menu()
{
    writeln(Cl_GLV.tCYAN, "Welcome to my Program (V1.0.2)");
    writeln(Cl_GLV.tMAGENTA, "This software uses the MIT license.");
    writeln(Cl_GLV.tMAGENTA, "Aripa Studio (Khashayar Mobasheri)");
    writeln("", Cl_GLV.tRESET); 
    writeln(Cl_GLV.tYELLOW, "Commands:");
    writeln(Cl_GLV.tYELLOW, "If you want to Open GUI xfce-screenshooter?");
    writeln(Cl_GLV.tYELLOW, "you can type for this : ", Cl_GLV.tGREEN, "G", Cl_GLV.tRESET);
    writeln("");
    writeln(Cl_GLV.tYELLOW, "Other Commands : ");
    writeln("  ", Cl_GLV.tGREEN, "SS", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot and save it (defaults to the Pictures folder).", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "SC", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot and save it to the clipboard.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "N <seconds>", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot after N seconds (replace <N> with the number of seconds).", Cl_GLV.tRESET);
    writeln(Cl_GLV.tYELLOW, "    Example: enter 'n' and then type a number like '5' for 5 seconds.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "CN <seconds>", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot after N seconds and save it to the clipboard.", Cl_GLV.tRESET);
    writeln(Cl_GLV.tYELLOW, "    Example: enter 'cn' and then type a number like '5' for 5 seconds.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "SW", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a screenshot of the active window.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "SR", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a screenshot of a selected region.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "H", Cl_GLV.tRESET, Cl_GLV.tYELLOW, " or ", Cl_GLV.tGREEN, "Help", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Show this help menu.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "exit", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Exit the program.", Cl_GLV.tRESET);
}
