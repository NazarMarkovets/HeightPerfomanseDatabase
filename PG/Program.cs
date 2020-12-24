﻿using System;
using System.IO;
using System.Collections.Generic;
using System.Text;

namespace PG
{
    class Program
    
    {

        //сделать switch для выбора типа операции, вставка, или удаление
        //сделать мультифункциональным Streamwriter

        static void Main(string[] args)
        {
            #region varForOperations
                Console.WriteLine($"Enter name of database:");
                string dbname = Console.ReadLine();
                Console.WriteLine($"Enter name of table:");
                dbname += "." + Console.ReadLine();
                Console.WriteLine("Enter count of rows you need");
                int counter = Int32.Parse(Console.ReadLine());
                Console.WriteLine($"Enter name of ID column:");
                string idColumn = Console.ReadLine(); 
            #endregion
            
            #region GetDataFromFile
            var lines = File.ReadAllLines(@"Dat\name.txt");
            int id = 1;
            foreach (var name in lines)
            {
                if(id > counter) break;
                else{
                string statement = $"INSERT INTO {dbname} VALUES ({id},{name})";
                Console.WriteLine($"\t{statement}");
                id += 1;
                }
                
            }
            #endregion

            
            #region Streamwriter
             using (StreamWriter w = File.AppendText("log.txt"))
             {
                    
                    for (var i = 1; i <= counter; i++)
                    {
                        string txt = GenRandomString("АБВГДЕЁЖЗИЙЛКМНОПРСТУФХЧШЩЬЯЮабвгдеёжзийлкмнопрстуфхчшщьяю", 200);
                        WriteIntoFile($"UPDATE {dbname} = '{txt}' WHERE (`{idColumn}` = {i});", w);
                    }
                    



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
