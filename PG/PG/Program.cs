using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace PG
{
    static class Program

    {

        

        static void Main(string[] args)
        {
            
            #region varForOperations
            
                Console.WriteLine($"Enter name of database:");
                string name = Console.ReadLine();
                Console.WriteLine($"Enter name of table:");
                name += "." + Console.ReadLine();
                Console.WriteLine("Enter count of rows you need");
                int number = int.Parse(Console.ReadLine());
                string idColumn = Console.ReadLine();
            #endregion

            WriteData getdata = new WriteData(dbname: name,number);
            ReadFromFile reader = new ReadFromFile();
            GetUpdates updates = new GetUpdates(name, idColumn, number);
            using (StreamReader sr = new StreamReader(@"Dat\data.txt"))
            {
                var filecontent = sr.ReadToEnd();
                LinkedList<string> lines = new LinkedList<string>(filecontent.Split('\n'));
                LinkedList<string> longLines = new LinkedList<string>();
                foreach (var line in lines)
                {
                    if(line.Length > 20)
                    {
                        longLines.AddLast(line.Trim());
                    }
                }

                foreach (var line in longLines)
                {
                    if (getdata.insertedRows == getdata.counter) break;
                    getdata.oneline = line;
                    getdata.WriteFormatedText(line);
                    getdata.WriteInsert(line);
                }
                
            }
            
            reader.ReadData();
            
        }
        
        
    }

}
