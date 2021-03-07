using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using DataLib.Modules;
using static System.Console;
namespace DataLib
{
    public class Initialize
    {
        private List<Object> List;
        
        public void SetInitialData()
        {
            WriteLine($"Enter name of database:");
            List.Add(ReadLine());
            WriteLine($"Enter name of table:");
            List.Add(ReadLine());
            WriteLine("Enter count of rows you need");
            List.Add(ReadLine());
        }
        
        public List<Object> ReturnInitialData()
        {
            return List;
        }

    }

    public class Operat
    {
        
    }
}