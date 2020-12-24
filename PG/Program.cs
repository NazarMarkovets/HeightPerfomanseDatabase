using System;
using System.IO;
using System.Collections.Generic;
using System.Text;

namespace PG
{
    class Program
    
    {

        static void Main(string[] args)
        {
            
            
            #region Streamwriter
             using (StreamWriter w = File.AppendText("log.txt"))
             {
                    Console.WriteLine($"Enter name of database:");
                    string dbname = Console.ReadLine();
                    Console.WriteLine($"Enter name of table:");
                    dbname += "." + Console.ReadLine();
                    Console.WriteLine($"Enter name of Column:");
                    dbname += " SET `" + Console.ReadLine() +"`";
                    Console.WriteLine($"Enter name of ID column:");
                    string idColumn = Console.ReadLine(); 
                    Console.WriteLine("Enter count of inserts");
                    int counter = Int32.Parse(Console.ReadLine());
                    for (var i = 1; i <= counter; i++)
                    {
                        string txt = GenRandomString("АБВГДЕЁЖЗИЙЛКМНОПРСТУФХЧШЩЬЯЮабвгдеёжзийлкмнопрстуфхчшщьяю", 200);
                        WriteIntoFile($"UPDATE {dbname} = '{txt}' WHERE (`{idColumn}` = {i});", w);
                    }
                    //UPDATE `inno`.`user` SET `History` = '1A1E5JIA 6ITUW9EB SS142JD6 GBNZPRJA VA8MF2HD ZG74ZWPD dcdcNZ 6Z14KSAZ 2YUH0HFE' WHERE (`user_id` = '1');
             }
            #endregion

            #region Reader definition

             using (StreamReader r = File.OpenText("log.txt"))
             {
                 DumpLog(r);
             }

            #endregion
            

            string GenRandomString(string Alphabet, int Length)
            {
            
            Random rnd = new Random();            
            StringBuilder sb = new StringBuilder(Length-1);
            int Position = 0;
                        
            for (int i = 0; i < Length; i++)
            {
                Position = rnd.Next(0, Alphabet.Length-1);
                if (i%6 == 0)
                {
                    sb.Append(" ");
                }
                else
                {
                    sb.Append(Alphabet[Position]);
                }
                
                
            }
            
            return sb.ToString();
            }
        }

            #region Write_into_file
            
            public static void WriteIntoFile(string logMessage, TextWriter w)
            { 
                w.WriteLine($"{logMessage}");
            }
    
            #endregion
        
            #region Read_from_file
            public static void DumpLog(StreamReader r)
            {
                string line;
                while ((line = r.ReadLine()) != null)
                {
                    Console.WriteLine(line);
                }
            }    
            #endregion
        
    }
    
}
