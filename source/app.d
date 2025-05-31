import std.stdio;
import CL_manager;


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
    
    auto _mng_package = mng_package.Manage_package();
    if(_mng_package)
    {
        Help_menu();
        while(true)
        {
            
        }
    }else {
        writeln("manager package is false");
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
    writeln("  <N>: Take a full-screen screenshot after N seconds.");
    writeln("  C<N>: Take a full-screen screenshot after N seconds and save it to the clipboard.");
    writeln("  SW: Take a screenshot of the active window.");
    writeln("  SR: Take a screenshot of a selected region.");
    writeln("  H or Help: Show this help menu.");
}
