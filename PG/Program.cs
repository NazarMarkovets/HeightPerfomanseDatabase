using System;
using System.IO;
using System.Collections.Generic;


namespace PG
{
    class Program
    
    {

        //INSERT INTO inno.user
        // (`id`,`name`,`sname`,`age`,`email`,`phone`,`gender`,`fk_user_to_role`,`History`,`registerDate`) 
        // VALUES (1,'Sara','Stroynovskaya',55,'SaraStroynovskayagmail.com','(+380)-66-689-3517',0,1,'just administrator','4/8/2011');

        static void Main(string[] args)
        {
            int cases = 0;
            string dbname, columnInsert;
            
            try
            {
                Console.WriteLine("\nWhat to do:\n1: generate data\t2:generate inserts");
                cases = Int32.Parse(Console.ReadLine());    
            }
            catch (System.Exception)
            {
                throw new ArgumentException("\n You can not use words");
            }

            switch (cases)
            {
                case 1:
                    Console.WriteLine("We generate data");
                    break;

                case 2:
                    Console.WriteLine("We generate inserts");
                    Console.WriteLine($"Enter name of database:");
                    dbname = Console.ReadLine();
                    Console.WriteLine($"Enter name of table:");
                    dbname += "." + Console.ReadLine();        
                    Console.WriteLine ("Enter count of columns");
                    int count = Int32.Parse(Console.ReadLine());
                    try
                    {
                        List <string> arrayColums = new List <string>(count);
                        Console.WriteLine("Enter all column names");
                        arrayColums.Add(Console.ReadLine());
                        
                        foreach (var item in arrayColums)
                        {
                            columnInsert = item;
                            Console.WriteLine(columnInsert); 
                            
                        }
                    }
                    catch (System.Exception ex)
                    {
                        Console.WriteLine($"ArithmeticException Handler: {ex}");
                    }
                break;

                default: break;
            }
            
            #region Streamwriter
            // using (StreamWriter w = File.AppendText("log.txt"))
            // {
            //     Writing("INSERT INTO", w);
            // }
            #endregion

            #region Reader definition

            // using (StreamReader r = File.OpenText("log.txt"))
            // {
            //     DumpLog(r);
            // }

            #endregion
            
        }

            #region WritingProcess
            
            // public static void Writing(string logMessage, TextWriter w)
            // {
            //     w.Write("\r\nLog Entry : ");
            //     w.WriteLine($"{DateTime.Now.ToLongTimeString()} {DateTime.Now.ToLongDateString()}");    
            //     w.WriteLine($"  :{logMessage}");
                
            // }
    
        #endregion
        
        /*
        public static void DumpLog(StreamReader r)
        {
            string line;
            while ((line = r.ReadLine()) != null)
            {
                Console.WriteLine(line);
            }
        }
        */



    }
    
}
