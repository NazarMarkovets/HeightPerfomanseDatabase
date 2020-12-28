using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace PG
{
    class Program

    {

        

        static void Main(string[] args)
        {
            
            #region varForOperations
            Console.WriteLine($"Enter name of database:");
            string dbname = Console.ReadLine();
            Console.WriteLine($"Enter name of table:");
            dbname += "." + Console.ReadLine();
            Console.WriteLine("Enter count of rows you need");
            int counter = int.Parse(Console.ReadLine());
            //Console.WriteLine($"Enter name of ID column:");
            //string idColumn = Console.ReadLine();
            #endregion

            //Getdata getdata = new Getdata();
            

            #region DecodingData
            

            string filecontent;
            int insertedRows = 0;
            using (StreamReader sr = new StreamReader(@"Dat\data.txt"))
            {
                filecontent = sr.ReadToEnd();
                LinkedList<string> lines = new LinkedList<string>(filecontent.Split('\n'));
                LinkedList<string> longLines = new LinkedList<string>();
                foreach (var line in lines)
                {
                    if(line.Length > 20)
                    {
                        longLines.AddLast(line.Trim());
                        
                    }
                }

                using (StreamWriter w = File.CreateText(@"Dat\FormatedText.txt"))
                {
                    foreach (var l in longLines)
                    {
                        //WriteIntoFile(l, w);
                    }
                }
                using (StreamWriter w = File.CreateText(@"Dat\GeneratedInserts.txt"))
                {
                    foreach (var l in longLines)
                    {
                        if (insertedRows == counter) break;

                        char c = '"';
                        insertedRows++;
                        string statement = $"INSERT INTO {dbname} VALUES ({insertedRows},{c}{l}{c})";
                        //WriteIntoFile(statement, w);

                    }
                }
            }


            #endregion




            using (StreamReader r = File.OpenText(@"Dat\GeneratedInserts.txt"))
            {
                DumpLog(r);
            }


        }

        

        public static void DumpLog(StreamReader r)
        {
            string line;
            while ((line = r.ReadLine()) != null)
            {
                Console.WriteLine(line);
            }
        }
        

    }

}
