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
 V1.0.2 : 
 */




class importedClass
{
    public CLManagerPackage mng_package;
    public CLManagerScreenShot mng_SnShot;

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
            stdout.write("Enter command: ");
            string rawInput = readln(); // Read the line
            string strippedInput = rawInput.strip(); // Strip whitespace
            string input = std.string.toLower(strippedInput); // Convert to lowercase
            switch (input)
            {
                case "ss":
                {
                    importedS.mng_SnShot.ScreenshotSS();
                    writeln("Screenshot saved to the Pictures folder.");
                    break;
                }
                case "sc":
                {
                    importedS.mng_SnShot.ScreenshotSC();
                    writeln("Screenshot saved to the clipboard.");
                    break;
                }
                case "n":
                {
                    writeln("Please Enter a Number For Timer Screenshot ");
                    string inputN = readln().strip();
                        try
                        {
                            int n = to!int(inputN);
                            importedS.mng_SnShot.ScreenshotTimeN(n);
                            writeln("Screenshot taken after "~to!string(n)~" seconds and saved to the Pictures folder.");
                        }
                        catch (Exception e)
                        {
                            writeln("Invalid timer value: " ~ inputN);
                            writeln("Please enter n and enter a number <n>");
                        }
                    
                    break;
                }
                case "cn":
                {
                    writeln("Please Enter a Number For Timer Screenshot ");
                    string inputN = readln().strip();
                        try
                        {
                            int n = to!int(inputN);
                            importedS.mng_SnShot.ScreenshotTimeCN(n);
                            writeln( "Screenshot taken after "~to!string(n)~"seconds and saved to the clipboard.");
                        }
                        catch (Exception e)
                        {
                            writeln("Invalid timer value: " ~ inputN);
                            writeln("Please enter n and enter a number <n>");
                        }                     
                    break;
                }
                case "sw":
                {
                    importedS.mng_SnShot.ScreenshotSW();
                    writeln("Taking screenshot of the active window (you might be prompted to save).");
                    break;
                }
                case "sr":
                {
                    importedS.mng_SnShot.ScreenshotSR();
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
                case "g":
                {
                    importedS.mng_SnShot.OpenScreenshotGui();
                    break;
                }
                case "exit":
                {
                    writeln(Cl_GLV.tRED , "Exiting program." , Cl_GLV.tRESET);
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
     writeln(Cl_GLV.tCYAN, "Welcome to my Program (V1.0.1)");
    writeln(Cl_GLV.tMAGENTA, "This software uses the MIT license.");
    writeln("Aripa Studio (Khashayar Mobasheri)");
    writeln("", Cl_GLV.tRESET);
    writeln(Cl_GLV.tYELLOW, "Commands:");
    writeln("If you want Open GUI xfce-screenshooter ?");
    writeln("you can type for this : ", Cl_GLV.tGREEN, "G", Cl_GLV.tRESET);
    writeln("");
    writeln("other Commands : ");
    writeln("  ", Cl_GLV.tGREEN, "SS", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot and save it (defaults to the Pictures folder).", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "SC", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot and save it to the clipboard.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "N <seconds>", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot after N seconds (replace <N> with the number of seconds).", Cl_GLV.tRESET);
    writeln(Cl_GLV.tYELLOW, " example N : enter n and wait for secend and type a number", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "CN <seconds>", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a full-screen screenshot after N seconds and save it to the clipboard.", Cl_GLV.tRESET);
    writeln(Cl_GLV.tYELLOW, "example CN : enter cn and wait for secend and type a number", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "SW", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a screenshot of the active window.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "SR", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Take a screenshot of a selected region.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "H", Cl_GLV.tRESET, Cl_GLV.tYELLOW, " or ", Cl_GLV.tGREEN, "Help", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Show this help menu.", Cl_GLV.tRESET);
    writeln("  ", Cl_GLV.tGREEN, "exit", Cl_GLV.tRESET, Cl_GLV.tYELLOW, ": Exit the program.", Cl_GLV.tRESET);
}