module CL_manager;


import std.stdio;
import CL_executeShell;
import std.string;
import core.stdc.stdlib;

class CL_manager_ScreenShot
{
    public void ScreenShot()
    {

    }

    public void ScreenShot_Copy()
    {

    }

    public void ScreenShot_Save()
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

    public void check_Xfce()
    {

    }

    public string check_package_xfce_screenshooter()
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
            
            
        }catch(Exception e)
        {
            return "Error";
        }

    }

    public bool install_package_xfce_screenshooter()
    {

    }

}