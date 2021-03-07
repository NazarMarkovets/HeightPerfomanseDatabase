using System;
using System.Collections.Generic;
using static System.Console;

namespace DataLib.Modules
{
    public class Initialize
    {
        public List<Object> List = new List<object>();
        
        public void SetInitialData()
        {
            WriteLine($"Enter name of database:");
            List.Add(new string(ReadLine()));
            WriteLine($"Enter name of table:");
            List.Add(new string(ReadLine()));
            WriteLine("Enter count of rows you need");
            List.Add(new string(ReadLine()));
        }

        public void SetInitialData(string database, string table, int count)
        {
            List.AddRange(new object[]{database, table, count});
        }
        
        public List<Object> ReturnInitialData()
        {
            return List;
        }

    }

}