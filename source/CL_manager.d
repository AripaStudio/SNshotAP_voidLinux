module CL_manager;


import std.stdio;
import CL_executeShell;
import std.string;
import core.stdc.stdlib;

class CL_manager_ScreenShot
{
    public void Screenshot()
    {
        
    }

    public void Screenshot_Copy()
    {

    }

    public void Screenshot_Save()
    {

    }

    public void Screenshot_TimerSecend()
    {

    }

    public void Screenshot_copy_TimerSecend()
    {

    }

    

    
}

class CL_manager_package
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
            auto exitCode = result[0];
            auto output = result[1];
            auto errorOutput = result[2];

            if(exitCode != 0)
            {
                writefln("Error in Run Command :" , errorOutput);
                return false;
            }
            if(output.empty)
            {
                writeln("you not Use XFCE?");
                return false;
            }

            writeln("You Use XFCE");
            return true;



        }catch(Exception ex)
        {
            writeln("Error in Run Command : " , ex.msg);
            return false;
        }
    }

    public string check_package_xfce_screenshooter(string ErrorManager)
    {
        try
        {

            auto command = "xbps-query -s xfce4-screenshooter";
            auto result = executeShell.executeShellCommand(command);
            auto exitCode = result[0];
            auto output = result[1];
            auto errorOutput = result[2];
            if(exitCode != 0)
            {
                writefln("Error in Run Command :" , errorOutput);
                return "Error";
            }
            if(output.empty)
            {
                writeln("You not have this package in Your System ");
                writeln("To use this software, you must install this package. Do you want to install it? ");
                writeln("for Install : (Y/y) for Exit : (N/n)");
                while(true)
                {
                    string input = readln().tolower().strip();
                    if(input == "y")
                    {
                        return "Install";
                    }else if(input == "n")
                    {
                        return "exit";
                    }else if(input == "help")
                    {
                        writeln("You not have this package in Your System ");
                        writeln("To use this software, you must install this package. Do you want to install it? ");
                        writeln("for Install : (Y/y) for Exit : (N/n)");
                    }else
                    {
                        writeln("Please Enter : (y) or (n) for help you can type : (help)");
                    }
                }
            }else
            {
                return "found";
            }
            
            
        }catch(Exception ex)
        {
            ErrorManager = ex.msg;
            return "Error";
        }

    }

    public bool install_package_xfce_screenshooter()
    {
        string errorManager ;
        auto check_package = check_package_xfce_screenshooter(errorManager);
        switch(check_package)
        {
            case "Error":
            {
                writeln("Errors : ");
                writeln(errorManager);
                break;
            }
            case "found":
            {
                break;
            } 
            case "Install":
            {
                writeln("Start Installing");
                try
                {
                    executeShell.installPackage("xfce4-screenshooter");
                }catch(Exception ex)
                {
                    writeln("Error in Installing Package : ");
                    wirteln(ex.msg);
                }
                break;
            }
            case "exit":
            {
                writefln("Are you sure Want Exit Program?");
                writeln("you must install this package for use this software ");
                writeln("For Exit : (e) and for Download : d");
                while(true)
                {
                    string input = readln().strip().tolower();
                    switch(input)
                    {
                        case "e":
                        {
                            exit(1);
                            break;
                        }
                        case "d":
                        {
                            writeln("Start Installing");
                            try
                            {
                                executeShell.installPackage("xfce4-screenshooter");
                            }catch(Exception ex)
                            {
                                writeln("Error in Installing Package : ");
                                wirteln(ex.msg);
                            }
                            break;
                        }
                        default:
                        {
                            writeln("please enter , for exit (e) | for download (d)");
                        }
                    }
                }
                break;
            }
            default:
            {
                writeln("unknown status (:-)");
            }
        }
    }


//  کامل کردن این متد 
// و کامل کردن کلاس بالایی 
// و در اخر هم فراخوانیش در متد اصلی 
// و انتشار نسخه اولیه 
    void Manage_package()
    {

    }

}