using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using static System.Console;
namespace DataLib
{
    public class Initialize
    {
        public List<Object> List = new List<object>();
        
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

}